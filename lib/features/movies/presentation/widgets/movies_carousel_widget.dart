import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/components/presentation/widgets/custom_shadermask_widget.dart';
import 'package:flutter_movie_app/core/utils/functions.dart';
import 'package:flutter_movie_app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

class MoviesCarouselWidget extends StatelessWidget {
  final List<MovieEntity> allMovies;
  const MoviesCarouselWidget({
    super.key,
    required this.allMovies,
  });

  @override
  Widget build(BuildContext context) {
    double widgetHeight = 250.h;
    return SizedBox(
      height: widgetHeight,
      child: InfiniteCarousel.builder(
        itemCount: allMovies.length,
        itemExtent: MediaQuery.of(context).size.width,
        center: true,
        velocityFactor: .2,
        onIndexChanged: (index) {},
        axisDirection: Axis.horizontal,
        loop: true,
        itemBuilder: (context, itemIndex, realIndex) {
          return Stack(children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: widgetHeight,
                child: CustomShadermaskWidget(
                  shaderMaskImg:
                      getNetworkImage(allMovies[itemIndex].backdropPath),
                )),
            Positioned(
              left: 12.w,
              bottom: 32.h,
              right: 8.w,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(allMovies[itemIndex].title,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.titleLarge),
                    Text(
                      allMovies[itemIndex].releaseDate,
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }
}
