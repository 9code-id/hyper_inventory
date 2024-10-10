// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyReportImpl _$$DailyReportImplFromJson(Map<String, dynamic> json) =>
    _$DailyReportImpl(
      reportDate: json['report_date'] as String? ?? null,
      purchase: (json['purchase'] as num?)?.toInt() ?? null,
      sales: (json['sales'] as num?)?.toInt() ?? null,
    );

Map<String, dynamic> _$$DailyReportImplToJson(_$DailyReportImpl instance) =>
    <String, dynamic>{
      'report_date': instance.reportDate,
      'purchase': instance.purchase,
      'sales': instance.sales,
    };
