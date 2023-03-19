import 'package:json_annotation/json_annotation.dart';
part 'response.g.dart';
@JsonSerializable()
class BaseResponse{
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class CustomerResponse{
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "numOfNotification")
  int? numOfNotification;

  CustomerResponse(this.id, this.name, this.numOfNotification);

  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseFromJson(json);
}

@JsonSerializable()
class ContactsResponse{
  @JsonKey(name: "phone")
  String? phone;

  @JsonKey(name: "link")
  String? link;

  @JsonKey(name: "email")
  String? email;

  ContactsResponse(this.phone, this.link, this.email);

  factory ContactsResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactsResponseFromJson(json);
}
@JsonSerializable()
class AuthenticationResponse extends BaseResponse{
  @JsonKey(name: "customer")
  CustomerResponse? customer;

  @JsonKey(name: "contacts")
  ContactsResponse? contacts;
  AuthenticationResponse(this.customer, this.contacts);
  // from json
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}