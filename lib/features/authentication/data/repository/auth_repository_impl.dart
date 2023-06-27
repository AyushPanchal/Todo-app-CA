import 'package:todo_app/features/authentication/data/data_source/remote/remote_data_source.dart';
import 'package:todo_app/features/authentication/domain/entities/user_entity.dart';
import 'package:todo_app/features/authentication/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final RemoteDataSource _remoteDataSource;

  AuthRepositoryImpl({required RemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<void> forgotPassword(String email) =>
      _remoteDataSource.forgotPassword(email);

  @override
  Future<String> getCurrentUId() => _remoteDataSource.getCurrentUId();

  @override
  Future<void> getOrCreateUser(UserEntity user) =>
      _remoteDataSource.getOrCreateUser(user);

  @override
  Stream<List<UserEntity>> getSingleUser(UserEntity user) =>
      _remoteDataSource.getSingleUser(user);

  @override
  Future<void> getUpdateUser(UserEntity user) =>
      _remoteDataSource.getUpdateUser(user);

  @override
  Future<bool> isSignIn() => _remoteDataSource.isSignIn();

  @override
  Future<void> signIn(UserEntity user) => _remoteDataSource.signIn(user);

  @override
  Future<void> signOut() => _remoteDataSource.signOut();

  @override
  Future<void> signUp(UserEntity user) => _remoteDataSource.signUp(user);
}
