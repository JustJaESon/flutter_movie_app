import 'package:flutter_movie_app/core/components/presentation/pages/main_dashboard_page.dart';
import 'package:go_router/go_router.dart';

class Routes {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: MainDashboardPage.routeName,
        builder: (context, state) => const MainDashboardPage(),
      ),
    ],
  );
}
