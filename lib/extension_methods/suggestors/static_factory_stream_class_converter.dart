// ignore: deprecated_member_use
import 'package:analyzer/analyzer.dart';
import 'package:codemod/codemod.dart';

class StaticFactoryStreamClassConverter extends GeneralizingAstVisitor
    with AstVisitingSuggestorMixin {
  static final _oldToNew = {
    'combineLatest': 'CombineLatestStream',
    'combineLatest2': 'CombineLatestStream.combine2',
    'combineLatest3': 'CombineLatestStream.combine3',
    'combineLatest4': 'CombineLatestStream.combine4',
    'combineLatest5': 'CombineLatestStream.combine5',
    'combineLatest6': 'CombineLatestStream.combine6',
    'combineLatest7': 'CombineLatestStream.combine7',
    'combineLatest8': 'CombineLatestStream.combine8',
    'combineLatest9': 'CombineLatestStream.combine9',
    'combineLatestList': 'CombineLatestStream.list',
    'forkJoin': 'ForkJoinStream',
    'forkJoin2': 'ForkJoinStream.combine2',
    'forkJoin3': 'ForkJoinStream.combine3',
    'forkJoin4': 'ForkJoinStream.combine4',
    'forkJoin5': 'ForkJoinStream.combine5',
    'forkJoin6': 'ForkJoinStream.combine6',
    'forkJoin7': 'ForkJoinStream.combine7',
    'forkJoin8': 'ForkJoinStream.combine8',
    'forkJoin9': 'ForkJoinStream.combine9',
    'forkJoinList': 'ForkJoinStream.list',
    'range': 'RangeStream',
    'sequenceEqual': 'SequenceEqualStream',
    'zip': 'ZipStream',
    'zip2': 'ZipStream.zip2',
    'zip3': 'ZipStream.zip3',
    'zip4': 'ZipStream.zip4',
    'zip5': 'ZipStream.zip5',
    'zip6': 'ZipStream.zip6',
    'zip7': 'ZipStream.zip7',
    'zip8': 'ZipStream.zip8',
    'zip9': 'ZipStream.zip9',
    'zipList': 'ZipStream.list',
  };

  static final converters = _oldToNew.keys
      .map((name) => StaticFactoryStreamClassConverter(name))
      .toList();

  final String name;

  StaticFactoryStreamClassConverter(this.name);

  @override
  dynamic visitMethodInvocation(MethodInvocation node) {
    final methodName = node.methodName.name;
    final source = node.toSource();

    if (name == methodName && source.startsWith('Observable.${name}')) {
      yieldPatch(
        node.offset,
        node.methodName.end,
        _oldToNew[methodName],
      );
    }

    return super.visitMethodInvocation(node);
  }
}
