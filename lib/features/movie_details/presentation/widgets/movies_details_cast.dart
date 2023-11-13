import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/components/presentation/widgets/cached_network_image_widget.dart';
import 'package:flutter_movie_app/core/utils/functions.dart';
import 'package:flutter_movie_app/features/movie_details/domain/entities/movie_cast_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetailsCastWidget extends StatelessWidget {
  final List<MovieCastEntity> casts;
  const MovieDetailsCastWidget({super.key, required this.casts});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Casts",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: 8.h,
        ),
        SizedBox(
          height: 220.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: casts.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                          height: 140.h,
                          width: 100.w,
                          child: CustomCachedNetworkImageWidget(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            imageUrl:
                                getProfileImageUrl(casts[index].profilePath),
                          )),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      width: 100.w,
                      child: Text(casts[index].name,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
