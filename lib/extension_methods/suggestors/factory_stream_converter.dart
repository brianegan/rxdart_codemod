// ignore: deprecated_member_use
import 'package:analyzer/analyzer.dart';
import 'package:codemod/codemod.dart';

class FactoryStreamConverter extends GeneralizingAstVisitor
    with AstVisitingSuggestorMixin {
  static final _oldToNew = {
    'concat': 'ConcatStream',
    'concatEager': 'ConcatEagerStream',
    'defer': 'DeferStream',
    'merge': 'MergeStream',
    'never': 'NeverStream',
    'race': 'RaceStream',
    'repeat': 'RepeatStream',
    'retry': 'RetryStream',
    'retryWhen': 'RetryWhenStream',
    'switchLatest': 'SwitchLatestStream',
    'timer': 'TimerStream',
  };

  static final converters =
      _oldToNew.keys.map((name) => FactoryStreamConverter(name)).toList();

  final String name;

  FactoryStreamConverter(this.name);

  @override
  dynamic visitMethodInvocation(MethodInvocation node) {
    final methodName = node.methodName.name;
    final source = node.toSource();

    if (name == methodName && source.contains('Observable')) {
      yieldPatch(
        node.offset,
        node.methodName.end,
        _oldToNew[methodName],
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
          type == null
              ? _oldToNew[factoryName]
              : "${_oldToNew[factoryName]}<$type>",
        );
      }
    }

    return super.visitInstanceCreationExpression(node);
  }
}
