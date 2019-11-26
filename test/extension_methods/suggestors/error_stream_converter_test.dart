import 'package:codemod/codemod.dart';
import 'package:rxdart_codemod/extension_methods/suggestors/error_stream_converter.dart';
import 'package:source_span/source_span.dart';
import 'package:test/test.dart';

void main() {
  group('ErrorStreamConverter', () {
    test('converts an ErrorStream into a Stream.error()', () {
      final sourceFile = SourceFile.fromString('''
final foo = ErrorStream(Exception()).toList().asStream().map((a) => a);''');
      final expectedOutput = '''
final foo = Stream.error(Exception()).toList().asStream().map((a) => a);''';

      final patches = ErrorStreamConverter().generatePatches(sourceFile);
      expect(patches, hasLength(1));
      expect(applyPatches(sourceFile, patches), expectedOutput);
    });

    test('converts an typed ErrorStream into a Stream.error()', () {
      final sourceFile = SourceFile.fromString('''
final foo = ErrorStream<int>(Exception()).toList().asStream().map((h) => h);''');
      final expectedOutput = '''
final foo = Stream<int>.error(Exception()).toList().asStream().map((h) => h);''';

      final patches = ErrorStreamConverter().generatePatches(sourceFile);
      expect(patches, hasLength(1));
      expect(applyPatches(sourceFile, patches), expectedOutput);
    });

    test('converts a new ErrorStream into a Stream.error()', () {
      final sourceFile = SourceFile.fromString('''
final foo = new ErrorStream(Exception()).toList().asStream().map((a) => a);''');
      final expectedOutput = '''
final foo = Stream.error(Exception()).toList().asStream().map((a) => a);''';

      final patches = ErrorStreamConverter().generatePatches(sourceFile);
      expect(patches, hasLength(1));
      expect(applyPatches(sourceFile, patches), expectedOutput);
    });

    test('converts a new ErrorStream into a Stream.error() with type info', () {
      final sourceFile = SourceFile.fromString('''
final foo = new ErrorStream<int>(Exception()).toList().asStream().map((a) => a);''');
      final expectedOutput = '''
final foo = Stream<int>.error(Exception()).toList().asStream().map((a) => a);''';

      final patches = ErrorStreamConverter().generatePatches(sourceFile);
      expect(patches, hasLength(1));
      expect(applyPatches(sourceFile, patches), expectedOutput);
    });
  });
}
