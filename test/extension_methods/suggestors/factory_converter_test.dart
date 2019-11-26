import 'package:codemod/codemod.dart';
import 'package:rxdart_codemod/extension_methods/suggestors/factory_converter.dart';
import 'package:source_span/source_span.dart';
import 'package:test/test.dart';

void main() {
  group('FactoryConverter,', () {
    group('typed w/ new keyword', () {
      test('new Observable.concat -> Rx.concat', () {
        final sourceFile = SourceFile.fromString(
            '''final concatStream = new Observable<int>.concat([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final concatStream = Rx.concat<int>([Stream.value(1), Stream.value(2)]);''';

        final patches = FactoryConverter('concat').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.concatEager -> Rx.concatEager', () {
        final sourceFile = SourceFile.fromString(
            '''final concatEagerStream = new Observable<int>.concatEager([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final concatEagerStream = Rx.concatEager<int>([Stream.value(1), Stream.value(2)]);''';

        final patches =
            FactoryConverter('concatEager').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.defer -> Rx.defer', () {
        final sourceFile = SourceFile.fromString(
            '''final deferStream = new Observable<int>.defer(() => Observable.just(1));''');
        final expectedOutput =
            '''final deferStream = Rx.defer<int>(() => Observable.just(1));''';

        final patches = FactoryConverter('defer').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.merge -> Rx.merge', () {
        final sourceFile = SourceFile.fromString(
            '''final mergeStream = new Observable<int>.merge([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final mergeStream = Rx.merge<int>([Stream.value(1), Stream.value(2)]);''';

        final patches = FactoryConverter('merge').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.never -> Rx.never', () {
        final sourceFile = SourceFile.fromString(
            '''final neverStream = new Observable<int>.never();''');
        final expectedOutput = '''final neverStream = Rx.never<int>();''';

        final patches = FactoryConverter('never').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.race -> Rx.race', () {
        final sourceFile = SourceFile.fromString(
            '''final raceStream = new Observable<int>.race([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final raceStream = Rx.race<int>([Stream.value(1), Stream.value(2)]);''';

        final patches = FactoryConverter('race').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.repeat -> Rx.repeat', () {
        final sourceFile = SourceFile.fromString('''
final repeatStream = new Observable<int>.repeat(() => Stream.value(1));
final repeatStream = new Observable<int>.repeat(() => Stream.value(1), 10);''');
        final expectedOutput = '''
final repeatStream = Rx.repeat<int>(() => Stream.value(1));
final repeatStream = Rx.repeat<int>(() => Stream.value(1), 10);''';

        final patches = FactoryConverter('repeat').generatePatches(sourceFile);

        expect(patches, hasLength(2));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.retry -> Rx.retry', () {
        final sourceFile = SourceFile.fromString(
            '''final retryStream = new Observable<int>.retry(() { Observable.just(1); });''');
        final expectedOutput =
            '''final retryStream = Rx.retry<int>(() { Observable.just(1); });''';

        final patches = FactoryConverter('retry').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.retryWhen -> Rx.retryWhen', () {
        final sourceFile = SourceFile.fromString('''
final retryWhenStream = new Observable<int>.retryWhen(
  () => Stream<int>.fromIterable(<int>[1]),
  (dynamic error, StackTrace s) => throw error,
);''');
        final expectedOutput = '''
final retryWhenStream = Rx.retryWhen<int>(
  () => Stream<int>.fromIterable(<int>[1]),
  (dynamic error, StackTrace s) => throw error,
);''';

        final patches =
            FactoryConverter('retryWhen').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.switchLatest -> Rx.switchLatest', () {
        final sourceFile = SourceFile.fromString('''
final switchLatestStream = new Observable<String>.switchLatest(
  Stream.fromIterable(<Stream<String>>[
    Observable.timer('A', Duration(seconds: 2)),
    Observable.timer('B', Duration(seconds: 1)),
    Observable.just('C'),
  ]),
);''');
        final expectedOutput = '''
final switchLatestStream = Rx.switchLatest<String>(
  Stream.fromIterable(<Stream<String>>[
    Observable.timer('A', Duration(seconds: 2)),
    Observable.timer('B', Duration(seconds: 1)),
    Observable.just('C'),
  ]),
);''';

        final patches =
            FactoryConverter('switchLatest').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.timer -> Rx.timer', () {
        final sourceFile = SourceFile.fromString(
            '''final timerStream = new Observable<String>.timer("hi", Duration(minutes: 1));''');
        final expectedOutput =
            '''final timerStream = Rx.timer<String>("hi", Duration(minutes: 1));''';

        final patches = FactoryConverter('timer').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });
    });

    group('w/ new keyword', () {
      test('new Observable.concat -> Rx.concat', () {
        final sourceFile = SourceFile.fromString(
            '''final concatStream = new Observable.concat([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final concatStream = Rx.concat([Stream.value(1), Stream.value(2)]);''';

        final patches = FactoryConverter('concat').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.concatEager -> Rx.concatEager', () {
        final sourceFile = SourceFile.fromString(
            '''final concatEagerStream = new Observable.concatEager([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final concatEagerStream = Rx.concatEager([Stream.value(1), Stream.value(2)]);''';

        final patches =
            FactoryConverter('concatEager').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.defer -> Rx.defer', () {
        final sourceFile = SourceFile.fromString(
            '''final deferStream = new Observable.defer(() => Observable.just(1));''');
        final expectedOutput =
            '''final deferStream = Rx.defer(() => Observable.just(1));''';

        final patches = FactoryConverter('defer').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.merge -> Rx.merge', () {
        final sourceFile = SourceFile.fromString(
            '''final mergeStream = new Observable.merge([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final mergeStream = Rx.merge([Stream.value(1), Stream.value(2)]);''';

        final patches = FactoryConverter('merge').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.never -> Rx.never', () {
        final sourceFile = SourceFile.fromString(
            '''final neverStream = new Observable.never();''');
        final expectedOutput = '''final neverStream = Rx.never();''';

        final patches = FactoryConverter('never').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.race -> Rx.race', () {
        final sourceFile = SourceFile.fromString(
            '''final raceStream = new Observable.race([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final raceStream = Rx.race([Stream.value(1), Stream.value(2)]);''';

        final patches = FactoryConverter('race').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.repeat -> Rx.repeat', () {
        final sourceFile = SourceFile.fromString('''
final repeatStream = new Observable.repeat(() => Stream.value(1));
final repeatStream = new Observable.repeat(() => Stream.value(1), 10);''');
        final expectedOutput = '''
final repeatStream = Rx.repeat(() => Stream.value(1));
final repeatStream = Rx.repeat(() => Stream.value(1), 10);''';

        final patches = FactoryConverter('repeat').generatePatches(sourceFile);

        expect(patches, hasLength(2));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.retry -> Rx.retry', () {
        final sourceFile = SourceFile.fromString(
            '''final retryStream = new Observable.retry(() => Observable.just(1));''');
        final expectedOutput =
            '''final retryStream = Rx.retry(() => Observable.just(1));''';

        final patches = FactoryConverter('retry').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.retryWhen -> Rx.retryWhen', () {
        final sourceFile = SourceFile.fromString('''
final retryWhenStream = new Observable.retryWhen(
  () => Stream.fromIterable([1]),
  (dynamic error, StackTrace s) => throw error,
);''');
        final expectedOutput = '''
final retryWhenStream = Rx.retryWhen(
  () => Stream.fromIterable([1]),
  (dynamic error, StackTrace s) => throw error,
);''';

        final patches =
            FactoryConverter('retryWhen').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.switchLatest -> Rx.switchLatest', () {
        final sourceFile = SourceFile.fromString('''
final switchLatestStream = new Observable.switchLatest(
  Stream.fromIterable([
    Observable.timer('A', Duration(seconds: 2)),
    Observable.timer('B', Duration(seconds: 1)),
    Observable.just('C'),
  ]),
);''');
        final expectedOutput = '''
final switchLatestStream = Rx.switchLatest(
  Stream.fromIterable([
    Observable.timer('A', Duration(seconds: 2)),
    Observable.timer('B', Duration(seconds: 1)),
    Observable.just('C'),
  ]),
);''';

        final patches =
            FactoryConverter('switchLatest').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.timer -> Rx.timer', () {
        final sourceFile = SourceFile.fromString(
            '''final timerStream = new Observable.timer("hi", Duration(minutes: 1));''');
        final expectedOutput =
            '''final timerStream = Rx.timer("hi", Duration(minutes: 1));''';

        final patches = FactoryConverter('timer').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });
    });

    group('typed w/o new keyword', () {
      test('Observable.concat -> Rx.concat', () {
        final sourceFile = SourceFile.fromString(
            '''final concatStream = Observable<int>.concat([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final concatStream = Rx.concat<int>([Stream.value(1), Stream.value(2)]);''';

        final patches = FactoryConverter('concat').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.concatEager -> Rx.concatEager', () {
        final sourceFile = SourceFile.fromString(
            '''final concatEagerStream = Observable<int>.concatEager([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final concatEagerStream = Rx.concatEager<int>([Stream.value(1), Stream.value(2)]);''';

        final patches =
            FactoryConverter('concatEager').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.defer -> Rx.defer', () {
        final sourceFile = SourceFile.fromString(
            '''final deferStream = Observable<int>.defer(() => Observable.just(1));''');
        final expectedOutput =
            '''final deferStream = Rx.defer<int>(() => Observable.just(1));''';

        final patches = FactoryConverter('defer').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.merge -> Rx.merge', () {
        final sourceFile = SourceFile.fromString(
            '''final mergeStream = Observable<int>.merge([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final mergeStream = Rx.merge<int>([Stream.value(1), Stream.value(2)]);''';

        final patches = FactoryConverter('merge').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.never -> Rx.never', () {
        final sourceFile = SourceFile.fromString(
            '''final neverStream = Observable<int>.never();''');
        final expectedOutput = '''final neverStream = Rx.never<int>();''';

        final patches = FactoryConverter('never').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.race -> Rx.race', () {
        final sourceFile = SourceFile.fromString(
            '''final raceStream = Observable<int>.race([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final raceStream = Rx.race<int>([Stream.value(1), Stream.value(2)]);''';

        final patches = FactoryConverter('race').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.repeat -> Rx.repeat', () {
        final sourceFile = SourceFile.fromString('''
final repeatStream = Observable<int>.repeat(() => Stream.value(1));
final repeatStream = Observable<int>.repeat(() => Stream.value(1), 10);''');
        final expectedOutput = '''
final repeatStream = Rx.repeat<int>(() => Stream.value(1));
final repeatStream = Rx.repeat<int>(() => Stream.value(1), 10);''';

        final patches = FactoryConverter('repeat').generatePatches(sourceFile);

        expect(patches, hasLength(2));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.retry -> Rx.retry', () {
        final sourceFile = SourceFile.fromString(
            '''final retryStream = Observable<int>.retry(() { Observable.just(1); });''');
        final expectedOutput =
            '''final retryStream = Rx.retry<int>(() { Observable.just(1); });''';

        final patches = FactoryConverter('retry').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.retryWhen -> Rx.retryWhen', () {
        final sourceFile = SourceFile.fromString('''
final retryWhenStream = Observable<int>.retryWhen(
  () => Stream<int>.fromIterable(<int>[1]),
  (dynamic error, StackTrace s) => throw error,
);''');
        final expectedOutput = '''
final retryWhenStream = Rx.retryWhen<int>(
  () => Stream<int>.fromIterable(<int>[1]),
  (dynamic error, StackTrace s) => throw error,
);''';

        final patches =
            FactoryConverter('retryWhen').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.switchLatest -> Rx.switchLatest', () {
        final sourceFile = SourceFile.fromString('''
final switchLatestStream = Observable<String>.switchLatest(
  Stream.fromIterable(<Stream<String>>[
    Observable.timer('A', Duration(seconds: 2)),
    Observable.timer('B', Duration(seconds: 1)),
    Observable.just('C'),
  ]),
);''');
        final expectedOutput = '''
final switchLatestStream = Rx.switchLatest<String>(
  Stream.fromIterable(<Stream<String>>[
    Observable.timer('A', Duration(seconds: 2)),
    Observable.timer('B', Duration(seconds: 1)),
    Observable.just('C'),
  ]),
);''';

        final patches =
            FactoryConverter('switchLatest').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.timer -> Rx.timer', () {
        final sourceFile = SourceFile.fromString(
            '''final timerStream = Observable<String>.timer("hi", Duration(minutes: 1));''');
        final expectedOutput =
            '''final timerStream = Rx.timer<String>("hi", Duration(minutes: 1));''';

        final patches = FactoryConverter('timer').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });
    });

    group('w/o new keyword', () {
      test('Observable.concat -> Rx.concat', () {
        final sourceFile = SourceFile.fromString(
            '''final concatStream = Observable.concat([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final concatStream = Rx.concat([Stream.value(1), Stream.value(2)]);''';

        final patches = FactoryConverter('concat').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.concatEager -> Rx.concatEager', () {
        final sourceFile = SourceFile.fromString(
            '''final concatEagerStream = Observable.concatEager([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final concatEagerStream = Rx.concatEager([Stream.value(1), Stream.value(2)]);''';

        final patches =
            FactoryConverter('concatEager').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.defer -> Rx.defer', () {
        final sourceFile = SourceFile.fromString(
            '''final deferStream = Observable.defer(() => Observable.just(1));''');
        final expectedOutput =
            '''final deferStream = Rx.defer(() => Observable.just(1));''';

        final patches = FactoryConverter('defer').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.merge -> Rx.merge', () {
        final sourceFile = SourceFile.fromString(
            '''final mergeStream = Observable.merge([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final mergeStream = Rx.merge([Stream.value(1), Stream.value(2)]);''';

        final patches = FactoryConverter('merge').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.never -> Rx.never', () {
        final sourceFile = SourceFile.fromString(
            '''final neverStream = Observable.never();''');
        final expectedOutput = '''final neverStream = Rx.never();''';

        final patches = FactoryConverter('never').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.race -> Rx.race', () {
        final sourceFile = SourceFile.fromString(
            '''final raceStream = Observable.race([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final raceStream = Rx.race([Stream.value(1), Stream.value(2)]);''';

        final patches = FactoryConverter('race').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.repeat -> Rx.repeat', () {
        final sourceFile = SourceFile.fromString('''
final repeatStream = Observable.repeat(() => Stream.value(1));
final repeatStream = Observable.repeat(() => Stream.value(1), 10);''');
        final expectedOutput = '''
final repeatStream = Rx.repeat(() => Stream.value(1));
final repeatStream = Rx.repeat(() => Stream.value(1), 10);''';

        final patches = FactoryConverter('repeat').generatePatches(sourceFile);

        expect(patches, hasLength(2));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.retry -> Rx.retry', () {
        final sourceFile = SourceFile.fromString(
            '''final retryStream = Observable.retry(() => Observable.just(1));''');
        final expectedOutput =
            '''final retryStream = Rx.retry(() => Observable.just(1));''';

        final patches = FactoryConverter('retry').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.retryWhen -> Rx.retryWhen', () {
        final sourceFile = SourceFile.fromString('''
final retryWhenStream = Observable.retryWhen(
  () => Stream.fromIterable([1]),
  (dynamic error, StackTrace s) => throw error,
);''');
        final expectedOutput = '''
final retryWhenStream = Rx.retryWhen(
  () => Stream.fromIterable([1]),
  (dynamic error, StackTrace s) => throw error,
);''';

        final patches =
            FactoryConverter('retryWhen').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.switchLatest -> Rx.switchLatest', () {
        final sourceFile = SourceFile.fromString('''
final switchLatestStream = Observable.switchLatest(
  Stream.fromIterable([
    Observable.timer('A', Duration(seconds: 2)),
    Observable.timer('B', Duration(seconds: 1)),
    Observable.just('C'),
  ]),
);''');
        final expectedOutput = '''
final switchLatestStream = Rx.switchLatest(
  Stream.fromIterable([
    Observable.timer('A', Duration(seconds: 2)),
    Observable.timer('B', Duration(seconds: 1)),
    Observable.just('C'),
  ]),
);''';

        final patches =
            FactoryConverter('switchLatest').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.timer -> Rx.timer', () {
        final sourceFile = SourceFile.fromString(
            '''final timerStream = Observable.timer("hi", Duration(minutes: 1));''');
        final expectedOutput =
            '''final timerStream = Rx.timer("hi", Duration(minutes: 1));''';

        final patches = FactoryConverter('timer').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });
    });
  });
}
