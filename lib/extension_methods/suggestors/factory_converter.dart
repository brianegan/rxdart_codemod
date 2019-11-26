// ignore: deprecated_member_use
import 'package:analyzer/analyzer.dart';
import 'package:codemod/codemod.dart';

class FactoryConverter extends GeneralizingAstVisitor
    with AstVisitingSuggestorMixin {
  static final converters = [
    'concat',
    'concatEager',
    'defer',
    'merge',
    'never',
    'race',
    'repeat',
    'retry',
    'retryWhen',
    'switchLatest',
    'timer',
  ].map((name) => FactoryConverter(name)).toList();

  final String name;

  FactoryConverter(this.name);

  @override
  dynamic visitMethodInvocation(MethodInvocation node) {
    final methodName = node.methodName.name;
    final source = node.toSource();

    if (name == methodName && source.contains('Observable')) {
      yieldPatch(
        node.offset,
        node.methodName.end,
        'Rx.${methodName}',
      );
    }

    return super.visitMethodInvocation(node);
  }

  @override
  visitInstanceCreationExpression(InstanceCreationExpression node) {
    final constructorName = node.constructorName.toSource();

    if (constructorName.contains(name)) {
      final regex = RegExp(r"Observable(<(.+)>)?\.(\w+)");

      if (regex.hasMatch(constructorName)) {
        final match = regex.allMatches(constructorName).first;
        final type = match.group(2);
        final factoryName = match.group(3);

        yieldPatch(
          node.offset,
          node.constructorName.end,
          type == null ? "Rx.$factoryName" : "Rx.$factoryName<$type>",
        );
      }
    }

    return super.visitInstanceCreationExpression(node);
  }
}
