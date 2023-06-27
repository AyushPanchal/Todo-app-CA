import 'package:todo_app/features/authentication/domain/repository/auth_repository.dart';

class ForgotPasswordUseCase {
  final AuthRepository repository;

  ForgotPasswordUseCase({required this.repository});

  Future<void> call(String email) async {
    return repository.forgotPassword(email);
  }
}
