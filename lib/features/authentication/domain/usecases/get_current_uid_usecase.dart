import 'package:todo_app/features/authentication/domain/entities/user_entity.dart';
import 'package:todo_app/features/authentication/domain/repository/auth_repository.dart';

class GetCurrentUidUseCase {
  final AuthRepository repository;

  GetCurrentUidUseCase({required this.repository});

  Future<String> call() async {
    return repository.getCurrentUId();
  }
}
