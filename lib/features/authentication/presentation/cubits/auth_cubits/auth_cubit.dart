import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/features/authentication/domain/usecases/get_current_uid_usecase.dart';
import 'package:todo_app/features/authentication/domain/usecases/is_sign_in_usecase.dart';
import 'package:todo_app/features/authentication/domain/usecases/sign_out_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IsSignInUseCase _isSignInUseCase;
  final SignOutUseCase _signOutUseCase;
  final GetCurrentUidUseCase _getCurrentUidUseCase;

  AuthCubit({
    required IsSignInUseCase isSignInUseCase,
    required SignOutUseCase signOutUseCase,
    required GetCurrentUidUseCase getCurrentUidUseCase,
  })  : _getCurrentUidUseCase = getCurrentUidUseCase,
        _signOutUseCase = signOutUseCase,
        _isSignInUseCase = isSignInUseCase,
        super(AuthInitial());

  Future<void> appStarted() async {
    try {
      bool isSignIn = await _isSignInUseCase.call();

      if (isSignIn) {
        String uid = await _getCurrentUidUseCase.call();
        emit(Authenticated(userId: uid));
      } else {
        emit(UnAuthenticated());
      }
    } catch (e) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedIn() async {
    try {
      String uid = await _getCurrentUidUseCase.call();
      emit(Authenticated(userId: uid));
    } catch (e) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedOut() async {
    try {
      await _signOutUseCase.call();
      emit(UnAuthenticated());
    } catch (e) {
      emit(UnAuthenticated());
    }
  }
}
