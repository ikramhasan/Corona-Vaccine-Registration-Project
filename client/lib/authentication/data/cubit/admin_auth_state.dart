part of 'admin_auth_cubit.dart';

@immutable
abstract class AdminAuthState {}

class AdminAuthInitial extends AdminAuthState {}

class AdminAuthLoading extends AdminAuthState {}

class AdminAuthLoaded extends AdminAuthState {
}

class AdminAuthError extends AdminAuthState {
  final String message;

  AdminAuthError(this.message);

  @override
  String toString() => 'AdminAuthError(message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AdminAuthError &&
      other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
