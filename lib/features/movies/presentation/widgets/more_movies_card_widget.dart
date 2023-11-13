import 'package:flutter/material.dart';
import 'package:flutter_movie_app/features/movie_details/presentation/pages/movie_details_page.dart';
import 'package:flutter_movie_app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/presentation/widgets/cached_network_image_widget.dart';
import '../../../../core/components/presentation/widgets/custom_shadermask_widget.dart';
import '../../../../core/resources/app_theme/app_colors.dart';
import '../../../../core/utils/functions.dart';

class MoviesCardWidget extends StatelessWidget {
  final MovieEntity movieEntity;
  const MoviesCardWidget({super.key, required this.movieEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailsPage(
              movieId: movieEntity.id,
            ),
          ),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 6.h),
        margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
        height: MediaQuery.of(context).size.height * .27.h,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            _cardBackgroundWidget(context),
            _cardContentWidget(context),
          ],
        ),
      ),
    );
  }

  Positioned _cardContentWidget(BuildContext context) {
    return Positioned.fill(
      top: 10,
      left: 10,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 90.h,
                      width: 70.w,
                      child: CustomCachedNetworkImageWidget(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        imageUrl: getNetworkImage(movieEntity.posterPath),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 250.w,
                          child: Text(
                            movieEntity.title,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          children: [
                            Text(
                              getDateYear(movieEntity.releaseDate),
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            const Icon(
                              Icons.star_rate_rounded,
                              color: AppColors.ratingColor,
                            ),
                            Text(
                              movieEntity.voteAverage.toStringAsFixed(2),
                              style: Theme.of(context).textTheme.titleSmall,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Expanded(
                child: Text(
                  movieEntity.overview,
                  textAlign: TextAlign.start,
                  maxLines: 4,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stack _cardBackgroundWidget(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CustomShadermaskWidget(
                shaderMaskImg: getNetworkImage(movieEntity.backdropPath),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(.5),
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ],
    );
  }
}
