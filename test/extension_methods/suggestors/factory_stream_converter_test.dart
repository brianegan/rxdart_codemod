import 'package:codemod/codemod.dart';
import 'package:rxdart_codemod/extension_methods/suggestors/factory_stream_converter.dart';
import 'package:source_span/source_span.dart';
import 'package:test/test.dart';

void main() {
  group('FactoryStreamConverter,', () {
    group('typed w/ new keyword', () {
      test('new Observable.concat -> ConcatStream', () {
        final sourceFile = SourceFile.fromString(
            '''final concatStream = new Observable<int>.concat([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final concatStream = ConcatStream<int>([Stream.value(1), Stream.value(2)]);''';

        final patches =
            FactoryStreamConverter('concat').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.concatEager -> ConcatEagerStream', () {
        final sourceFile = SourceFile.fromString(
            '''final concatEagerStream = new Observable<int>.concatEager([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final concatEagerStream = ConcatEagerStream<int>([Stream.value(1), Stream.value(2)]);''';

        final patches =
            FactoryStreamConverter('concatEager').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.defer -> DeferStream', () {
        final sourceFile = SourceFile.fromString(
            '''final deferStream = new Observable<int>.defer(() => Observable.just(1));''');
        final expectedOutput =
            '''final deferStream = DeferStream<int>(() => Observable.just(1));''';

        final patches =
            FactoryStreamConverter('defer').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.merge -> MergeStream', () {
        final sourceFile = SourceFile.fromString(
            '''final mergeStream = new Observable<int>.merge([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final mergeStream = MergeStream<int>([Stream.value(1), Stream.value(2)]);''';

        final patches =
            FactoryStreamConverter('merge').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.never -> NeverStream', () {
        final sourceFile = SourceFile.fromString(
            '''final neverStream = new Observable<int>.never();''');
        final expectedOutput = '''final neverStream = NeverStream<int>();''';

        final patches =
            FactoryStreamConverter('never').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.race -> RaceStream', () {
        final sourceFile = SourceFile.fromString(
            '''final raceStream = new Observable<int>.race([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final raceStream = RaceStream<int>([Stream.value(1), Stream.value(2)]);''';

        final patches =
            FactoryStreamConverter('race').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.repeat -> RepeatStream', () {
        final sourceFile = SourceFile.fromString('''
final repeatStream = new Observable<int>.repeat(() => Stream.value(1));
final repeatStream = new Observable<int>.repeat(() => Stream.value(1), 10);''');
        final expectedOutput = '''
final repeatStream = RepeatStream<int>(() => Stream.value(1));
final repeatStream = RepeatStream<int>(() => Stream.value(1), 10);''';

        final patches =
            FactoryStreamConverter('repeat').generatePatches(sourceFile);

        expect(patches, hasLength(2));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.retry -> RetryStream', () {
        final sourceFile = SourceFile.fromString(
            '''final retryStream = new Observable<int>.retry(() { Observable.just(1); });''');
        final expectedOutput =
            '''final retryStream = RetryStream<int>(() { Observable.just(1); });''';

        final patches =
            FactoryStreamConverter('retry').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.retryWhen -> RetryWhenStream', () {
        final sourceFile = SourceFile.fromString('''
final retryWhenStream = new Observable<int>.retryWhen(
  () => Stream<int>.fromIterable(<int>[1]),
  (dynamic error, StackTrace s) => throw error,
);''');
        final expectedOutput = '''
final retryWhenStream = RetryWhenStream<int>(
  () => Stream<int>.fromIterable(<int>[1]),
  (dynamic error, StackTrace s) => throw error,
);''';

        final patches =
            FactoryStreamConverter('retryWhen').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.switchLatest -> SwitchLatestStream', () {
        final sourceFile = SourceFile.fromString('''
final switchLatestStream = new Observable<String>.switchLatest(
  Stream.fromIterable(<Stream<String>>[
    Observable.timer('A', Duration(seconds: 2)),
    Observable.timer('B', Duration(seconds: 1)),
    Observable.just('C'),
  ]),
);''');
        final expectedOutput = '''
final switchLatestStream = SwitchLatestStream<String>(
  Stream.fromIterable(<Stream<String>>[
    Observable.timer('A', Duration(seconds: 2)),
    Observable.timer('B', Duration(seconds: 1)),
    Observable.just('C'),
  ]),
);''';

        final patches =
            FactoryStreamConverter('switchLatest').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.timer -> TimerStream', () {
        final sourceFile = SourceFile.fromString(
            '''final timerStream = new Observable<String>.timer("hi", Duration(minutes: 1));''');
        final expectedOutput =
            '''final timerStream = TimerStream<String>("hi", Duration(minutes: 1));''';

        final patches =
            FactoryStreamConverter('timer').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });
    });

    group('w/ new keyword', () {
      test('new Observable.concat -> ConcatStream', () {
        final sourceFile = SourceFile.fromString(
            '''final concatStream = new Observable.concat([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final concatStream = ConcatStream([Stream.value(1), Stream.value(2)]);''';

        final patches =
            FactoryStreamConverter('concat').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.concatEager -> ConcatEagerStream', () {
        final sourceFile = SourceFile.fromString(
            '''final concatEagerStream = new Observable.concatEager([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final concatEagerStream = ConcatEagerStream([Stream.value(1), Stream.value(2)]);''';

        final patches =
            FactoryStreamConverter('concatEager').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.defer -> DeferStream', () {
        final sourceFile = SourceFile.fromString(
            '''final deferStream = new Observable.defer(() => Observable.just(1));''');
        final expectedOutput =
            '''final deferStream = DeferStream(() => Observable.just(1));''';

        final patches =
            FactoryStreamConverter('defer').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.merge -> MergeStream', () {
        final sourceFile = SourceFile.fromString(
            '''final mergeStream = new Observable.merge([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final mergeStream = MergeStream([Stream.value(1), Stream.value(2)]);''';

        final patches =
            FactoryStreamConverter('merge').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.never -> NeverStream', () {
        final sourceFile = SourceFile.fromString(
            '''final neverStream = new Observable.never();''');
        final expectedOutput = '''final neverStream = NeverStream();''';

        final patches =
            FactoryStreamConverter('never').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.race -> RaceStream', () {
        final sourceFile = SourceFile.fromString(
            '''final raceStream = new Observable.race([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final raceStream = RaceStream([Stream.value(1), Stream.value(2)]);''';

        final patches =
            FactoryStreamConverter('race').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.repeat -> RepeatStream', () {
        final sourceFile = SourceFile.fromString('''
final repeatStream = new Observable.repeat(() => Stream.value(1));
final repeatStream = new Observable.repeat(() => Stream.value(1), 10);''');
        final expectedOutput = '''
final repeatStream = RepeatStream(() => Stream.value(1));
final repeatStream = RepeatStream(() => Stream.value(1), 10);''';

        final patches =
            FactoryStreamConverter('repeat').generatePatches(sourceFile);

        expect(patches, hasLength(2));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.retry -> RetryStream', () {
        final sourceFile = SourceFile.fromString(
            '''final retryStream = new Observable.retry(() => Observable.just(1));''');
        final expectedOutput =
            '''final retryStream = RetryStream(() => Observable.just(1));''';

        final patches =
            FactoryStreamConverter('retry').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.retryWhen -> RetryWhenStream', () {
        final sourceFile = SourceFile.fromString('''
final retryWhenStream = new Observable.retryWhen(
  () => Stream.fromIterable([1]),
  (dynamic error, StackTrace s) => throw error,
);''');
        final expectedOutput = '''
final retryWhenStream = RetryWhenStream(
  () => Stream.fromIterable([1]),
  (dynamic error, StackTrace s) => throw error,
);''';

        final patches =
            FactoryStreamConverter('retryWhen').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.switchLatest -> SwitchLatestStream', () {
        final sourceFile = SourceFile.fromString('''
final switchLatestStream = new Observable.switchLatest(
  Stream.fromIterable([
    Observable.timer('A', Duration(seconds: 2)),
    Observable.timer('B', Duration(seconds: 1)),
    Observable.just('C'),
  ]),
);''');
        final expectedOutput = '''
final switchLatestStream = SwitchLatestStream(
  Stream.fromIterable([
    Observable.timer('A', Duration(seconds: 2)),
    Observable.timer('B', Duration(seconds: 1)),
    Observable.just('C'),
  ]),
);''';

        final patches =
            FactoryStreamConverter('switchLatest').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.timer -> TimerStream', () {
        final sourceFile = SourceFile.fromString(
            '''final timerStream = new Observable.timer("hi", Duration(minutes: 1));''');
        final expectedOutput =
            '''final timerStream = TimerStream("hi", Duration(minutes: 1));''';

        final patches =
            FactoryStreamConverter('timer').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });
    });

    group('typed w/o new keyword', () {
      test('Observable.concat -> ConcatStream', () {
        final sourceFile = SourceFile.fromString(
            '''final concatStream = Observable<int>.concat([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final concatStream = ConcatStream<int>([Stream.value(1), Stream.value(2)]);''';

        final patches =
            FactoryStreamConverter('concat').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.concatEager -> ConcatEagerStream', () {
        final sourceFile = SourceFile.fromString(
            '''final concatEagerStream = Observable<int>.concatEager([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final concatEagerStream = ConcatEagerStream<int>([Stream.value(1), Stream.value(2)]);''';

        final patches =
            FactoryStreamConverter('concatEager').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.defer -> DeferStream', () {
        final sourceFile = SourceFile.fromString(
            '''final deferStream = Observable<int>.defer(() => Observable.just(1));''');
        final expectedOutput =
            '''final deferStream = DeferStream<int>(() => Observable.just(1));''';

        final patches =
            FactoryStreamConverter('defer').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.merge -> MergeStream', () {
        final sourceFile = SourceFile.fromString(
            '''final mergeStream = Observable<int>.merge([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final mergeStream = MergeStream<int>([Stream.value(1), Stream.value(2)]);''';

        final patches =
            FactoryStreamConverter('merge').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.never -> NeverStream', () {
        final sourceFile = SourceFile.fromString(
            '''final neverStream = Observable<int>.never();''');
        final expectedOutput = '''final neverStream = NeverStream<int>();''';

        final patches =
            FactoryStreamConverter('never').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.race -> RaceStream', () {
        final sourceFile = SourceFile.fromString(
            '''final raceStream = Observable<int>.race([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final raceStream = RaceStream<int>([Stream.value(1), Stream.value(2)]);''';

        final patches =
            FactoryStreamConverter('race').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.repeat -> RepeatStream', () {
        final sourceFile = SourceFile.fromString('''
final repeatStream = Observable<int>.repeat(() => Stream.value(1));
final repeatStream = Observable<int>.repeat(() => Stream.value(1), 10);''');
        final expectedOutput = '''
final repeatStream = RepeatStream<int>(() => Stream.value(1));
final repeatStream = RepeatStream<int>(() => Stream.value(1), 10);''';

        final patches =
            FactoryStreamConverter('repeat').generatePatches(sourceFile);

        expect(patches, hasLength(2));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.retry -> RetryStream', () {
        final sourceFile = SourceFile.fromString(
            '''final retryStream = Observable<int>.retry(() { Observable.just(1); });''');
        final expectedOutput =
            '''final retryStream = RetryStream<int>(() { Observable.just(1); });''';

        final patches =
            FactoryStreamConverter('retry').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.retryWhen -> RetryWhenStream', () {
        final sourceFile = SourceFile.fromString('''
final retryWhenStream = Observable<int>.retryWhen(
  () => Stream<int>.fromIterable(<int>[1]),
  (dynamic error, StackTrace s) => throw error,
);''');
        final expectedOutput = '''
final retryWhenStream = RetryWhenStream<int>(
  () => Stream<int>.fromIterable(<int>[1]),
  (dynamic error, StackTrace s) => throw error,
);''';

        final patches =
            FactoryStreamConverter('retryWhen').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.switchLatest -> SwitchLatestStream', () {
        final sourceFile = SourceFile.fromString('''
final switchLatestStream = Observable<String>.switchLatest(
  Stream.fromIterable(<Stream<String>>[
    Observable.timer('A', Duration(seconds: 2)),
    Observable.timer('B', Duration(seconds: 1)),
    Observable.just('C'),
  ]),
);''');
        final expectedOutput = '''
final switchLatestStream = SwitchLatestStream<String>(
  Stream.fromIterable(<Stream<String>>[
    Observable.timer('A', Duration(seconds: 2)),
    Observable.timer('B', Duration(seconds: 1)),
    Observable.just('C'),
  ]),
);''';

        final patches =
            FactoryStreamConverter('switchLatest').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.timer -> TimerStream', () {
        final sourceFile = SourceFile.fromString(
            '''final timerStream = Observable<String>.timer("hi", Duration(minutes: 1));''');
        final expectedOutput =
            '''final timerStream = TimerStream<String>("hi", Duration(minutes: 1));''';

        final patches =
            FactoryStreamConverter('timer').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });
    });

    group('w/o new keyword', () {
      test('Observable.concat -> ConcatStream', () {
        final sourceFile = SourceFile.fromString(
            '''final concatStream = Observable.concat([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final concatStream = ConcatStream([Stream.value(1), Stream.value(2)]);''';

        final patches =
            FactoryStreamConverter('concat').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.concatEager -> ConcatEagerStream', () {
        final sourceFile = SourceFile.fromString(
            '''final concatEagerStream = Observable.concatEager([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final concatEagerStream = ConcatEagerStream([Stream.value(1), Stream.value(2)]);''';

        final patches =
            FactoryStreamConverter('concatEager').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.defer -> DeferStream', () {
        final sourceFile = SourceFile.fromString(
            '''final deferStream = Observable.defer(() => Observable.just(1));''');
        final expectedOutput =
            '''final deferStream = DeferStream(() => Observable.just(1));''';

        final patches =
            FactoryStreamConverter('defer').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.merge -> MergeStream', () {
        final sourceFile = SourceFile.fromString(
            '''final mergeStream = Observable.merge([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final mergeStream = MergeStream([Stream.value(1), Stream.value(2)]);''';

        final patches =
            FactoryStreamConverter('merge').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.never -> NeverStream', () {
        final sourceFile = SourceFile.fromString(
            '''final neverStream = Observable.never();''');
        final expectedOutput = '''final neverStream = NeverStream();''';

        final patches =
            FactoryStreamConverter('never').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.race -> RaceStream', () {
        final sourceFile = SourceFile.fromString(
            '''final raceStream = Observable.race([Stream.value(1), Stream.value(2)]);''');
        final expectedOutput =
            '''final raceStream = RaceStream([Stream.value(1), Stream.value(2)]);''';

        final patches =
            FactoryStreamConverter('race').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.repeat -> RepeatStream', () {
        final sourceFile = SourceFile.fromString('''
final repeatStream = Observable.repeat(() => Stream.value(1));
final repeatStream = Observable.repeat(() => Stream.value(1), 10);''');
        final expectedOutput = '''
final repeatStream = RepeatStream(() => Stream.value(1));
final repeatStream = RepeatStream(() => Stream.value(1), 10);''';

        final patches =
            FactoryStreamConverter('repeat').generatePatches(sourceFile);

        expect(patches, hasLength(2));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.retry -> RetryStream', () {
        final sourceFile = SourceFile.fromString(
            '''final retryStream = Observable.retry(() => Observable.just(1));''');
        final expectedOutput =
            '''final retryStream = RetryStream(() => Observable.just(1));''';

        final patches =
            FactoryStreamConverter('retry').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.retryWhen -> RetryWhenStream', () {
        final sourceFile = SourceFile.fromString('''
final retryWhenStream = Observable.retryWhen(
  () => Stream.fromIterable([1]),
  (dynamic error, StackTrace s) => throw error,
);''');
        final expectedOutput = '''
final retryWhenStream = RetryWhenStream(
  () => Stream.fromIterable([1]),
  (dynamic error, StackTrace s) => throw error,
);''';

        final patches =
            FactoryStreamConverter('retryWhen').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.switchLatest -> SwitchLatestStream', () {
        final sourceFile = SourceFile.fromString('''
final switchLatestStream = Observable.switchLatest(
  Stream.fromIterable([
    Observable.timer('A', Duration(seconds: 2)),
    Observable.timer('B', Duration(seconds: 1)),
    Observable.just('C'),
  ]),
);''');
        final expectedOutput = '''
final switchLatestStream = SwitchLatestStream(
  Stream.fromIterable([
    Observable.timer('A', Duration(seconds: 2)),
    Observable.timer('B', Duration(seconds: 1)),
    Observable.just('C'),
  ]),
);''';

        final patches =
            FactoryStreamConverter('switchLatest').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.timer -> TimerStream', () {
        final sourceFile = SourceFile.fromString(
            '''final timerStream = Observable.timer("hi", Duration(minutes: 1));''');
        final expectedOutput =
            '''final timerStream = TimerStream("hi", Duration(minutes: 1));''';

        final patches =
            FactoryStreamConverter('timer').generatePatches(sourceFile);

        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });
    });
  });
}
