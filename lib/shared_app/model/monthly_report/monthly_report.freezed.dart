// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monthly_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MonthlyReport _$MonthlyReportFromJson(Map<String, dynamic> json) {
  return _MonthlyReport.fromJson(json);
}

/// @nodoc
mixin _$MonthlyReport {
  @JsonKey(name: 'month_name')
  String? get monthName => throw _privateConstructorUsedError;
  @JsonKey(name: 'month_name')
  set monthName(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase')
  int? get purchase => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase')
  set purchase(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'sales')
  int? get sales => throw _privateConstructorUsedError;
  @JsonKey(name: 'sales')
  set sales(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MonthlyReportCopyWith<MonthlyReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyReportCopyWith<$Res> {
  factory $MonthlyReportCopyWith(
          MonthlyReport value, $Res Function(MonthlyReport) then) =
      _$MonthlyReportCopyWithImpl<$Res, MonthlyReport>;
  @useResult
  $Res call(
      {@JsonKey(name: 'month_name') String? monthName,
      @JsonKey(name: 'purchase') int? purchase,
      @JsonKey(name: 'sales') int? sales});
}

/// @nodoc
class _$MonthlyReportCopyWithImpl<$Res, $Val extends MonthlyReport>
    implements $MonthlyReportCopyWith<$Res> {
  _$MonthlyReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthName = freezed,
    Object? purchase = freezed,
    Object? sales = freezed,
  }) {
    return _then(_value.copyWith(
      monthName: freezed == monthName
          ? _value.monthName
          : monthName // ignore: cast_nullable_to_non_nullable
              as String?,
      purchase: freezed == purchase
          ? _value.purchase
          : purchase // ignore: cast_nullable_to_non_nullable
              as int?,
      sales: freezed == sales
          ? _value.sales
          : sales // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthlyReportImplCopyWith<$Res>
    implements $MonthlyReportCopyWith<$Res> {
  factory _$$MonthlyReportImplCopyWith(
          _$MonthlyReportImpl value, $Res Function(_$MonthlyReportImpl) then) =
      __$$MonthlyReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'month_name') String? monthName,
      @JsonKey(name: 'purchase') int? purchase,
      @JsonKey(name: 'sales') int? sales});
}

/// @nodoc
class __$$MonthlyReportImplCopyWithImpl<$Res>
    extends _$MonthlyReportCopyWithImpl<$Res, _$MonthlyReportImpl>
    implements _$$MonthlyReportImplCopyWith<$Res> {
  __$$MonthlyReportImplCopyWithImpl(
      _$MonthlyReportImpl _value, $Res Function(_$MonthlyReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthName = freezed,
    Object? purchase = freezed,
    Object? sales = freezed,
  }) {
    return _then(_$MonthlyReportImpl(
      monthName: freezed == monthName
          ? _value.monthName
          : monthName // ignore: cast_nullable_to_non_nullable
              as String?,
      purchase: freezed == purchase
          ? _value.purchase
          : purchase // ignore: cast_nullable_to_non_nullable
              as int?,
      sales: freezed == sales
          ? _value.sales
          : sales // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlyReportImpl implements _MonthlyReport {
  _$MonthlyReportImpl(
      {@JsonKey(name: 'month_name') this.monthName = null,
      @JsonKey(name: 'purchase') this.purchase = null,
      @JsonKey(name: 'sales') this.sales = null});

  factory _$MonthlyReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyReportImplFromJson(json);

  @override
  @JsonKey(name: 'month_name')
  String? monthName;
  @override
  @JsonKey(name: 'purchase')
  int? purchase;
  @override
  @JsonKey(name: 'sales')
  int? sales;

  @override
  String toString() {
    return 'MonthlyReport(monthName: $monthName, purchase: $purchase, sales: $sales)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyReportImplCopyWith<_$MonthlyReportImpl> get copyWith =>
      __$$MonthlyReportImplCopyWithImpl<_$MonthlyReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyReportImplToJson(
      this,
    );
  }
}

abstract class _MonthlyReport implements MonthlyReport {
  factory _MonthlyReport(
      {@JsonKey(name: 'month_name') String? monthName,
      @JsonKey(name: 'purchase') int? purchase,
      @JsonKey(name: 'sales') int? sales}) = _$MonthlyReportImpl;

  factory _MonthlyReport.fromJson(Map<String, dynamic> json) =
      _$MonthlyReportImpl.fromJson;

  @override
  @JsonKey(name: 'month_name')
  String? get monthName;
  @JsonKey(name: 'month_name')
  set monthName(String? value);
  @override
  @JsonKey(name: 'purchase')
  int? get purchase;
  @JsonKey(name: 'purchase')
  set purchase(int? value);
  @override
  @JsonKey(name: 'sales')
  int? get sales;
  @JsonKey(name: 'sales')
  set sales(int? value);
  @override
  @JsonKey(ignore: true)
  _$$MonthlyReportImplCopyWith<_$MonthlyReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
