import 'package:todo_app/features/authentication/domain/entities/user_entity.dart';
import 'package:todo_app/features/authentication/domain/repository/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository repository;

  SignOutUseCase({required this.repository});

  Future<void> call() {
    return repository.signOut();
  }
}
