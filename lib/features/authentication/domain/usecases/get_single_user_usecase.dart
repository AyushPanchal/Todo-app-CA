import 'package:todo_app/features/authentication/domain/entities/user_entity.dart';
import 'package:todo_app/features/authentication/domain/repository/auth_repository.dart';

class GetSingleUserUseCase {
  final AuthRepository repository;

  GetSingleUserUseCase({required this.repository});

  Stream<List<UserEntity>> call(UserEntity user) {
    return repository.getSingleUser(user);
  }
}
