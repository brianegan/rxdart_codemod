import 'package:codemod/codemod.dart';
import 'package:rxdart_codemod/extension_methods/suggestors/constructor_converters.dart';
import 'package:source_span/source_span.dart';
import 'package:test/test.dart';

void main() {
  group('ConstructorConverters', () {
    test('unwraps the observable constructor', () {
      final sourceFile = SourceFile.fromString('''
var stream = Observable(Stream.fromIterable([1, 2, 3]));''');
      final expectedOutput = '''
var stream = Stream.fromIterable([1, 2, 3]);''';

      final patches = ConstructorConverter().generatePatches(sourceFile);
      expect(patches, hasLength(1));
      expect(applyPatches(sourceFile, patches), expectedOutput);
    });

    test('unwraps the observable constructor with new keyword', () {
      final sourceFile = SourceFile.fromString('''
var stream = new Observable(Stream.fromIterable([1, 2, 3]));''');
      final expectedOutput = '''
var stream = Stream.fromIterable([1, 2, 3]);''';

      final patches = ConstructorConverter().generatePatches(sourceFile);
      expect(patches, hasLength(1));
      expect(applyPatches(sourceFile, patches), expectedOutput);
    });

    test('works with typed observables', () {
      final sourceFile = SourceFile.fromString('''
var stream = new Observable<int>(Stream.fromIterable([1, 2, 3]));''');
      final expectedOutput = '''
var stream = Stream.fromIterable([1, 2, 3]);''';

      final patches = ConstructorConverter().generatePatches(sourceFile);
      expect(patches, hasLength(1));
      expect(applyPatches(sourceFile, patches), expectedOutput);
    });

    test('does not break the chain', () {
      final sourceFile = SourceFile.fromString('''
var stream = Observable(Stream.fromIterable([1, 2, 3])).listen((data) {});''');
      final expectedOutput = '''
var stream = Stream.fromIterable([1, 2, 3]).listen((data) {});''';

      final patches = ConstructorConverter().generatePatches(sourceFile);
      expect(patches, hasLength(1));
      expect(applyPatches(sourceFile, patches), expectedOutput);
    });

    test('works without a declaration', () {
      final sourceFile = SourceFile.fromString('''
void main() {
  Observable(Stream.fromIterable([1, 2, 3])).listen((data) {});
}''');
      final expectedOutput = '''
void main() {
  Stream.fromIterable([1, 2, 3]).listen((data) {});
}''';

      final patches = ConstructorConverter().generatePatches(sourceFile);
      expect(patches, hasLength(1));
      expect(applyPatches(sourceFile, patches), expectedOutput);
    });
  });
}
