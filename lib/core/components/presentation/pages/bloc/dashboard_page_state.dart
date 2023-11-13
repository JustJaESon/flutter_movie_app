part of 'dashboard_page_bloc.dart';

sealed class DashboardPageState extends Equatable {
  final int tabIndex;
  const DashboardPageState({required this.tabIndex});

  @override
  List<Object> get props => [tabIndex];
}

final class DashboardPageInitial extends DashboardPageState {
  const DashboardPageInitial({required super.tabIndex});
}
