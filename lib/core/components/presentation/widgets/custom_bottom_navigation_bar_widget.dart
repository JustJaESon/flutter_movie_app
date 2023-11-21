// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_movie_app/core/components/presentation/pages/bloc/dashboard_page_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:flutter_movie_app/core/resources/app_theme/app_colors.dart';

class CustomBottomNavigationBarWidget extends StatelessWidget {
  const CustomBottomNavigationBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondaryBackground,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: BlocBuilder<DashboardPageBloc, DashboardPageState>(
          builder: (context, state) {
            return GNav(
              onTabChange: (value) {
                BlocProvider.of<DashboardPageBloc>(context)
                    .add(TabChangeEvent(tabIndex: value));
              },
              selectedIndex: state.tabIndex,
              activeColor: AppColors.primaryColor,
              color: Colors.white70,
              backgroundColor: AppColors.secondaryBackground,
              tabBackgroundColor: AppColors.secondaryColor.withOpacity(.2),
              gap: 8.w,
              padding: EdgeInsets.all(10.h),
              tabs: const [
                GButton(
                  icon: Icons.movie_outlined,
                  text: "Movies",
                ),
                GButton(
                  icon: Icons.tv_outlined,
                  text: "Shows",
                ),
                GButton(
                  icon: Icons.person,
                  text: "Profile",
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
