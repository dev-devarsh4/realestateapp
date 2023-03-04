import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/base/base_bloc.dart';
import '../../../../../core/bloc/master_bloc.dart';
import '../../../../../core/bloc/master_event.dart';
import '../../../../../di/injection_container.dart';
import '../../../../splash/domain/splash_repo.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  SplashRepo splashRepo = sl();

  LoginBloc(MasterBloc baseBlocObject)
      : super(baseBlocObject, InitialState()) {
    on<FetchUsersEvent>((event, emit) async {
      await fetchUsers(event, emit);
    });
  }

  Future<void> fetchUsers(FetchUsersEvent event, Emitter emit) async {
    baseBlocObject!.add(LoadApiEvent());
    final loadedPensionData = await splashRepo.fetchUsers();

    loadedPensionData.fold((l) {
      baseBlocObject!.objectModel = l;
      baseBlocObject!.add(ErrorApiEvent(shouldGoBack: false));
    }, (r) {
      baseBlocObject!.add(LoadedApiEvent());
      // emit(FetchUsersState());
    });
  }
}
