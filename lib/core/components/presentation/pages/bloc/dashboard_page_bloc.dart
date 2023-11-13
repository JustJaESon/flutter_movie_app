import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_page_event.dart';
part 'dashboard_page_state.dart';

class DashboardPageBloc extends Bloc<DashboardPageEvent, DashboardPageState> {
  DashboardPageBloc() : super(const DashboardPageInitial(tabIndex: 0)) {
    on<DashboardPageEvent>(_dashboardPageEvent);
  }

  FutureOr<void> _dashboardPageEvent(
      DashboardPageEvent event, Emitter<DashboardPageState> emit) {
    if (event is TabChangeEvent) {
      emit(DashboardPageInitial(tabIndex: event.tabIndex));
    }
  }
}
