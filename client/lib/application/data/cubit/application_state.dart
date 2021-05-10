part of 'application_cubit.dart';

@immutable
abstract class ApplicationState {}

class ApplicationLoading extends ApplicationState {}

class ApplicationEmpty extends ApplicationState {}

class ApplicationListLoaded extends ApplicationState {
  final ApplicationList applicationList;

  ApplicationListLoaded(this.applicationList);

  @override
  String toString() => 'ApplicationListLoaded(applicationList: $applicationList)';
}

class ApplicationLoaded extends ApplicationState {
  final Application application;

  ApplicationLoaded(this.application);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ApplicationLoaded && other.application == application;
  }

  @override
  int get hashCode => application.hashCode;

  @override
  String toString() => 'ApplicationLoaded(application: $application)';
}

class ApplicationError extends ApplicationState {
  final String error;

  ApplicationError(this.error);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ApplicationError && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;
}
