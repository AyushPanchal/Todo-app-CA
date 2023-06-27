import 'package:todo_app/features/authentication/domain/repository/auth_repository.dart';

class IsSignInUseCase {
  final AuthRepository repository;

  IsSignInUseCase({required this.repository});

  Future<bool> call() async {
    return repository.isSignIn();
  }
}
