import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestateapp/features/dashboard/domain/dashboard_repo.dart';

import '../../../../../core/base/base_bloc.dart';
import '../../../../../core/bloc/master_bloc.dart';
import '../../../../../di/injection_container.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends BaseBloc<DashboardEvent, DashboardState> {
  DashboardRepo dashboardRepo = sl();

  DashboardBloc(MasterBloc baseBlocObject)
      : super(baseBlocObject, InitialState()) {
    on<LoadProductEvent>((event, emit) async {
      await fetchUsers(event, emit);
    });
  }

  Future<void> fetchUsers(LoadProductEvent event, Emitter emit) async {
    var result = await dashboardRepo.loadProducts();

    result.fold((l) {
      print("result is left");
    }, (r) {
      print("result is right");
      emit(LoadProductState(r.model));
    });
  }
}
