// ignore: deprecated_member_use
import 'package:analyzer/analyzer.dart';
import 'package:codemod/codemod.dart';

class ObservableCastConverter extends GeneralizingAstVisitor
    with AstVisitingSuggestorMixin {
  static final regex = RegExp(r"(\w+)\ as\ Observable(<\w+>)?");

  @override
  visitParenthesizedExpression(ParenthesizedExpression node) {
    if (_applyPatch(node)) return null;

    return super.visitParenthesizedExpression(node);
  }

  @override
  visitAsExpression(AsExpression node) {
    _applyPatch(node);

    return super.visitAsExpression(node);
  }

  bool _applyPatch(AstNode node) {
    final source = node.toSource();

    if (regex.hasMatch(source)) {
      final matches = regex.firstMatch(source);

      yieldPatch(
        node.offset,
        node.end,
        matches.group(1),
      );

      return true;
    }

    return false;
  }
}
