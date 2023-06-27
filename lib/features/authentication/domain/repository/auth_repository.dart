import 'package:todo_app/features/authentication/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<void> getOrCreateUser(UserEntity user);

  Future<void> forgotPassword(String email);

  Future<bool> isSignIn();

  Future<void> signIn(UserEntity user);

  Future<void> signUp(UserEntity user);

  Future<void> signOut();

  Future<void> getUpdateUser(UserEntity user);

  Future<String> getCurrentUId();

  Stream<List<UserEntity>> getSingleUser(UserEntity user);
}
