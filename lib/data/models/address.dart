import 'package:json_annotation/json_annotation.dart';
import 'package:multi_purpose_app/data/models/geo.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  Address(
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  );

  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
