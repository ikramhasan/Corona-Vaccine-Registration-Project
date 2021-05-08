part of 'dose_cubit.dart';

@immutable
abstract class DoseState {}

class DoseLoading extends DoseState {}

class DoseLoaded extends DoseState {
  final Dose dose;

  DoseLoaded(this.dose);

  @override
  String toString() => 'DoseLoaded(dose: $dose)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DoseLoaded && other.dose == dose;
  }

  @override
  int get hashCode => dose.hashCode;
}

class DoseError extends DoseState {
  final String message;

  DoseError(this.message);
}
