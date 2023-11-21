import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/core/components/presentation/pages/bloc/dashboard_page_bloc.dart';
import 'package:flutter_movie_app/core/components/presentation/widgets/custom_bottom_navigation_bar_widget.dart';
import 'package:flutter_movie_app/features/movies/presentation/pages/movies_page.dart';

class MainDashboardPage extends StatelessWidget {
  const MainDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardPageBloc(),
      child: Scaffold(
        body: BlocBuilder<DashboardPageBloc, DashboardPageState>(
          builder: (context, state) {
            switch (state.tabIndex) {
              case 0:
                return const MoviesPage();
              case 1:
                return const Center(
                    child: Text(
                  "series",
                  style: TextStyle(color: Colors.white),
                ));
              default:
                return const Center(
                    child: Text(
                  "profile",
                  style: TextStyle(color: Colors.white),
                ));
            }
          },
        ),
        bottomNavigationBar: const CustomBottomNavigationBarWidget(),
      ),
    );
  }
}
