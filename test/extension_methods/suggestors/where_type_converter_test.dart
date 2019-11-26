import 'package:codemod/codemod.dart';
import 'package:rxdart_codemod/extension_methods/suggestors/where_type_converter.dart';
import 'package:source_span/source_span.dart';
import 'package:test/test.dart';

void main() {
  group('WhereTypeConverter', () {
    test('converts Observable ofType into WhereType', () {
      final sourceFile = SourceFile.fromString('''
final foo = Stream.fromIterable([1, 2, 3]).ofType(TypeToken<int>());''');
      final expectedOutput = '''
final foo = Stream.fromIterable([1, 2, 3]).whereType<int>();''';

      final patches = WhereTypeConverter().generatePatches(sourceFile);
      expect(patches, hasLength(1));
      expect(applyPatches(sourceFile, patches), expectedOutput);
    });

    test('converts Observable ofType with new TypeToken into WhereType', () {
      final sourceFile = SourceFile.fromString('''
final foo = Stream.fromIterable([1, 2, 3]).ofType(new TypeToken<int>());''');
      final expectedOutput = '''
final foo = Stream.fromIterable([1, 2, 3]).whereType<int>();''';

      final patches = WhereTypeConverter().generatePatches(sourceFile);
      expect(patches, hasLength(1));
      expect(applyPatches(sourceFile, patches), expectedOutput);
    });
  });
}
