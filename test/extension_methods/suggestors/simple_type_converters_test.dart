import 'package:codemod/codemod.dart';
import 'package:rxdart_codemod/extension_methods/suggestors/simple_type_converters.dart';
import 'package:source_span/source_span.dart';
import 'package:test/test.dart';

void main() {
  group('SimpleTypeConverters', () {
    for (var old in SimpleTypeConverters.oldToNew.keys) {
      final replacement = SimpleTypeConverters.oldToNew[old];

      group('$old -> ${replacement}', () {
        test('return value', () {
          final sourceFile = SourceFile.fromString('''
$old<int> getStream(int n) => (int n) async* {var k = 0; while (k < n) {await Future<Null>.delayed(const Duration(milliseconds: 100)); yield k++;}}(n);''');
          final expectedOutput = '''
$replacement<int> getStream(int n) => (int n) async* {var k = 0; while (k < n) {await Future<Null>.delayed(const Duration(milliseconds: 100)); yield k++;}}(n);''';

          final patches = SimpleTypeConverters(old, replacement)
              .generatePatches(sourceFile);
          expect(patches, hasLength(1));
          expect(applyPatches(sourceFile, patches), expectedOutput);
        });

        test('variable declaration', () {
          final sourceFile = SourceFile.fromString('''
final $old<int> observable = Stream.value(1);''');
          final expectedOutput = '''
final $replacement<int> observable = Stream.value(1);''';

          final patches = SimpleTypeConverters(old, replacement)
              .generatePatches(sourceFile);
          expect(patches, hasLength(1));
          expect(applyPatches(sourceFile, patches), expectedOutput);
        });
      });
    }
  });
}
