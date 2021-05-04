import 'package:bloc/bloc.dart';
import 'package:covid_vaccination/authentication/data/models/admin.dart';
import 'package:covid_vaccination/authentication/data/repository/admin_auth_repository.dart';
import 'package:covid_vaccination/core/errors/custom_exception.dart';
import 'package:meta/meta.dart';

part 'admin_auth_state.dart';

class AdminAuthCubit extends Cubit<AdminAuthState> {
  final AdminAuthRepository _repository = AdminAuthRepository();
  AdminAuthCubit() : super(AdminAuthInitial());

  Future<void> loginAdmin(String email, String password) async {
    emit(AdminAuthLoading());
    try {
      Admin admin = await _repository.loginAdmin(email, password);
      emit(AdminAuthLoaded(admin));
    } on CustomException catch (e) {
      emit(AdminAuthError(e.message));
    }
  }

  Future<void> registerAdmin(Admin admin) async {
    emit(AdminAuthLoading());
    try {
      await _repository.registerAdmin(admin);
      emit(AdminAuthLoaded(admin));
    } on CustomException catch (e) {
      emit(AdminAuthError(e.message));
    }
  }
}
