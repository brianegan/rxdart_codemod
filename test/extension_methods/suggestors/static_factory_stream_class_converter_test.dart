import 'package:codemod/codemod.dart';
import 'package:rxdart_codemod/extension_methods/suggestors/static_factory_stream_class_converter.dart';
import 'package:source_span/source_span.dart';
import 'package:test/test.dart';

void main() {
  group('Static Factories to Stream Classes', () {
    group('combineLatest', () {
      test('Observable.combineLatest -> CombineLatestStream', () {
        final sourceFile = SourceFile.fromString('''
final s = Observable.combineLatest<int, int>(
  [
    Observable.fromIterable([1, 2, 3]),
    Observable.just(2),
    Observable.just(3),
  ],
  (values) => values.fold(0, (acc, val) => acc + val),
);''');
        final expectedOutput = '''
final s = CombineLatestStream<int, int>(
  [
    Observable.fromIterable([1, 2, 3]),
    Observable.just(2),
    Observable.just(3),
  ],
  (values) => values.fold(0, (acc, val) => acc + val),
);''';
        final patches = StaticFactoryStreamClassConverter('combineLatest')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest2 -> CombineLatestStream.combine2', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.combineLatest2<int, int, List<int>>(
      Observable.fromIterable(const [1, 2]),
      Observable.just(3),
      (int first, int second) => [first, second],
    );''');
        final expectedOutput = '''
    final observable = CombineLatestStream.combine2<int, int, List<int>>(
      Observable.fromIterable(const [1, 2]),
      Observable.just(3),
      (int first, int second) => [first, second],
    );''';
        final patches = StaticFactoryStreamClassConverter('combineLatest2')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest3 -> CombineLatestStream.combine3', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.combineLatest3<int, String, double, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      (int first, String second, double third) => [first, second, third],
    );''');
        final expectedOutput = '''
    final observable = CombineLatestStream.combine3<int, String, double, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      (int first, String second, double third) => [first, second, third],
    );''';
        final patches = StaticFactoryStreamClassConverter('combineLatest3')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest4 -> CombineLatestStream.combine4', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.combineLatest4<int, String, double, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      (int first, String second, double third, int fourth) => [first, second, third, fourth],
    );''');
        final expectedOutput = '''
    final observable = CombineLatestStream.combine4<int, String, double, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      (int first, String second, double third, int fourth) => [first, second, third, fourth],
    );''';
        final patches = StaticFactoryStreamClassConverter('combineLatest4')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest5 -> CombineLatestStream.combine5', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.combineLatest5<int, String, double, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      (int first, String second, double third, int fourth, int fifth) => [first, second, third, fourth, fifth],
    );''');
        final expectedOutput = '''
    final observable = CombineLatestStream.combine5<int, String, double, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      (int first, String second, double third, int fourth, int fifth) => [first, second, third, fourth, fifth],
    );''';
        final patches = StaticFactoryStreamClassConverter('combineLatest5')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest6 -> CombineLatestStream.combine6', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.combineLatest6<int, String, double, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      (int first, String second, double third, int fourth, int fifth, int sixth) => [first, second, third, fourth, fifth, sixth],
    );''');
        final expectedOutput = '''
    final observable = CombineLatestStream.combine6<int, String, double, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      (int first, String second, double third, int fourth, int fifth, int sixth) => [first, second, third, fourth, fifth, sixth],
    );''';
        final patches = StaticFactoryStreamClassConverter('combineLatest6')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest7 -> CombineLatestStream.combine7', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.combineLatest7<int, String, double, int, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh) => [first, second, third, fourth, fifth, sixth, seventh],
    );''');
        final expectedOutput = '''
    final observable = CombineLatestStream.combine7<int, String, double, int, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh) => [first, second, third, fourth, fifth, sixth, seventh],
    );''';
        final patches = StaticFactoryStreamClassConverter('combineLatest7')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest8 -> CombineLatestStream.combine8', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.combineLatest8<int, String, double, int, int, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      Observable<double>.just(8),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh, int eighth) => [first, second, third, fourth, fifth, sixth, seventh, eighth],
    );''');
        final expectedOutput = '''
    final observable = CombineLatestStream.combine8<int, String, double, int, int, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      Observable<double>.just(8),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh, int eighth) => [first, second, third, fourth, fifth, sixth, seventh, eighth],
    );''';
        final patches = StaticFactoryStreamClassConverter('combineLatest8')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest9 -> CombineLatestStream.combine9', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.combineLatest9<int, String, double, int, int, int, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      Observable<double>.just(8),
      Observable<double>.just(9),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh, int eighth, int ninth) => [first, second, third, fourth, fifth, sixth, seventh, eighth, ninth],
    );''');
        final expectedOutput = '''
    final observable = CombineLatestStream.combine9<int, String, double, int, int, int, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      Observable<double>.just(8),
      Observable<double>.just(9),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh, int eighth, int ninth) => [first, second, third, fourth, fifth, sixth, seventh, eighth, ninth],
    );''';
        final patches = StaticFactoryStreamClassConverter('combineLatest9')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatestList -> CombineLatestStream.list', () {
        final sourceFile = SourceFile.fromString('''
    final combined = Observable.combineLatestList<int>([
      Observable.fromIterable([1, 2, 3]),
      Observable.just(2),
      Observable.just(3),
    ]);''');
        final expectedOutput = '''
    final combined = CombineLatestStream.list<int>([
      Observable.fromIterable([1, 2, 3]),
      Observable.just(2),
      Observable.just(3),
    ]);''';
        final patches = StaticFactoryStreamClassConverter('combineLatestList')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });
    });

    group('forkJoin', () {
      test('Observable.forkJoin -> ForkJoinStream', () {
        final sourceFile = SourceFile.fromString('''
final s = Observable.forkJoin<int, int>(
  [
    Observable.fromIterable([1, 2, 3]),
    Observable.just(2),
    Observable.just(3),
  ],
  (values) => values.fold(0, (acc, val) => acc + val),
);''');
        final expectedOutput = '''
final s = ForkJoinStream<int, int>(
  [
    Observable.fromIterable([1, 2, 3]),
    Observable.just(2),
    Observable.just(3),
  ],
  (values) => values.fold(0, (acc, val) => acc + val),
);''';
        final patches = StaticFactoryStreamClassConverter('forkJoin')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin2 -> ForkJoinStream.combine2', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.forkJoin2<int, int, List<int>>(
      Observable.fromIterable(const [1, 2]),
      Observable.just(3),
      (int first, int second) => [first, second],
    );''');
        final expectedOutput = '''
    final observable = ForkJoinStream.combine2<int, int, List<int>>(
      Observable.fromIterable(const [1, 2]),
      Observable.just(3),
      (int first, int second) => [first, second],
    );''';
        final patches = StaticFactoryStreamClassConverter('forkJoin2')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin3 -> ForkJoinStream.combine3', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.forkJoin3<int, String, double, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      (int first, String second, double third) => [first, second, third],
    );''');
        final expectedOutput = '''
    final observable = ForkJoinStream.combine3<int, String, double, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      (int first, String second, double third) => [first, second, third],
    );''';
        final patches = StaticFactoryStreamClassConverter('forkJoin3')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin4 -> ForkJoinStream.combine4', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.forkJoin4<int, String, double, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      (int first, String second, double third, int fourth) => [first, second, third, fourth],
    );''');
        final expectedOutput = '''
    final observable = ForkJoinStream.combine4<int, String, double, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      (int first, String second, double third, int fourth) => [first, second, third, fourth],
    );''';
        final patches = StaticFactoryStreamClassConverter('forkJoin4')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin5 -> ForkJoinStream.combine5', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.forkJoin5<int, String, double, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      (int first, String second, double third, int fourth, int fifth) => [first, second, third, fourth, fifth],
    );''');
        final expectedOutput = '''
    final observable = ForkJoinStream.combine5<int, String, double, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      (int first, String second, double third, int fourth, int fifth) => [first, second, third, fourth, fifth],
    );''';
        final patches = StaticFactoryStreamClassConverter('forkJoin5')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin6 -> ForkJoinStream.combine6', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.forkJoin6<int, String, double, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      (int first, String second, double third, int fourth, int fifth, int sixth) => [first, second, third, fourth, fifth, sixth],
    );''');
        final expectedOutput = '''
    final observable = ForkJoinStream.combine6<int, String, double, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      (int first, String second, double third, int fourth, int fifth, int sixth) => [first, second, third, fourth, fifth, sixth],
    );''';
        final patches = StaticFactoryStreamClassConverter('forkJoin6')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin7 -> ForkJoinStream.combine7', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.forkJoin7<int, String, double, int, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh) => [first, second, third, fourth, fifth, sixth, seventh],
    );''');
        final expectedOutput = '''
    final observable = ForkJoinStream.combine7<int, String, double, int, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh) => [first, second, third, fourth, fifth, sixth, seventh],
    );''';
        final patches = StaticFactoryStreamClassConverter('forkJoin7')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin8 -> ForkJoinStream.combine8', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.forkJoin8<int, String, double, int, int, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      Observable<double>.just(8),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh, int eighth) => [first, second, third, fourth, fifth, sixth, seventh, eighth],
    );''');
        final expectedOutput = '''
    final observable = ForkJoinStream.combine8<int, String, double, int, int, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      Observable<double>.just(8),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh, int eighth) => [first, second, third, fourth, fifth, sixth, seventh, eighth],
    );''';
        final patches = StaticFactoryStreamClassConverter('forkJoin8')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin9 -> ForkJoinStream.combine9', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.forkJoin9<int, String, double, int, int, int, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      Observable<double>.just(8),
      Observable<double>.just(9),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh, int eighth, int ninth) => [first, second, third, fourth, fifth, sixth, seventh, eighth, ninth],
    );''');
        final expectedOutput = '''
    final observable = ForkJoinStream.combine9<int, String, double, int, int, int, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      Observable<double>.just(8),
      Observable<double>.just(9),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh, int eighth, int ninth) => [first, second, third, fourth, fifth, sixth, seventh, eighth, ninth],
    );''';
        final patches = StaticFactoryStreamClassConverter('forkJoin9')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoinList -> ForkJoinStream.list', () {
        final sourceFile = SourceFile.fromString('''
    final combined = Observable.forkJoinList<int>([
      Observable.fromIterable([1, 2, 3]),
      Observable.just(2),
      Observable.just(3),
    ]);''');
        final expectedOutput = '''
    final combined = ForkJoinStream.list<int>([
      Observable.fromIterable([1, 2, 3]),
      Observable.just(2),
      Observable.just(3),
    ]);''';
        final patches = StaticFactoryStreamClassConverter('forkJoinList')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });
    });

    test('Observable.sequenceEqual -> SequenceEqualStream', () {
      final sourceFile = SourceFile.fromString('''
    final observable = Observable.sequenceEqual<int, int>(
      Stream.fromIterable(const [1, 2, 3, 4, 5]),
      Stream.fromIterable(const [1, 2, 3, 4, 5]),
    );''');
      final expectedOutput = '''
    final observable = SequenceEqualStream<int, int>(
      Stream.fromIterable(const [1, 2, 3, 4, 5]),
      Stream.fromIterable(const [1, 2, 3, 4, 5]),
    );''';
      final patches = StaticFactoryStreamClassConverter('sequenceEqual')
          .generatePatches(sourceFile);
      expect(patches, hasLength(1));
      expect(applyPatches(sourceFile, patches), expectedOutput);
    });

    group('zip', () {
      test('Observable.zip -> ZipStream', () {
        final sourceFile = SourceFile.fromString('''
final s = Observable.zip<int, int>(
  [
    Observable.fromIterable([1, 2, 3]),
    Observable.just(2),
    Observable.just(3),
  ],
  (values) => values.fold(0, (acc, val) => acc + val),
);''');
        final expectedOutput = '''
final s = ZipStream<int, int>(
  [
    Observable.fromIterable([1, 2, 3]),
    Observable.just(2),
    Observable.just(3),
  ],
  (values) => values.fold(0, (acc, val) => acc + val),
);''';
        final patches = StaticFactoryStreamClassConverter('zip')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip2 -> ZipStream.zip2', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.zip2<int, int, List<int>>(
      Observable.fromIterable(const [1, 2]),
      Observable.just(3),
      (int first, int second) => [first, second],
    );''');
        final expectedOutput = '''
    final observable = ZipStream.zip2<int, int, List<int>>(
      Observable.fromIterable(const [1, 2]),
      Observable.just(3),
      (int first, int second) => [first, second],
    );''';
        final patches = StaticFactoryStreamClassConverter('zip2')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip3 -> ZipStream.zip3', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.zip3<int, String, double, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      (int first, String second, double third) => [first, second, third],
    );''');
        final expectedOutput = '''
    final observable = ZipStream.zip3<int, String, double, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      (int first, String second, double third) => [first, second, third],
    );''';
        final patches = StaticFactoryStreamClassConverter('zip3')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip4 -> ZipStream.zip4', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.zip4<int, String, double, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      (int first, String second, double third, int fourth) => [first, second, third, fourth],
    );''');
        final expectedOutput = '''
    final observable = ZipStream.zip4<int, String, double, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      (int first, String second, double third, int fourth) => [first, second, third, fourth],
    );''';
        final patches = StaticFactoryStreamClassConverter('zip4')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip5 -> ZipStream.zip5', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.zip5<int, String, double, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      (int first, String second, double third, int fourth, int fifth) => [first, second, third, fourth, fifth],
    );''');
        final expectedOutput = '''
    final observable = ZipStream.zip5<int, String, double, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      (int first, String second, double third, int fourth, int fifth) => [first, second, third, fourth, fifth],
    );''';
        final patches = StaticFactoryStreamClassConverter('zip5')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip6 -> ZipStream.zip6', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.zip6<int, String, double, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      (int first, String second, double third, int fourth, int fifth, int sixth) => [first, second, third, fourth, fifth, sixth],
    );''');
        final expectedOutput = '''
    final observable = ZipStream.zip6<int, String, double, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      (int first, String second, double third, int fourth, int fifth, int sixth) => [first, second, third, fourth, fifth, sixth],
    );''';
        final patches = StaticFactoryStreamClassConverter('zip6')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip7 -> ZipStream.zip7', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.zip7<int, String, double, int, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh) => [first, second, third, fourth, fifth, sixth, seventh],
    );''');
        final expectedOutput = '''
    final observable = ZipStream.zip7<int, String, double, int, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh) => [first, second, third, fourth, fifth, sixth, seventh],
    );''';
        final patches = StaticFactoryStreamClassConverter('zip7')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip8 -> ZipStream.zip8', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.zip8<int, String, double, int, int, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      Observable<double>.just(8),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh, int eighth) => [first, second, third, fourth, fifth, sixth, seventh, eighth],
    );''');
        final expectedOutput = '''
    final observable = ZipStream.zip8<int, String, double, int, int, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      Observable<double>.just(8),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh, int eighth) => [first, second, third, fourth, fifth, sixth, seventh, eighth],
    );''';
        final patches = StaticFactoryStreamClassConverter('zip8')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip9 -> ZipStream.zip9', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.zip9<int, String, double, int, int, int, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      Observable<double>.just(8),
      Observable<double>.just(9),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh, int eighth, int ninth) => [first, second, third, fourth, fifth, sixth, seventh, eighth, ninth],
    );''');
        final expectedOutput = '''
    final observable = ZipStream.zip9<int, String, double, int, int, int, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      Observable<double>.just(8),
      Observable<double>.just(9),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh, int eighth, int ninth) => [first, second, third, fourth, fifth, sixth, seventh, eighth, ninth],
    );''';
        final patches = StaticFactoryStreamClassConverter('zip9')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zipList -> ZipStream.list', () {
        final sourceFile = SourceFile.fromString('''
    final combined = Observable.zipList<int>([
      Observable.fromIterable([1, 2, 3]),
      Observable.just(2),
      Observable.just(3),
    ]);''');
        final expectedOutput = '''
    final combined = ZipStream.list<int>([
      Observable.fromIterable([1, 2, 3]),
      Observable.just(2),
      Observable.just(3),
    ]);''';
        final patches = StaticFactoryStreamClassConverter('zipList')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });
    });
  });

  group('Non-Typed Static Factories', () {
    group('combineLatest', () {
      test('Observable.combineLatest -> CombineLatestStream', () {
        final sourceFile = SourceFile.fromString('''
final s = Observable.combineLatest(
  [
    Observable.fromIterable([1, 2, 3]),
    Observable.just(2),
    Observable.just(3),
  ],
  (values) => values.fold(0, (acc, val) => acc + val),
);''');
        final expectedOutput = '''
final s = CombineLatestStream(
  [
    Observable.fromIterable([1, 2, 3]),
    Observable.just(2),
    Observable.just(3),
  ],
  (values) => values.fold(0, (acc, val) => acc + val),
);''';
        final patches = StaticFactoryStreamClassConverter('combineLatest')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest2 -> CombineLatestStream.combine2', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.combineLatest2(
      Observable.fromIterable(const [1, 2]),
      Observable.just(3),
      (int first, int second) => [first, second],
    );''');
        final expectedOutput = '''
    final observable = CombineLatestStream.combine2(
      Observable.fromIterable(const [1, 2]),
      Observable.just(3),
      (int first, int second) => [first, second],
    );''';
        final patches = StaticFactoryStreamClassConverter('combineLatest2')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest3 -> CombineLatestStream.combine3', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.combineLatest3(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      (int first, String second, double third) => [first, second, third],
    );''');
        final expectedOutput = '''
    final observable = CombineLatestStream.combine3(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      (int first, String second, double third) => [first, second, third],
    );''';
        final patches = StaticFactoryStreamClassConverter('combineLatest3')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest4 -> CombineLatestStream.combine4', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.combineLatest4(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      (int first, String second, double third, int fourth) => [first, second, third, fourth],
    );''');
        final expectedOutput = '''
    final observable = CombineLatestStream.combine4(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      (int first, String second, double third, int fourth) => [first, second, third, fourth],
    );''';
        final patches = StaticFactoryStreamClassConverter('combineLatest4')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest5 -> CombineLatestStream.combine5', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.combineLatest5(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      (int first, String second, double third, int fourth, int fifth) => [first, second, third, fourth, fifth],
    );''');
        final expectedOutput = '''
    final observable = CombineLatestStream.combine5(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      (int first, String second, double third, int fourth, int fifth) => [first, second, third, fourth, fifth],
    );''';
        final patches = StaticFactoryStreamClassConverter('combineLatest5')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest6 -> CombineLatestStream.combine6', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.combineLatest6(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      (int first, String second, double third, int fourth, int fifth, int sixth) => [first, second, third, fourth, fifth, sixth],
    );''');
        final expectedOutput = '''
    final observable = CombineLatestStream.combine6(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      (int first, String second, double third, int fourth, int fifth, int sixth) => [first, second, third, fourth, fifth, sixth],
    );''';
        final patches = StaticFactoryStreamClassConverter('combineLatest6')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest7 -> CombineLatestStream.combine7', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.combineLatest7(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh) => [first, second, third, fourth, fifth, sixth, seventh],
    );''');
        final expectedOutput = '''
    final observable = CombineLatestStream.combine7(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh) => [first, second, third, fourth, fifth, sixth, seventh],
    );''';
        final patches = StaticFactoryStreamClassConverter('combineLatest7')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest8 -> CombineLatestStream.combine8', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.combineLatest8(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      Observable<double>.just(8),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh, int eighth) => [first, second, third, fourth, fifth, sixth, seventh, eighth],
    );''');
        final expectedOutput = '''
    final observable = CombineLatestStream.combine8(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      Observable<double>.just(8),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh, int eighth) => [first, second, third, fourth, fifth, sixth, seventh, eighth],
    );''';
        final patches = StaticFactoryStreamClassConverter('combineLatest8')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest9 -> CombineLatestStream.combine9', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.combineLatest9(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      Observable<double>.just(8),
      Observable<double>.just(9),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh, int eighth, int ninth) => [first, second, third, fourth, fifth, sixth, seventh, eighth, ninth],
    );''');
        final expectedOutput = '''
    final observable = CombineLatestStream.combine9(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      Observable<double>.just(8),
      Observable<double>.just(9),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh, int eighth, int ninth) => [first, second, third, fourth, fifth, sixth, seventh, eighth, ninth],
    );''';
        final patches = StaticFactoryStreamClassConverter('combineLatest9')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatestList -> CombineLatestStream.list', () {
        final sourceFile = SourceFile.fromString('''
    final combined = Observable.combineLatestList<int>([
      Observable.fromIterable([1, 2, 3]),
      Observable.just(2),
      Observable.just(3),
    ]);''');
        final expectedOutput = '''
    final combined = CombineLatestStream.list<int>([
      Observable.fromIterable([1, 2, 3]),
      Observable.just(2),
      Observable.just(3),
    ]);''';
        final patches = StaticFactoryStreamClassConverter('combineLatestList')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });
    });

    group('forkJoin', () {
      test('Observable.forkJoin -> ForkJoinStream', () {
        final sourceFile = SourceFile.fromString('''
final s = Observable.forkJoin(
  [
    Observable.fromIterable([1, 2, 3]),
    Observable.just(2),
    Observable.just(3),
  ],
  (values) => values.fold(0, (acc, val) => acc + val),
);''');
        final expectedOutput = '''
final s = ForkJoinStream(
  [
    Observable.fromIterable([1, 2, 3]),
    Observable.just(2),
    Observable.just(3),
  ],
  (values) => values.fold(0, (acc, val) => acc + val),
);''';
        final patches = StaticFactoryStreamClassConverter('forkJoin')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin2 -> ForkJoinStream.combine2', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.forkJoin2(
      Observable.fromIterable(const [1, 2]),
      Observable.just(3),
      (int first, int second) => [first, second],
    );''');
        final expectedOutput = '''
    final observable = ForkJoinStream.combine2(
      Observable.fromIterable(const [1, 2]),
      Observable.just(3),
      (int first, int second) => [first, second],
    );''';
        final patches = StaticFactoryStreamClassConverter('forkJoin2')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin3 -> ForkJoinStream.combine3', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.forkJoin3(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      (int first, String second, double third) => [first, second, third],
    );''');
        final expectedOutput = '''
    final observable = ForkJoinStream.combine3(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      (int first, String second, double third) => [first, second, third],
    );''';
        final patches = StaticFactoryStreamClassConverter('forkJoin3')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin4 -> ForkJoinStream.combine4', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.forkJoin4(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      (int first, String second, double third, int fourth) => [first, second, third, fourth],
    );''');
        final expectedOutput = '''
    final observable = ForkJoinStream.combine4(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      (int first, String second, double third, int fourth) => [first, second, third, fourth],
    );''';
        final patches = StaticFactoryStreamClassConverter('forkJoin4')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin5 -> ForkJoinStream.combine5', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.forkJoin5(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      (int first, String second, double third, int fourth, int fifth) => [first, second, third, fourth, fifth],
    );''');
        final expectedOutput = '''
    final observable = ForkJoinStream.combine5(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      (int first, String second, double third, int fourth, int fifth) => [first, second, third, fourth, fifth],
    );''';
        final patches = StaticFactoryStreamClassConverter('forkJoin5')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin6 -> ForkJoinStream.combine6', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.forkJoin6(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      (int first, String second, double third, int fourth, int fifth, int sixth) => [first, second, third, fourth, fifth, sixth],
    );''');
        final expectedOutput = '''
    final observable = ForkJoinStream.combine6(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      (int first, String second, double third, int fourth, int fifth, int sixth) => [first, second, third, fourth, fifth, sixth],
    );''';
        final patches = StaticFactoryStreamClassConverter('forkJoin6')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin7 -> ForkJoinStream.combine7', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.forkJoin7(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh) => [first, second, third, fourth, fifth, sixth, seventh],
    );''');
        final expectedOutput = '''
    final observable = ForkJoinStream.combine7(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh) => [first, second, third, fourth, fifth, sixth, seventh],
    );''';
        final patches = StaticFactoryStreamClassConverter('forkJoin7')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin8 -> ForkJoinStream.combine8', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.forkJoin8(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      Observable<double>.just(8),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh, int eighth) => [first, second, third, fourth, fifth, sixth, seventh, eighth],
    );''');
        final expectedOutput = '''
    final observable = ForkJoinStream.combine8(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      Observable<double>.just(8),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh, int eighth) => [first, second, third, fourth, fifth, sixth, seventh, eighth],
    );''';
        final patches = StaticFactoryStreamClassConverter('forkJoin8')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin9 -> ForkJoinStream.combine9', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.forkJoin9(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      Observable<double>.just(8),
      Observable<double>.just(9),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh, int eighth, int ninth) => [first, second, third, fourth, fifth, sixth, seventh, eighth, ninth],
    );''');
        final expectedOutput = '''
    final observable = ForkJoinStream.combine9(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      Observable<double>.just(8),
      Observable<double>.just(9),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh, int eighth, int ninth) => [first, second, third, fourth, fifth, sixth, seventh, eighth, ninth],
    );''';
        final patches = StaticFactoryStreamClassConverter('forkJoin9')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoinList -> ForkJoinStream.list', () {
        final sourceFile = SourceFile.fromString('''
    final combined = Observable.forkJoinList<int>([
      Observable.fromIterable([1, 2, 3]),
      Observable.just(2),
      Observable.just(3),
    ]);''');
        final expectedOutput = '''
    final combined = ForkJoinStream.list<int>([
      Observable.fromIterable([1, 2, 3]),
      Observable.just(2),
      Observable.just(3),
    ]);''';
        final patches = StaticFactoryStreamClassConverter('forkJoinList')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });
    });

    test('Observable.range -> RangeStream', () {
      final sourceFile = SourceFile.fromString(
          '''final observable = Observable.range(1, 3);''');
      final expectedOutput = '''final observable = RangeStream(1, 3);''';
      final patches = StaticFactoryStreamClassConverter('range')
          .generatePatches(sourceFile);
      expect(patches, hasLength(1));
      expect(applyPatches(sourceFile, patches), expectedOutput);
    });

    test('Observable.sequenceEqual -> SequenceEqualStream', () {
      final sourceFile = SourceFile.fromString('''
    final observable = Observable.sequenceEqual(
      Stream.fromIterable(const [1, 2, 3, 4, 5]),
      Stream.fromIterable(const [1, 2, 3, 4, 5]),
    );''');
      final expectedOutput = '''
    final observable = SequenceEqualStream(
      Stream.fromIterable(const [1, 2, 3, 4, 5]),
      Stream.fromIterable(const [1, 2, 3, 4, 5]),
    );''';
      final patches = StaticFactoryStreamClassConverter('sequenceEqual')
          .generatePatches(sourceFile);
      expect(patches, hasLength(1));
      expect(applyPatches(sourceFile, patches), expectedOutput);
    });

    group('zip', () {
      test('Observable.zip -> ZipStream', () {
        final sourceFile = SourceFile.fromString('''
final s = Observable.zip(
  [
    Observable.fromIterable([1, 2, 3]),
    Observable.just(2),
    Observable.just(3),
  ],
  (values) => values.fold(0, (acc, val) => acc + val),
);''');
        final expectedOutput = '''
final s = ZipStream(
  [
    Observable.fromIterable([1, 2, 3]),
    Observable.just(2),
    Observable.just(3),
  ],
  (values) => values.fold(0, (acc, val) => acc + val),
);''';
        final patches = StaticFactoryStreamClassConverter('zip')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip2 -> ZipStream.zip2', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.zip2(
      Observable.fromIterable(const [1, 2]),
      Observable.just(3),
      (int first, int second) => [first, second],
    );''');
        final expectedOutput = '''
    final observable = ZipStream.zip2(
      Observable.fromIterable(const [1, 2]),
      Observable.just(3),
      (int first, int second) => [first, second],
    );''';
        final patches = StaticFactoryStreamClassConverter('zip2')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip3 -> ZipStream.zip3', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.zip3(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      (int first, String second, double third) => [first, second, third],
    );''');
        final expectedOutput = '''
    final observable = ZipStream.zip3(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      (int first, String second, double third) => [first, second, third],
    );''';
        final patches = StaticFactoryStreamClassConverter('zip3')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip4 -> ZipStream.zip4', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.zip4(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      (int first, String second, double third, int fourth) => [first, second, third, fourth],
    );''');
        final expectedOutput = '''
    final observable = ZipStream.zip4(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      (int first, String second, double third, int fourth) => [first, second, third, fourth],
    );''';
        final patches = StaticFactoryStreamClassConverter('zip4')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip5 -> ZipStream.zip5', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.zip5(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      (int first, String second, double third, int fourth, int fifth) => [first, second, third, fourth, fifth],
    );''');
        final expectedOutput = '''
    final observable = ZipStream.zip5(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      (int first, String second, double third, int fourth, int fifth) => [first, second, third, fourth, fifth],
    );''';
        final patches = StaticFactoryStreamClassConverter('zip5')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip6 -> ZipStream.zip6', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.zip6(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      (int first, String second, double third, int fourth, int fifth, int sixth) => [first, second, third, fourth, fifth, sixth],
    );''');
        final expectedOutput = '''
    final observable = ZipStream.zip6(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      (int first, String second, double third, int fourth, int fifth, int sixth) => [first, second, third, fourth, fifth, sixth],
    );''';
        final patches = StaticFactoryStreamClassConverter('zip6')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip7 -> ZipStream.zip7', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.zip7(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh) => [first, second, third, fourth, fifth, sixth, seventh],
    );''');
        final expectedOutput = '''
    final observable = ZipStream.zip7(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh) => [first, second, third, fourth, fifth, sixth, seventh],
    );''';
        final patches = StaticFactoryStreamClassConverter('zip7')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip8 -> ZipStream.zip8', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.zip8(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      Observable<double>.just(8),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh, int eighth) => [first, second, third, fourth, fifth, sixth, seventh, eighth],
    );''');
        final expectedOutput = '''
    final observable = ZipStream.zip8(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      Observable<double>.just(8),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh, int eighth) => [first, second, third, fourth, fifth, sixth, seventh, eighth],
    );''';
        final patches = StaticFactoryStreamClassConverter('zip8')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip9 -> ZipStream.zip9', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.zip9(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      Observable<double>.just(8),
      Observable<double>.just(9),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh, int eighth, int ninth) => [first, second, third, fourth, fifth, sixth, seventh, eighth, ninth],
    );''');
        final expectedOutput = '''
    final observable = ZipStream.zip9(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      Observable<double>.just(8),
      Observable<double>.just(9),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh, int eighth, int ninth) => [first, second, third, fourth, fifth, sixth, seventh, eighth, ninth],
    );''';
        final patches = StaticFactoryStreamClassConverter('zip9')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zipList -> ZipStream.list', () {
        final sourceFile = SourceFile.fromString('''
    final combined = Observable.zipList<int>([
      Observable.fromIterable([1, 2, 3]),
      Observable.just(2),
      Observable.just(3),
    ]);''');
        final expectedOutput = '''
    final combined = ZipStream.list<int>([
      Observable.fromIterable([1, 2, 3]),
      Observable.just(2),
      Observable.just(3),
    ]);''';
        final patches = StaticFactoryStreamClassConverter('zipList')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });
    });
  });
}
