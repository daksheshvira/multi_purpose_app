import 'package:json_annotation/json_annotation.dart';
import 'package:multi_purpose_app/data/models/address.dart';
import 'package:multi_purpose_app/data/models/company.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User(
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  );

  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
