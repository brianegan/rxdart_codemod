// ignore: deprecated_member_use
import 'package:analyzer/analyzer.dart';
import 'package:codemod/codemod.dart';

class StreamFactoryConverter extends GeneralizingAstVisitor
    with AstVisitingSuggestorMixin {
  static final converters = [
    'empty',
    'error',
    'eventTransformed',
    'fromFuture',
    'fromIterable',
    'periodic',
    'just',
  ].map((name) => StreamFactoryConverter(name)).toList();

  final String name;

  StreamFactoryConverter(this.name);

  @override
  dynamic visitMethodInvocation(MethodInvocation node) {
    final methodName = node.methodName.name;
    final source = node.toSource();

    if (name == methodName && source.contains('Observable')) {
      final regex = RegExp(r"Observable(<(.+)>)?\.(\w+)");

      if (regex.hasMatch(source)) {
        final match = regex.allMatches(source).first;
        final type = match.group(2);
        final factoryName = match.group(3);
        final streamFactoryName = factoryName == 'just' ? 'value' : factoryName;

        yieldPatch(
          node.offset,
          node.methodName.end,
          type == null
              ? "Stream.$streamFactoryName"
              : "Stream<$type>.$streamFactoryName",
        );
      }
    }

    return super.visitMethodInvocation(node);
  }

  @override
  visitInstanceCreationExpression(InstanceCreationExpression node) {
    final constructorName = node.constructorName.toSource();

    if (constructorName.contains(name) &&
        constructorName.contains('Observable')) {
      final regex = RegExp(r"Observable(<(.+)>)?\.(\w+)");

      if (regex.hasMatch(constructorName)) {
        final match = regex.allMatches(constructorName).first;
        final type = match.group(2);
        final factoryName = match.group(3);
        final streamFactoryName = factoryName == 'just' ? 'value' : factoryName;

        yieldPatch(
          node.offset,
          node.constructorName.end,
          type == null
              ? "Stream.$streamFactoryName"
              : "Stream<$type>.$streamFactoryName",
        );
      }
    }

    return super.visitInstanceCreationExpression(node);
  }
}
