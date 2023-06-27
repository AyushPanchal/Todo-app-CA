import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? uid;
  final String? email;
  final String? password;
  final String? username;
  final String? profileUrl;

  const UserEntity({
    this.uid,
    this.email,
    this.password,
    this.username,
    this.profileUrl,
  });

  @override
  List<Object?> get props => [
        uid,
        email,
        username,
        password,
        profileUrl,
      ];
}
