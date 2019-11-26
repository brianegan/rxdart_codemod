// ignore: deprecated_member_use
import 'package:analyzer/analyzer.dart' show GeneralizingAstVisitor, MethodInvocation;
import 'package:codemod/codemod.dart';

class StaticFactoryConverter extends GeneralizingAstVisitor
    with AstVisitingSuggestorMixin {
  static final converters = [
    'combineLatest',
    'combineLatest2',
    'combineLatest3',
    'combineLatest4',
    'combineLatest5',
    'combineLatest6',
    'combineLatest7',
    'combineLatest8',
    'combineLatest9',
    'combineLatestList',
    'forkJoin',
    'forkJoin2',
    'forkJoin3',
    'forkJoin4',
    'forkJoin5',
    'forkJoin6',
    'forkJoin7',
    'forkJoin8',
    'forkJoin9',
    'forkJoinList',
    'range',
    'sequenceEqual',
    'zip',
    'zip2',
    'zip3',
    'zip4',
    'zip5',
    'zip6',
    'zip7',
    'zip8',
    'zip9',
    'zipList',
  ].map((name) => StaticFactoryConverter(name)).toList();

  final String name;

  StaticFactoryConverter(this.name);

  @override
  dynamic visitMethodInvocation(MethodInvocation node) {
    final methodName = node.methodName.name;
    final source = node.toSource();

    if (name == methodName && source.startsWith('Observable.${name}')) {
      yieldPatch(
        node.offset,
        node.methodName.end,
        'Rx.${name}',
      );
    }

    return super.visitMethodInvocation(node);
  }
}
