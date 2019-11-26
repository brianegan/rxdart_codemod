import 'package:codemod/codemod.dart';
import 'package:rxdart_codemod/extension_methods/suggestors/static_factory_converter.dart';
import 'package:source_span/source_span.dart';
import 'package:test/test.dart';

void main() {
  group('Typed Static Factories', () {
    group('combineLatest', () {
      test('Observable.combineLatest -> Rx.combineLatest', () {
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
final s = Rx.combineLatest<int, int>(
  [
    Observable.fromIterable([1, 2, 3]),
    Observable.just(2),
    Observable.just(3),
  ],
  (values) => values.fold(0, (acc, val) => acc + val),
);''';
        final patches =
            StaticFactoryConverter('combineLatest').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest2 -> Rx.combineLatest2', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.combineLatest2<int, int, List<int>>(
      Observable.fromIterable(const [1, 2]),
      Observable.just(3),
      (int first, int second) => [first, second],
    );''');
        final expectedOutput = '''
    final observable = Rx.combineLatest2<int, int, List<int>>(
      Observable.fromIterable(const [1, 2]),
      Observable.just(3),
      (int first, int second) => [first, second],
    );''';
        final patches = StaticFactoryConverter('combineLatest2')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest3 -> Rx.combineLatest3', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.combineLatest3<int, String, double, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      (int first, String second, double third) => [first, second, third],
    );''');
        final expectedOutput = '''
    final observable = Rx.combineLatest3<int, String, double, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      (int first, String second, double third) => [first, second, third],
    );''';
        final patches = StaticFactoryConverter('combineLatest3')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest4 -> Rx.combineLatest4', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.combineLatest4<int, String, double, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      (int first, String second, double third, int fourth) => [first, second, third, fourth],
    );''');
        final expectedOutput = '''
    final observable = Rx.combineLatest4<int, String, double, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      (int first, String second, double third, int fourth) => [first, second, third, fourth],
    );''';
        final patches = StaticFactoryConverter('combineLatest4')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest5 -> Rx.combineLatest5', () {
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
    final observable = Rx.combineLatest5<int, String, double, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      (int first, String second, double third, int fourth, int fifth) => [first, second, third, fourth, fifth],
    );''';
        final patches = StaticFactoryConverter('combineLatest5')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest6 -> Rx.combineLatest6', () {
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
    final observable = Rx.combineLatest6<int, String, double, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      (int first, String second, double third, int fourth, int fifth, int sixth) => [first, second, third, fourth, fifth, sixth],
    );''';
        final patches = StaticFactoryConverter('combineLatest6')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest7 -> Rx.combineLatest7', () {
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
    final observable = Rx.combineLatest7<int, String, double, int, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh) => [first, second, third, fourth, fifth, sixth, seventh],
    );''';
        final patches = StaticFactoryConverter('combineLatest7')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest8 -> Rx.combineLatest8', () {
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
    final observable = Rx.combineLatest8<int, String, double, int, int, int, int, int, List>(
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
        final patches = StaticFactoryConverter('combineLatest8')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest9 -> Rx.combineLatest9', () {
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
    final observable = Rx.combineLatest9<int, String, double, int, int, int, int, int, int, List>(
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
        final patches = StaticFactoryConverter('combineLatest9')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatestList -> Rx.combineLatestList', () {
        final sourceFile = SourceFile.fromString('''
    final combined = Observable.combineLatestList<int>([
      Observable.fromIterable([1, 2, 3]),
      Observable.just(2),
      Observable.just(3),
    ]);''');
        final expectedOutput = '''
    final combined = Rx.combineLatestList<int>([
      Observable.fromIterable([1, 2, 3]),
      Observable.just(2),
      Observable.just(3),
    ]);''';
        final patches = StaticFactoryConverter('combineLatestList')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });
    });

    group('forkJoin', () {
      test('Observable.forkJoin -> Rx.forkJoin', () {
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
final s = Rx.forkJoin<int, int>(
  [
    Observable.fromIterable([1, 2, 3]),
    Observable.just(2),
    Observable.just(3),
  ],
  (values) => values.fold(0, (acc, val) => acc + val),
);''';
        final patches =
            StaticFactoryConverter('forkJoin').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin2 -> Rx.forkJoin2', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.forkJoin2<int, int, List<int>>(
      Observable.fromIterable(const [1, 2]),
      Observable.just(3),
      (int first, int second) => [first, second],
    );''');
        final expectedOutput = '''
    final observable = Rx.forkJoin2<int, int, List<int>>(
      Observable.fromIterable(const [1, 2]),
      Observable.just(3),
      (int first, int second) => [first, second],
    );''';
        final patches =
            StaticFactoryConverter('forkJoin2').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin3 -> Rx.forkJoin3', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.forkJoin3<int, String, double, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      (int first, String second, double third) => [first, second, third],
    );''');
        final expectedOutput = '''
    final observable = Rx.forkJoin3<int, String, double, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      (int first, String second, double third) => [first, second, third],
    );''';
        final patches =
            StaticFactoryConverter('forkJoin3').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin4 -> Rx.forkJoin4', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.forkJoin4<int, String, double, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      (int first, String second, double third, int fourth) => [first, second, third, fourth],
    );''');
        final expectedOutput = '''
    final observable = Rx.forkJoin4<int, String, double, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      (int first, String second, double third, int fourth) => [first, second, third, fourth],
    );''';
        final patches =
            StaticFactoryConverter('forkJoin4').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin5 -> Rx.forkJoin5', () {
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
    final observable = Rx.forkJoin5<int, String, double, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      (int first, String second, double third, int fourth, int fifth) => [first, second, third, fourth, fifth],
    );''';
        final patches =
            StaticFactoryConverter('forkJoin5').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin6 -> Rx.forkJoin6', () {
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
    final observable = Rx.forkJoin6<int, String, double, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      (int first, String second, double third, int fourth, int fifth, int sixth) => [first, second, third, fourth, fifth, sixth],
    );''';
        final patches =
            StaticFactoryConverter('forkJoin6').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin7 -> Rx.forkJoin7', () {
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
    final observable = Rx.forkJoin7<int, String, double, int, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh) => [first, second, third, fourth, fifth, sixth, seventh],
    );''';
        final patches =
            StaticFactoryConverter('forkJoin7').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin8 -> Rx.forkJoin8', () {
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
    final observable = Rx.forkJoin8<int, String, double, int, int, int, int, int, List>(
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
        final patches =
            StaticFactoryConverter('forkJoin8').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin9 -> Rx.forkJoin9', () {
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
    final observable = Rx.forkJoin9<int, String, double, int, int, int, int, int, int, List>(
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
        final patches =
            StaticFactoryConverter('forkJoin9').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoinList -> Rx.forkJoinList', () {
        final sourceFile = SourceFile.fromString('''
    final combined = Observable.forkJoinList<int>([
      Observable.fromIterable([1, 2, 3]),
      Observable.just(2),
      Observable.just(3),
    ]);''');
        final expectedOutput = '''
    final combined = Rx.forkJoinList<int>([
      Observable.fromIterable([1, 2, 3]),
      Observable.just(2),
      Observable.just(3),
    ]);''';
        final patches =
            StaticFactoryConverter('forkJoinList').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });
    });

    test('Observable.sequenceEqual -> Rx.sequenceEqual', () {
      final sourceFile = SourceFile.fromString('''
    final observable = Observable.sequenceEqual<int, int>(
      Stream.fromIterable(const [1, 2, 3, 4, 5]),
      Stream.fromIterable(const [1, 2, 3, 4, 5]),
    );''');
      final expectedOutput = '''
    final observable = Rx.sequenceEqual<int, int>(
      Stream.fromIterable(const [1, 2, 3, 4, 5]),
      Stream.fromIterable(const [1, 2, 3, 4, 5]),
    );''';
      final patches =
          StaticFactoryConverter('sequenceEqual').generatePatches(sourceFile);
      expect(patches, hasLength(1));
      expect(applyPatches(sourceFile, patches), expectedOutput);
    });

    group('zip', () {
      test('Observable.zip -> Rx.zip', () {
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
final s = Rx.zip<int, int>(
  [
    Observable.fromIterable([1, 2, 3]),
    Observable.just(2),
    Observable.just(3),
  ],
  (values) => values.fold(0, (acc, val) => acc + val),
);''';
        final patches =
            StaticFactoryConverter('zip').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip2 -> Rx.zip2', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.zip2<int, int, List<int>>(
      Observable.fromIterable(const [1, 2]),
      Observable.just(3),
      (int first, int second) => [first, second],
    );''');
        final expectedOutput = '''
    final observable = Rx.zip2<int, int, List<int>>(
      Observable.fromIterable(const [1, 2]),
      Observable.just(3),
      (int first, int second) => [first, second],
    );''';
        final patches =
            StaticFactoryConverter('zip2').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip3 -> Rx.zip3', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.zip3<int, String, double, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      (int first, String second, double third) => [first, second, third],
    );''');
        final expectedOutput = '''
    final observable = Rx.zip3<int, String, double, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      (int first, String second, double third) => [first, second, third],
    );''';
        final patches =
            StaticFactoryConverter('zip3').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip4 -> Rx.zip4', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.zip4<int, String, double, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      (int first, String second, double third, int fourth) => [first, second, third, fourth],
    );''');
        final expectedOutput = '''
    final observable = Rx.zip4<int, String, double, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      (int first, String second, double third, int fourth) => [first, second, third, fourth],
    );''';
        final patches =
            StaticFactoryConverter('zip4').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip5 -> Rx.zip5', () {
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
    final observable = Rx.zip5<int, String, double, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      (int first, String second, double third, int fourth, int fifth) => [first, second, third, fourth, fifth],
    );''';
        final patches =
            StaticFactoryConverter('zip5').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip6 -> Rx.zip6', () {
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
    final observable = Rx.zip6<int, String, double, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      (int first, String second, double third, int fourth, int fifth, int sixth) => [first, second, third, fourth, fifth, sixth],
    );''';
        final patches =
            StaticFactoryConverter('zip6').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip7 -> Rx.zip7', () {
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
    final observable = Rx.zip7<int, String, double, int, int, int, int, List>(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh) => [first, second, third, fourth, fifth, sixth, seventh],
    );''';
        final patches =
            StaticFactoryConverter('zip7').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip8 -> Rx.zip8', () {
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
    final observable = Rx.zip8<int, String, double, int, int, int, int, int, List>(
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
        final patches =
            StaticFactoryConverter('zip8').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip9 -> Rx.zip9', () {
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
    final observable = Rx.zip9<int, String, double, int, int, int, int, int, int, List>(
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
        final patches =
            StaticFactoryConverter('zip9').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zipList -> Rx.zipList', () {
        final sourceFile = SourceFile.fromString('''
    final combined = Observable.zipList<int>([
      Observable.fromIterable([1, 2, 3]),
      Observable.just(2),
      Observable.just(3),
    ]);''');
        final expectedOutput = '''
    final combined = Rx.zipList<int>([
      Observable.fromIterable([1, 2, 3]),
      Observable.just(2),
      Observable.just(3),
    ]);''';
        final patches =
            StaticFactoryConverter('zipList').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });
    });
  });

  group('Non-Typed Static Factories', () {
    group('combineLatest', () {
      test('Observable.combineLatest -> Rx.combineLatest', () {
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
final s = Rx.combineLatest(
  [
    Observable.fromIterable([1, 2, 3]),
    Observable.just(2),
    Observable.just(3),
  ],
  (values) => values.fold(0, (acc, val) => acc + val),
);''';
        final patches =
            StaticFactoryConverter('combineLatest').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest2 -> Rx.combineLatest2', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.combineLatest2(
      Observable.fromIterable(const [1, 2]),
      Observable.just(3),
      (int first, int second) => [first, second],
    );''');
        final expectedOutput = '''
    final observable = Rx.combineLatest2(
      Observable.fromIterable(const [1, 2]),
      Observable.just(3),
      (int first, int second) => [first, second],
    );''';
        final patches = StaticFactoryConverter('combineLatest2')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest3 -> Rx.combineLatest3', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.combineLatest3(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      (int first, String second, double third) => [first, second, third],
    );''');
        final expectedOutput = '''
    final observable = Rx.combineLatest3(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      (int first, String second, double third) => [first, second, third],
    );''';
        final patches = StaticFactoryConverter('combineLatest3')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest4 -> Rx.combineLatest4', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.combineLatest4(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      (int first, String second, double third, int fourth) => [first, second, third, fourth],
    );''');
        final expectedOutput = '''
    final observable = Rx.combineLatest4(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      (int first, String second, double third, int fourth) => [first, second, third, fourth],
    );''';
        final patches = StaticFactoryConverter('combineLatest4')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest5 -> Rx.combineLatest5', () {
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
    final observable = Rx.combineLatest5(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      (int first, String second, double third, int fourth, int fifth) => [first, second, third, fourth, fifth],
    );''';
        final patches = StaticFactoryConverter('combineLatest5')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest6 -> Rx.combineLatest6', () {
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
    final observable = Rx.combineLatest6(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      (int first, String second, double third, int fourth, int fifth, int sixth) => [first, second, third, fourth, fifth, sixth],
    );''';
        final patches = StaticFactoryConverter('combineLatest6')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest7 -> Rx.combineLatest7', () {
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
    final observable = Rx.combineLatest7(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh) => [first, second, third, fourth, fifth, sixth, seventh],
    );''';
        final patches = StaticFactoryConverter('combineLatest7')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest8 -> Rx.combineLatest8', () {
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
    final observable = Rx.combineLatest8(
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
        final patches = StaticFactoryConverter('combineLatest8')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatest9 -> Rx.combineLatest9', () {
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
    final observable = Rx.combineLatest9(
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
        final patches = StaticFactoryConverter('combineLatest9')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.combineLatestList -> Rx.combineLatestList', () {
        final sourceFile = SourceFile.fromString('''
    final combined = Observable.combineLatestList<int>([
      Observable.fromIterable([1, 2, 3]),
      Observable.just(2),
      Observable.just(3),
    ]);''');
        final expectedOutput = '''
    final combined = Rx.combineLatestList<int>([
      Observable.fromIterable([1, 2, 3]),
      Observable.just(2),
      Observable.just(3),
    ]);''';
        final patches = StaticFactoryConverter('combineLatestList')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });
    });

    group('forkJoin', () {
      test('Observable.forkJoin -> Rx.forkJoin', () {
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
final s = Rx.forkJoin(
  [
    Observable.fromIterable([1, 2, 3]),
    Observable.just(2),
    Observable.just(3),
  ],
  (values) => values.fold(0, (acc, val) => acc + val),
);''';
        final patches =
            StaticFactoryConverter('forkJoin').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin2 -> Rx.forkJoin2', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.forkJoin2(
      Observable.fromIterable(const [1, 2]),
      Observable.just(3),
      (int first, int second) => [first, second],
    );''');
        final expectedOutput = '''
    final observable = Rx.forkJoin2(
      Observable.fromIterable(const [1, 2]),
      Observable.just(3),
      (int first, int second) => [first, second],
    );''';
        final patches =
            StaticFactoryConverter('forkJoin2').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin3 -> Rx.forkJoin3', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.forkJoin3(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      (int first, String second, double third) => [first, second, third],
    );''');
        final expectedOutput = '''
    final observable = Rx.forkJoin3(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      (int first, String second, double third) => [first, second, third],
    );''';
        final patches =
            StaticFactoryConverter('forkJoin3').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin4 -> Rx.forkJoin4', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.forkJoin4(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      (int first, String second, double third, int fourth) => [first, second, third, fourth],
    );''');
        final expectedOutput = '''
    final observable = Rx.forkJoin4(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      (int first, String second, double third, int fourth) => [first, second, third, fourth],
    );''';
        final patches =
            StaticFactoryConverter('forkJoin4').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin5 -> Rx.forkJoin5', () {
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
    final observable = Rx.forkJoin5(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      (int first, String second, double third, int fourth, int fifth) => [first, second, third, fourth, fifth],
    );''';
        final patches =
            StaticFactoryConverter('forkJoin5').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin6 -> Rx.forkJoin6', () {
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
    final observable = Rx.forkJoin6(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      (int first, String second, double third, int fourth, int fifth, int sixth) => [first, second, third, fourth, fifth, sixth],
    );''';
        final patches =
            StaticFactoryConverter('forkJoin6').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin7 -> Rx.forkJoin7', () {
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
    final observable = Rx.forkJoin7(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh) => [first, second, third, fourth, fifth, sixth, seventh],
    );''';
        final patches =
            StaticFactoryConverter('forkJoin7').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin8 -> Rx.forkJoin8', () {
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
    final observable = Rx.forkJoin8(
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
        final patches =
            StaticFactoryConverter('forkJoin8').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoin9 -> Rx.forkJoin9', () {
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
    final observable = Rx.forkJoin9(
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
        final patches =
            StaticFactoryConverter('forkJoin9').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.forkJoinList -> Rx.forkJoinList', () {
        final sourceFile = SourceFile.fromString('''
    final combined = Observable.forkJoinList<int>([
      Observable.fromIterable([1, 2, 3]),
      Observable.just(2),
      Observable.just(3),
    ]);''');
        final expectedOutput = '''
    final combined = Rx.forkJoinList<int>([
      Observable.fromIterable([1, 2, 3]),
      Observable.just(2),
      Observable.just(3),
    ]);''';
        final patches =
            StaticFactoryConverter('forkJoinList').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });
    });

    test('Observable.range -> Rx.range', () {
      final sourceFile = SourceFile.fromString(
          '''final observable = Observable.range(1, 3);''');
      final expectedOutput = '''final observable = Rx.range(1, 3);''';
      final patches =
          StaticFactoryConverter('range').generatePatches(sourceFile);
      expect(patches, hasLength(1));
      expect(applyPatches(sourceFile, patches), expectedOutput);
    });

    test('Observable.sequenceEqual -> Rx.sequenceEqual', () {
      final sourceFile = SourceFile.fromString('''
    final observable = Observable.sequenceEqual(
      Stream.fromIterable(const [1, 2, 3, 4, 5]),
      Stream.fromIterable(const [1, 2, 3, 4, 5]),
    );''');
      final expectedOutput = '''
    final observable = Rx.sequenceEqual(
      Stream.fromIterable(const [1, 2, 3, 4, 5]),
      Stream.fromIterable(const [1, 2, 3, 4, 5]),
    );''';
      final patches =
          StaticFactoryConverter('sequenceEqual').generatePatches(sourceFile);
      expect(patches, hasLength(1));
      expect(applyPatches(sourceFile, patches), expectedOutput);
    });

    group('zip', () {
      test('Observable.zip -> Rx.zip', () {
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
final s = Rx.zip(
  [
    Observable.fromIterable([1, 2, 3]),
    Observable.just(2),
    Observable.just(3),
  ],
  (values) => values.fold(0, (acc, val) => acc + val),
);''';
        final patches =
            StaticFactoryConverter('zip').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip2 -> Rx.zip2', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.zip2(
      Observable.fromIterable(const [1, 2]),
      Observable.just(3),
      (int first, int second) => [first, second],
    );''');
        final expectedOutput = '''
    final observable = Rx.zip2(
      Observable.fromIterable(const [1, 2]),
      Observable.just(3),
      (int first, int second) => [first, second],
    );''';
        final patches =
            StaticFactoryConverter('zip2').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip3 -> Rx.zip3', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.zip3(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      (int first, String second, double third) => [first, second, third],
    );''');
        final expectedOutput = '''
    final observable = Rx.zip3(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      (int first, String second, double third) => [first, second, third],
    );''';
        final patches =
            StaticFactoryConverter('zip3').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip4 -> Rx.zip4', () {
        final sourceFile = SourceFile.fromString('''
    final observable = Observable.zip4(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      (int first, String second, double third, int fourth) => [first, second, third, fourth],
    );''');
        final expectedOutput = '''
    final observable = Rx.zip4(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      (int first, String second, double third, int fourth) => [first, second, third, fourth],
    );''';
        final patches =
            StaticFactoryConverter('zip4').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip5 -> Rx.zip5', () {
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
    final observable = Rx.zip5(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      (int first, String second, double third, int fourth, int fifth) => [first, second, third, fourth, fifth],
    );''';
        final patches =
            StaticFactoryConverter('zip5').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip6 -> Rx.zip6', () {
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
    final observable = Rx.zip6(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      (int first, String second, double third, int fourth, int fifth, int sixth) => [first, second, third, fourth, fifth, sixth],
    );''';
        final patches =
            StaticFactoryConverter('zip6').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip7 -> Rx.zip7', () {
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
    final observable = Rx.zip7(
      Observable<int>.just(1),
      Observable<String>.just("2"),
      Observable<double>.just(3.0),
      Observable<double>.just(4),
      Observable<double>.just(5),
      Observable<double>.just(6),
      Observable<double>.just(7),
      (int first, String second, double third, int fourth, int fifth, int sixth, int seventh) => [first, second, third, fourth, fifth, sixth, seventh],
    );''';
        final patches =
            StaticFactoryConverter('zip7').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip8 -> Rx.zip8', () {
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
    final observable = Rx.zip8(
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
        final patches =
            StaticFactoryConverter('zip8').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zip9 -> Rx.zip9', () {
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
    final observable = Rx.zip9(
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
        final patches =
            StaticFactoryConverter('zip9').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.zipList -> Rx.zipList', () {
        final sourceFile = SourceFile.fromString('''
    final combined = Observable.zipList<int>([
      Observable.fromIterable([1, 2, 3]),
      Observable.just(2),
      Observable.just(3),
    ]);''');
        final expectedOutput = '''
    final combined = Rx.zipList<int>([
      Observable.fromIterable([1, 2, 3]),
      Observable.just(2),
      Observable.just(3),
    ]);''';
        final patches =
            StaticFactoryConverter('zipList').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });
    });
  });
}
