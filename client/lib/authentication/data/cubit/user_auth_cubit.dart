import 'package:bloc/bloc.dart';
import 'package:covid_vaccination/authentication/data/models/user.dart';
import 'package:covid_vaccination/authentication/data/repository/auth_repository.dart';
import 'package:covid_vaccination/core/errors/custom_exception.dart';
import 'package:meta/meta.dart';

part 'user_auth_state.dart';

class UserAuthCubit extends Cubit<UserAuthState> {
  final AuthRepository _authRepository = AuthRepository();
  UserAuthCubit() : super(UserAuthInitial());

  Future<void> loginUser(String email, String password) async {
    emit(UserAuthLoading());
    try {
      User user = await _authRepository.loginUser(email, password);
      emit(UserAuthLoaded(user));
    } on CustomException catch (e) {
      emit(UserAuthError(e.message));
    }
  }

  Future<void> registerUser(User user) async {
    emit(UserAuthLoading());
    try {
      await _authRepository.registerUser(user);
      emit(UserAuthLoaded(user));
    } on CustomException catch (e) {
      emit(UserAuthError(e.message));
    }
  }
}
