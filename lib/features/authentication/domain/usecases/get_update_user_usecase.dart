import 'package:todo_app/features/authentication/domain/entities/user_entity.dart';
import 'package:todo_app/features/authentication/domain/repository/auth_repository.dart';

class GetUpdateUserUseCase {
  final AuthRepository repository;

  GetUpdateUserUseCase({required this.repository});

  Future<void> call(UserEntity user) {
    return repository.getUpdateUser(user);
  }
}
