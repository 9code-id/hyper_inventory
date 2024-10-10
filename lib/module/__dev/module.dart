import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'module.freezed.dart';
part 'module.g.dart';

@freezed
class Module with _$Module {
  factory Module({
    String? name,
    String? icon,
    List<String>? tableColumnPriority,
    List<String>? subEditFormHiddenFields,
    List<String>? subEditTableHiddenFields,
    List<String>? subEditTableHiddenFooters,
    List<String>? listViewHiddenFields,
    List<String>? createFormHiddenFields,
    List<String>? editFormHiddenFields,
    List<String>? createFormDisabledFields,
    List<String>? editFormDisabledFields,
    bool? subEditMode,
    String? subEditTable,
    List<String>? generatedModules,
  }) = _Module;

  factory Module.fromJson(Map<String, dynamic> json) => _$ModuleFromJson(json);
}
