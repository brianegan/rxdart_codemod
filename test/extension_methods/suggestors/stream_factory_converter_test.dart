import 'package:codemod/codemod.dart';
import 'package:rxdart_codemod/extension_methods/suggestors/stream_factory_converter.dart';
import 'package:source_span/source_span.dart';
import 'package:test/test.dart';

void main() {
  group('StreamFactoryConverter,', () {
    group('new keyword', () {
      test('new Observable.empty -> Stream.empty', () {
        final sourceFile = SourceFile.fromString(
            '''final emptyStream = new Observable.empty();''');
        final expectedOutput = '''final emptyStream = Stream.empty();''';

        final patches =
            StreamFactoryConverter('empty').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.error -> Stream.error', () {
        final sourceFile = SourceFile.fromString(
            '''final errorStream = new Observable.error(Exception());''');
        final expectedOutput =
            '''final errorStream = Stream.error(Exception());''';

        final patches =
            StreamFactoryConverter('error').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.eventTransformed -> Stream.eventTransformed', () {
        final sourceFile = SourceFile.fromString(
            '''final eventTransformedStream = new Observable.eventTransformed(stream, (EventSink sink) => sink);''');
        final expectedOutput =
            '''final eventTransformedStream = Stream.eventTransformed(stream, (EventSink sink) => sink);''';

        final patches = StreamFactoryConverter('eventTransformed')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.fromFuture -> Stream.fromFuture', () {
        final sourceFile = SourceFile.fromString(
            '''final fromFutureStream = new Observable.fromFuture(Future.value(1));''');
        final expectedOutput =
            '''final fromFutureStream = Stream.fromFuture(Future.value(1));''';

        final patches =
            StreamFactoryConverter('fromFuture').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.fromIterable -> Stream.fromIterable', () {
        final sourceFile = SourceFile.fromString(
            '''final fromIterableStream = new Observable.fromIterable([1, 2, 3]);''');
        final expectedOutput =
            '''final fromIterableStream = Stream.fromIterable([1, 2, 3]);''';

        final patches =
            StreamFactoryConverter('fromIterable').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.periodic -> Stream.periodic', () {
        final sourceFile = SourceFile.fromString(
            '''final periodicStream = new Observable.periodic(Duration(seconds: 1), (i) => i).take(3);''');
        final expectedOutput =
            '''final periodicStream = Stream.periodic(Duration(seconds: 1), (i) => i).take(3);''';

        final patches =
            StreamFactoryConverter('periodic').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable.just -> Stream.just', () {
        final sourceFile = SourceFile.fromString(
            '''final justStream = new Observable.just(1);''');
        final expectedOutput = '''final justStream = Stream.value(1);''';

        final patches =
            StreamFactoryConverter('just').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });
    });

    group('typed new keyword', () {
      test('new Observable<int>.empty -> Stream<int>.empty', () {
        final sourceFile = SourceFile.fromString(
            '''final emptyStream = new Observable<int>.empty();''');
        final expectedOutput = '''final emptyStream = Stream<int>.empty();''';

        final patches =
            StreamFactoryConverter('empty').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable<int>.error -> Stream<int>.error', () {
        final sourceFile = SourceFile.fromString(
            '''final errorStream = new Observable<int>.error(Exception());''');
        final expectedOutput =
            '''final errorStream = Stream<int>.error(Exception());''';

        final patches =
            StreamFactoryConverter('error').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test(
          'new Observable<int>.eventTransformed -> Stream<int>.eventTransformed',
          () {
        final sourceFile = SourceFile.fromString(
            '''final eventTransformedStream = new Observable<int>.eventTransformed(stream, (EventSink sink) => sink);''');
        final expectedOutput =
            '''final eventTransformedStream = Stream<int>.eventTransformed(stream, (EventSink sink) => sink);''';

        final patches = StreamFactoryConverter('eventTransformed')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable<int>.fromFuture -> Stream<int>.fromFuture', () {
        final sourceFile = SourceFile.fromString(
            '''final fromFutureStream = new Observable<int>.fromFuture(Future.value(1));''');
        final expectedOutput =
            '''final fromFutureStream = Stream<int>.fromFuture(Future.value(1));''';

        final patches =
            StreamFactoryConverter('fromFuture').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable<int>.fromIterable -> Stream<int>.fromIterable', () {
        final sourceFile = SourceFile.fromString(
            '''final fromIterableStream = new Observable<int>.fromIterable([1, 2, 3]);''');
        final expectedOutput =
            '''final fromIterableStream = Stream<int>.fromIterable([1, 2, 3]);''';

        final patches =
            StreamFactoryConverter('fromIterable').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable<int>.periodic -> Stream<int>.periodic', () {
        final sourceFile = SourceFile.fromString(
            '''final periodicStream = new Observable<int>.periodic(Duration(seconds: 1), (i) => i).take(3);''');
        final expectedOutput =
            '''final periodicStream = Stream<int>.periodic(Duration(seconds: 1), (i) => i).take(3);''';

        final patches =
            StreamFactoryConverter('periodic').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('new Observable<int>.just -> Stream<int>.just', () {
        final sourceFile = SourceFile.fromString(
            '''final justStream = new Observable<int>.just(1);''');
        final expectedOutput = '''final justStream = Stream<int>.value(1);''';

        final patches =
            StreamFactoryConverter('just').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });
    });

    group('w/o new keyword', () {
      test('Observable.empty -> Stream.empty', () {
        final sourceFile = SourceFile.fromString(
            '''final emptyStream = Observable.empty();''');
        final expectedOutput = '''final emptyStream = Stream.empty();''';

        final patches =
            StreamFactoryConverter('empty').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.error -> Stream.error', () {
        final sourceFile = SourceFile.fromString(
            '''final errorStream = Observable.error(Exception());''');
        final expectedOutput =
            '''final errorStream = Stream.error(Exception());''';

        final patches =
            StreamFactoryConverter('error').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.eventTransformed -> Stream.eventTransformed', () {
        final sourceFile = SourceFile.fromString(
            '''final eventTransformedStream = Observable.eventTransformed(stream, (EventSink sink) => sink);''');
        final expectedOutput =
            '''final eventTransformedStream = Stream.eventTransformed(stream, (EventSink sink) => sink);''';

        final patches = StreamFactoryConverter('eventTransformed')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.fromFuture -> Stream.fromFuture', () {
        final sourceFile = SourceFile.fromString(
            '''final fromFutureStream = Observable.fromFuture(Future.value(1));''');
        final expectedOutput =
            '''final fromFutureStream = Stream.fromFuture(Future.value(1));''';

        final patches =
            StreamFactoryConverter('fromFuture').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.fromIterable -> Stream.fromIterable', () {
        final sourceFile = SourceFile.fromString(
            '''final fromIterableStream = Observable.fromIterable([1, 2, 3]);''');
        final expectedOutput =
            '''final fromIterableStream = Stream.fromIterable([1, 2, 3]);''';

        final patches =
            StreamFactoryConverter('fromIterable').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.periodic -> Stream.periodic', () {
        final sourceFile = SourceFile.fromString(
            '''final periodicStream = Observable.periodic(Duration(seconds: 1), (i) => i).take(3);''');
        final expectedOutput =
            '''final periodicStream = Stream.periodic(Duration(seconds: 1), (i) => i).take(3);''';

        final patches =
            StreamFactoryConverter('periodic').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable.just -> Stream.just', () {
        final sourceFile =
            SourceFile.fromString('''final justStream = Observable.just(1);''');
        final expectedOutput = '''final justStream = Stream.value(1);''';

        final patches =
            StreamFactoryConverter('just').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });
    });

    group('typed w/o new keyword', () {
      test('Observable<int>.empty -> Stream<int>.empty', () {
        final sourceFile = SourceFile.fromString(
            '''final emptyStream = Observable<int>.empty();''');
        final expectedOutput = '''final emptyStream = Stream<int>.empty();''';

        final patches =
            StreamFactoryConverter('empty').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable<int>.error -> Stream<int>.error', () {
        final sourceFile = SourceFile.fromString(
            '''final errorStream = Observable<int>.error(Exception());''');
        final expectedOutput =
            '''final errorStream = Stream<int>.error(Exception());''';

        final patches =
            StreamFactoryConverter('error').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable<int>.eventTransformed -> Stream<int>.eventTransformed',
          () {
        final sourceFile = SourceFile.fromString(
            '''final eventTransformedStream = Observable<int>.eventTransformed(stream, (EventSink sink) => sink);''');
        final expectedOutput =
            '''final eventTransformedStream = Stream<int>.eventTransformed(stream, (EventSink sink) => sink);''';

        final patches = StreamFactoryConverter('eventTransformed')
            .generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable<int>.fromFuture -> Stream<int>.fromFuture', () {
        final sourceFile = SourceFile.fromString(
            '''final fromFutureStream = Observable<int>.fromFuture(Future.value(1));''');
        final expectedOutput =
            '''final fromFutureStream = Stream<int>.fromFuture(Future.value(1));''';

        final patches =
            StreamFactoryConverter('fromFuture').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable<int>.fromIterable -> Stream<int>.fromIterable', () {
        final sourceFile = SourceFile.fromString(
            '''final fromIterableStream = Observable<int>.fromIterable([1, 2, 3]);''');
        final expectedOutput =
            '''final fromIterableStream = Stream<int>.fromIterable([1, 2, 3]);''';

        final patches =
            StreamFactoryConverter('fromIterable').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable<int>.periodic -> Stream<int>.periodic', () {
        final sourceFile = SourceFile.fromString(
            '''final periodicStream = Observable<int>.periodic(Duration(seconds: 1), (i) => i).take(3);''');
        final expectedOutput =
            '''final periodicStream = Stream<int>.periodic(Duration(seconds: 1), (i) => i).take(3);''';

        final patches =
            StreamFactoryConverter('periodic').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });

      test('Observable<int>.just -> Stream<int>.just', () {
        final sourceFile = SourceFile.fromString(
            '''final justStream = Observable<int>.just(1);''');
        final expectedOutput = '''final justStream = Stream<int>.value(1);''';

        final patches =
            StreamFactoryConverter('just').generatePatches(sourceFile);
        expect(patches, hasLength(1));
        expect(applyPatches(sourceFile, patches), expectedOutput);
      });
    });
  });
}
