import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'admin_auth_state.dart';

class AdminAuthCubit extends Cubit<AdminAuthState> {
  AdminAuthCubit() : super(AdminAuthInitial());
}
