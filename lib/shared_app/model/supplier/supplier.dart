import 'package:freezed_annotation/freezed_annotation.dart';

part 'supplier.freezed.dart';
part 'supplier.g.dart';

@unfreezed
class Supplier with _$Supplier {
  factory Supplier({
    @Default(null) @JsonKey(name: 'id') int? id,
    @Default(null) @JsonKey(name: 'image_url') String? imageUrl,
    @Default(null) @JsonKey(name: 'supplier_name') String? supplierName,
    @Default(null) @JsonKey(name: 'email') String? email,
    @Default(null) @JsonKey(name: 'phone') String? phone,
    @Default(null) @JsonKey(name: 'address') String? address,
    @Default(null) @JsonKey(name: 'created_at') DateTime? createdAt,
    @Default(null) @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Supplier;

  factory Supplier.fromJson(Map<String, dynamic> json) =>
      _$SupplierFromJson(json);
}
