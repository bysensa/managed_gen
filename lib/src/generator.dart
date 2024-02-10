import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:managed/annotations.dart';
import 'package:managed_gen/src/extensions/element.extension.dart';
import 'package:managed_gen/src/extensions/spec.extension.dart';
import 'package:managed_gen/src/imports.builder.dart';
import 'package:managed_gen/src/producers.dart';
import 'package:managed_gen/src/producers/extended.manage.producer.dart';
import 'package:managed_gen/src/producers/params.producer.dart';
import 'package:managed_gen/src/visitor.dart';
import 'package:source_gen/source_gen.dart';
import 'package:path/path.dart' as p;

class ManagedGenerator extends GeneratorForAnnotation<ManagedType> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! ClassElement) {
      throw Exception(
        'Only class must be annotated with ManagedType annotation',
      );
    }
    final targetConstructor = element.targetConstructor;

    final moduleAsset = AssetId(
      buildStep.inputId.package,
      p.join('lib', 'module.dart'),
    );
    final importsBuilder = ImportsBuilder(moduleAsset);

    importsBuilder.add(element.library.source.uri);
    targetConstructor.parameters.forEach((parameter) {
      final typeSourceUri = parameter.type.element?.library?.source.uri;
      if (typeSourceUri == null) {
        return;
      }
      importsBuilder.add(typeSourceUri);
    });

    final extendedManage = ExtendedManageProducer(managedType: element);
    final params = ParamsProducer(managedType: element);
    final providerMixin = ProviderProducer(managedType: element);

    final buff = StringBuffer();
    buff.writeAll([
      importsBuilder.write(),
      extendedManage.produce().formattedString(),
      params.produce().formattedString(),
      providerMixin.produce().formattedString(),
    ], '\n\n');

    return buff.toString();
  }
}
