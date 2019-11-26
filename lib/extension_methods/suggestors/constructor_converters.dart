// ignore: deprecated_member_use
import 'package:analyzer/analyzer.dart';
import 'package:codemod/codemod.dart';

class ConstructorConverter extends GeneralizingAstVisitor
    with AstVisitingSuggestorMixin {
  @override
  dynamic visitMethodInvocation(MethodInvocation node) {
    if (node.methodName.name == 'Observable') {
      yieldPatch(
        node.offset,
        node.end,
        node.argumentList.arguments.first.toSource(),
      );
    }

    return super.visitMethodInvocation(node);
  }

  @override
  visitInstanceCreationExpression(InstanceCreationExpression node) {
    final constructorSource = node.constructorName.toSource();

    if (constructorSource.contains(RegExp(r"Observable(<(.+)>)?$"))) {
      yieldPatch(
        node.offset,
        node.end,
        node.argumentList.arguments.first.toSource(),
      );
    }

    return super.visitInstanceCreationExpression(node);
  }
}
