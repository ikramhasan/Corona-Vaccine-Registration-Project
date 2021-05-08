import 'package:bloc/bloc.dart';
import 'package:covid_vaccination/core/errors/custom_exception.dart';
import 'package:covid_vaccination/dose/data/models/dose.dart';
import 'package:covid_vaccination/dose/data/repository/dose_repository.dart';
import 'package:meta/meta.dart';

part 'dose_state.dart';

class DoseCubit extends Cubit<DoseState> {
  DoseRepository _repository = DoseRepository();

  DoseCubit() : super(DoseLoading());

  Future<void> getDoseForUser(int userId) async {
    emit(DoseLoading());

    try {
      Dose dose = await _repository.getDoseForUser(userId);
      emit(DoseLoaded(dose));
    } on CustomException catch (e) {
      emit(DoseError(e.message));
    }
  }
}
