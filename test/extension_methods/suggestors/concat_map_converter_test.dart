import 'package:codemod/codemod.dart';
import 'package:rxdart_codemod/extension_methods/suggestors/concat_map_converter.dart';
import 'package:source_span/source_span.dart';
import 'package:test/test.dart';

void main() {
  group('ConcatMapConverter', () {
    test('converts concatMap to asyncExpand', () {
      final sourceFile = SourceFile.fromString('''
final foo = Stream.fromIterable([1, 2, 3]).concatMap((s) => s);''');
      final expectedOutput = '''
final foo = Stream.fromIterable([1, 2, 3]).asyncExpand((s) => s);''';

      final patches = ConcatMapConverter().generatePatches(sourceFile);
      expect(patches, hasLength(1));
      expect(applyPatches(sourceFile, patches), expectedOutput);
    });

    test('converts concatMap with type info to asyncExpand', () {
      final sourceFile = SourceFile.fromString('''
final foo = Stream.fromIterable([1, 2, 3]).concatMap<A>((s) => s);''');
      final expectedOutput = '''
final foo = Stream.fromIterable([1, 2, 3]).asyncExpand<A>((s) => s);''';

      final patches = ConcatMapConverter().generatePatches(sourceFile);
      expect(patches, hasLength(1));
      expect(applyPatches(sourceFile, patches), expectedOutput);
    });
  });
}
