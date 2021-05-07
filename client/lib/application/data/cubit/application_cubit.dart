import 'package:bloc/bloc.dart';
import 'package:covid_vaccination/application/data/models/application.dart';
import 'package:covid_vaccination/application/data/repository/application_repository.dart';
import 'package:covid_vaccination/core/errors/custom_exception.dart';
import 'package:meta/meta.dart';

part 'application_state.dart';

class ApplicationCubit extends Cubit<ApplicationState> {
  ApplicationRepository _repository = ApplicationRepository();
  ApplicationCubit() : super(ApplicationLoading());

  Future<void> getApplication(int id) async {
    emit(ApplicationLoading());

    try {
      Application application = await _repository.getApplicationById(id);

      if (application == null) {
        emit(ApplicationEmpty());
      } else {
        emit(ApplicationLoaded(application));
      }
    } on CustomException catch (e) {
      emit(ApplicationError(e.message));
    }
  }
}
