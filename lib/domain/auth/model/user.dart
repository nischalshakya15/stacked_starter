import 'package:json_annotation/json_annotation.dart';
import 'package:stacked_starter/domain/auth/model/authority.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int id;
  String username;
  Set<Authority> authorities;

  User({this.id, this.username, this.authorities});

  factory User.fromJson(
      Map<String, dynamic> authenticationRequest) =>
      _$UserFromJson(authenticationRequest);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User{id: $id, username: $username, authorities: $authorities}';
  }
}
