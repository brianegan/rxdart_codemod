// ignore: deprecated_member_use
import 'package:analyzer/analyzer.dart';
import 'package:codemod/codemod.dart';

class ErrorStreamConverter extends GeneralizingAstVisitor
    with AstVisitingSuggestorMixin {
  @override
  dynamic visitMethodInvocation(MethodInvocation node) {
    if (node.methodName.name == 'ErrorStream') {
      yieldPatch(
          node.offset,
          node.typeArguments != null
              ? node.typeArguments.end
              : node.methodName.end,
          'Stream${node.typeArguments?.toSource() ?? ''}.error');
    }

    return super.visitMethodInvocation(node);
  }

  @override
  visitInstanceCreationExpression(InstanceCreationExpression node) {
    final constructorName = node.constructorName.toSource();
    final regex = RegExp(r"^ErrorStream(<(.+)>)?");

    if (regex.hasMatch(constructorName)) {
      final match = regex.firstMatch(constructorName);
      final type = match.group(2);

      yieldPatch(
        node.offset,
        node.constructorName.end,
        type != null ? 'Stream<$type>.error' : 'Stream.error',
      );
    }

    return super.visitInstanceCreationExpression(node);
  }
}
