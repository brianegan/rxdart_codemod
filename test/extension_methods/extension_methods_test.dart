import 'suggestors/as_observable_converter_test.dart'
    as as_observable_converter_test;
import 'suggestors/concat_map_converter_test.dart' as concat_map_converter_test;
import 'suggestors/constructor_converters_test.dart'
    as constructor_converters_test;
import 'suggestors/error_stream_converter_test.dart'
    as error_stream_converter_test;
import 'suggestors/factory_converter_test.dart' as factory_converter_test;
import 'suggestors/simple_type_converters_test.dart'
    as simple_type_converters_test;
import 'suggestors/static_factory_converter_test.dart'
    as static_factory_converter_test;
import 'suggestors/stream_factory_converter_test.dart'
    as stream_factory_converter_test;
import 'suggestors/where_type_converter_test.dart' as where_type_converter_test;

void main() {
  as_observable_converter_test.main();
  concat_map_converter_test.main();
  constructor_converters_test.main();
  error_stream_converter_test.main();
  factory_converter_test.main();
  simple_type_converters_test.main();
  static_factory_converter_test.main();
  stream_factory_converter_test.main();
  where_type_converter_test.main();
}
