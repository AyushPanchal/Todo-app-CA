import 'package:todo_app/features/authentication/domain/repository/auth_repository.dart';

import '../entities/user_entity.dart';

class GetOrCreateUserUseCase {
  final AuthRepository repository;

  GetOrCreateUserUseCase({required this.repository});

  Future<void> call(UserEntity user) async {
    return repository.getOrCreateUser(user);
  }
}
