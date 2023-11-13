part of 'dashboard_page_bloc.dart';

sealed class DashboardPageEvent extends Equatable {
  const DashboardPageEvent();

  @override
  List<Object> get props => [];
}

class TabChangeEvent extends DashboardPageEvent {
  final int tabIndex;
  const TabChangeEvent({required this.tabIndex});
}
