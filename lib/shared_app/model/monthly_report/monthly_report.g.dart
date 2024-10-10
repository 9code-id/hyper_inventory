// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MonthlyReportImpl _$$MonthlyReportImplFromJson(Map<String, dynamic> json) =>
    _$MonthlyReportImpl(
      monthName: json['month_name'] as String? ?? null,
      purchase: (json['purchase'] as num?)?.toInt() ?? null,
      sales: (json['sales'] as num?)?.toInt() ?? null,
    );

Map<String, dynamic> _$$MonthlyReportImplToJson(_$MonthlyReportImpl instance) =>
    <String, dynamic>{
      'month_name': instance.monthName,
      'purchase': instance.purchase,
      'sales': instance.sales,
    };
