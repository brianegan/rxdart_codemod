// ignore: deprecated_member_use
import 'package:analyzer/analyzer.dart';
import 'package:codemod/codemod.dart';

class SimpleTypeConverters extends GeneralizingAstVisitor
    with AstVisitingSuggestorMixin {
  static final oldToNew = {
    'Observable': 'Stream',
    'ValueObservable': 'ValueStream',
    'ReplayObservable': 'ReplayStream',
    'ConnectableObservable': 'ConnectableSream',
    'ValueConnectableObservable': 'ValueConnectableStream',
    'ReplayConnectableObservable': 'ReplayConnectableStream',
  };

  static final converters = [
    for (var k in oldToNew.keys) SimpleTypeConverters(k, oldToNew[k])
  ];

  final String name;
  final String replacement;

  SimpleTypeConverters(this.name, this.replacement);

  @override
  visitSimpleIdentifier(SimpleIdentifier node) {
    if (node.name == name) {
      yieldPatch(
        node.offset,
        node.end,
        replacement,
      );
    }
    return super.visitSimpleIdentifier(node);
  }
}
