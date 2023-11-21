import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/components/presentation/widgets/cached_network_image_widget.dart';
import 'package:flutter_movie_app/core/utils/functions.dart';
import 'package:flutter_movie_app/features/movie_details/domain/entities/movie_similar_entity.dart';
import 'package:flutter_movie_app/features/movie_details/presentation/pages/movie_details_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetailsSimilarWidget extends StatelessWidget {
  final List<MovieSimilarEntity> movieSimilar;
  const MovieDetailsSimilarWidget({
    super.key,
    required this.movieSimilar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Similar",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: 8.h,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 170.h,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: movieSimilar.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailsPage(
                      movieId: movieSimilar[index].id,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: 155.h,
                        width: 110.w,
                        child: CustomCachedNetworkImageWidget(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          imageUrl:
                              getNetworkImage(movieSimilar[index].posterPath),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
