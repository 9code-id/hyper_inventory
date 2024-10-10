import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_method.freezed.dart';
part 'payment_method.g.dart';

@unfreezed
class PaymentMethod with _$PaymentMethod {
  factory PaymentMethod({
    @Default(null) @JsonKey(name: 'id') int? id,
    @Default(null)
    @JsonKey(name: 'payment_method_name')
    String? paymentMethodName,
    @Default(null) @JsonKey(name: 'account_name') String? accountName,
    @Default(null) @JsonKey(name: 'account_number') String? accountNumber,
    @Default(null) @JsonKey(name: 'created_at') DateTime? createdAt,
    @Default(null) @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _PaymentMethod;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);
}
