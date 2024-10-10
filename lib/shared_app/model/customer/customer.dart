import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer.freezed.dart';
part 'customer.g.dart';

@unfreezed
class Customer with _$Customer {
  factory Customer({
    @Default(null) @JsonKey(name: 'id') int? id,
    @Default(null) @JsonKey(name: 'image_url') String? imageUrl,
    @Default(null) @JsonKey(name: 'customer_name') String? customerName,
    @Default(null) @JsonKey(name: 'email') String? email,
    @Default(null) @JsonKey(name: 'phone') String? phone,
    @Default(null) @JsonKey(name: 'address') String? address,
    @Default(null) @JsonKey(name: 'created_at') DateTime? createdAt,
    @Default(null) @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
}
