// ignore: deprecated_member_use
import 'package:analyzer/analyzer.dart';
import 'package:codemod/codemod.dart';

class ConcatMapConverter extends GeneralizingAstVisitor
    with AstVisitingSuggestorMixin {
  @override
  visitMethodInvocation(MethodInvocation node) {
    if (node.methodName.name == 'concatMap') {
      yieldPatch(
        node.methodName.offset,
        node.methodName.end,
        'asyncExpand',
      );
    }

    return super.visitMethodInvocation(node);
  }
}
