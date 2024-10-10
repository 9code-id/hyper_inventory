import 'package:freezed_annotation/freezed_annotation.dart';
import '../product_category/product_category.dart';

part 'monthly_report.freezed.dart';
part 'monthly_report.g.dart';

@unfreezed
class MonthlyReport with _$MonthlyReport {
  factory MonthlyReport({
    @Default(null) @JsonKey(name: 'month_name') String? monthName,
    @Default(null) @JsonKey(name: 'purchase') int? purchase,
    @Default(null) @JsonKey(name: 'sales') int? sales,
  }) = _MonthlyReport;

  factory MonthlyReport.fromJson(Map<String, dynamic> json) =>
      _$MonthlyReportFromJson(json);
}
//
