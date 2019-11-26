// ignore: deprecated_member_use
import 'package:analyzer/analyzer.dart';
import 'package:codemod/codemod.dart';

class WhereTypeConverter extends GeneralizingAstVisitor
    with AstVisitingSuggestorMixin {
  @override
  visitMethodInvocation(MethodInvocation node) {
    if (node.methodName.name == 'ofType') {
      final regex = RegExp(r"ofType\((new\ )?TypeToken<(\w+)>\(\)\)");
      final source = node.toSource();

      if (regex.hasMatch(source)) {
        final match = regex.firstMatch(source);
        final type = match.group(2);

        yieldPatch(
          node.methodName.offset,
          node.end,
          'whereType<$type>()',
        );
      }
    }

    return super.visitMethodInvocation(node);
  }
}
