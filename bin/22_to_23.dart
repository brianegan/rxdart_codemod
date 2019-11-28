import 'dart:io';

import 'package:args/args.dart';
import 'package:codemod/codemod.dart';
import 'package:rxdart_codemod/extension_methods/suggestors/as_observable_converter.dart';
import 'package:rxdart_codemod/extension_methods/suggestors/concat_map_converter.dart';
import 'package:rxdart_codemod/extension_methods/suggestors/constructor_converters.dart';
import 'package:rxdart_codemod/extension_methods/suggestors/error_stream_converter.dart';
import 'package:rxdart_codemod/extension_methods/suggestors/factory_converter.dart';
import 'package:rxdart_codemod/extension_methods/suggestors/factory_stream_converter.dart';
import 'package:rxdart_codemod/extension_methods/suggestors/observable_cast_converter.dart';
import 'package:rxdart_codemod/extension_methods/suggestors/simple_type_converters.dart';
import 'package:rxdart_codemod/extension_methods/suggestors/static_factory_converter.dart';
import 'package:rxdart_codemod/extension_methods/suggestors/static_factory_stream_class_converter.dart';
import 'package:rxdart_codemod/extension_methods/suggestors/stream_factory_converter.dart';
import 'package:rxdart_codemod/extension_methods/suggestors/where_type_converter.dart';

void main(List<String> args) {
  const recursive = 'recursive';
  const streamClasses = 'classes';
  const help = 'help';

  final parser = ArgParser()
    ..addFlag(
      recursive,
      help:
          'Apply updates to Dart files in the current directory and all subdirectories recursively.',
      defaultsTo: true,
    )
    ..addFlag(
      streamClasses,
      help:
          'Use Stream classes instead of Rx factories. Example: "TimerStream" instead of "Rx.timer"\n(defaults to off)',
      defaultsTo: false,
    )
    ..addFlag(
      help,
      abbr: 'h',
      help: 'Prints the help menu',
      defaultsTo: false,
      negatable: false,
    );
  final parsed = parser.parse(args);

  if (parsed[help]) {
    print('''
This script will update code that uses RxDart 0.22.x to support RxDart 0.23.x.
''');
    return print(parser.usage);
  }

  final useStreamClasses = parsed[streamClasses];
  final useRxFactories = !useStreamClasses;

  exitCode = runInteractiveCodemodSequence(
    FileQuery.dir(
      path: '${Directory.current.path}',
      pathFilter: isDartFile,
      recursive: parsed[recursive],
    ),
    [
      if (useRxFactories) ...StaticFactoryConverter.converters,
      if (useRxFactories) ...FactoryConverter.converters,
      if (useStreamClasses) ...StaticFactoryStreamClassConverter.converters,
      if (useStreamClasses) ...FactoryStreamConverter.converters,
      ...StreamFactoryConverter.converters,
      ConstructorConverter(),
      AsObservableConverter(),
      ConcatMapConverter(),
      ErrorStreamConverter(),
      WhereTypeConverter(),
      ObservableCastConverter(),
      ...SimpleTypeConverters.converters,
    ],
    args: args
        .where((name) =>
            !name.contains(help) &&
            !name.contains(streamClasses) &&
            !name.contains(recursive))
        .toList(),
  );
}
