import 'package:freezed_annotation/freezed_annotation.dart';
import '../product_category/product_category.dart';

part 'daily_report.freezed.dart';
part 'daily_report.g.dart';

@unfreezed
class DailyReport with _$DailyReport {
  factory DailyReport({
    @Default(null) @JsonKey(name: 'report_date') String? reportDate,
    @Default(null) @JsonKey(name: 'purchase') int? purchase,
    @Default(null) @JsonKey(name: 'sales') int? sales,
  }) = _DailyReport;

  factory DailyReport.fromJson(Map<String, dynamic> json) =>
      _$DailyReportFromJson(json);
}
//
