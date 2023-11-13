import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/components/presentation/widgets/cached_network_image_widget.dart';
import 'package:flutter_movie_app/core/utils/functions.dart';
import 'package:flutter_movie_app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_movie_app/features/movie_details/presentation/pages/movie_details_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoviesSelectionCard extends StatelessWidget {
  final String movieGroup;
  final List<MovieEntity> movie;
  final Function func;
  const MoviesSelectionCard(
      {super.key,
      required this.movie,
      required this.movieGroup,
      required this.func});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 4.w,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(movieGroup, style: Theme.of(context).textTheme.titleLarge),
              GestureDetector(
                  onTap: () => func(),
                  child: Text("See All >",
                      style: Theme.of(context).textTheme.titleSmall))
            ],
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        SizedBox(
          height: 175.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movie.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailsPage(
                        movieId: movie[index].id,
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
                          width: 110,
                          child: CustomCachedNetworkImageWidget(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            imageUrl: getNetworkImage(movie[index].posterPath),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      // Container(
                      //   padding: EdgeInsets.symmetric(horizontal: 6.w),
                      //   width: 110.w,
                      //   child: Text(
                      //     movie[index].title,
                      //     maxLines: 2,
                      //     overflow: TextOverflow.ellipsis,
                      //     textAlign: TextAlign.start,
                      //     style: Theme.of(context).textTheme.titleMedium,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
