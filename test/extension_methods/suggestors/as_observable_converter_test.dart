import 'package:codemod/codemod.dart';
import 'package:rxdart_codemod/extension_methods/suggestors/as_observable_converter.dart';
import 'package:source_span/source_span.dart';
import 'package:test/test.dart';

void main() {
  group('AsObservableConverter', () {
    test('converts an asObservable call into asStream', () {
      final sourceFile = SourceFile.fromString('''
final foo = Observable.fromIterable([1, 2, 3]).toList().asObservable().map((a) => a);''');
      final expectedOutput = '''
final foo = Observable.fromIterable([1, 2, 3]).toList().asStream().map((a) => a);''';

      final patches = AsObservableConverter().generatePatches(sourceFile);
      expect(patches, hasLength(1));
      expect(applyPatches(sourceFile, patches), expectedOutput);
    });
  });
}
