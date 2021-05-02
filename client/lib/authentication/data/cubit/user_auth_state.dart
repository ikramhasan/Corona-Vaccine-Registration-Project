part of 'user_auth_cubit.dart';

@immutable
abstract class UserAuthState {}

class UserAuthInitial extends UserAuthState {}

class UserAuthLoading extends UserAuthState {}

class UserAuthError extends UserAuthState {
  final String message;

  UserAuthError(this.message);

  @override
  String toString() => 'UserAuthError(message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserAuthError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class UserAuthLoaded extends UserAuthState {
  final User user;

  UserAuthLoaded(this.user);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserAuthLoaded && other.user == user;
  }

  @override
  int get hashCode => user.hashCode;

  @override
  String toString() => 'UserAuthLoaded(user: $user)';
}
