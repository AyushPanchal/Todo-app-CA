import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/features/authentication/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String? uid;
  final String? email;
  final String? username;
  final String? profileUrl;
  final String? password;

  const UserModel({
    this.uid,
    this.email,
    this.password,
    this.username,
    this.profileUrl,
  }) : super(
          email: email,
          profileUrl: profileUrl,
          password: password,
          uid: uid,
          username: username,
        );

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      uid: data['uid'],
      email: data['email'],
      username: data['username'],
      profileUrl: data['profileUrl'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'profileUrl': profileUrl,
    };
  }
}
