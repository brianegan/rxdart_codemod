// ignore: deprecated_member_use
import 'package:analyzer/analyzer.dart';
import 'package:codemod/codemod.dart';

class AsObservableConverter extends GeneralizingAstVisitor
    with AstVisitingSuggestorMixin {
  @override
  visitMethodInvocation(MethodInvocation node) {
    if (node.methodName.name == 'asObservable') {
      yieldPatch(
        node.methodName.offset,
        node.methodName.end,
        'asStream',
      );
    }

    return super.visitMethodInvocation(node);
  }
}
