import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/components/presentation/widgets/cached_network_image_widget.dart';
import 'package:flutter_movie_app/core/components/presentation/widgets/custom_shadermask_widget.dart';
import 'package:flutter_movie_app/core/resources/app_theme/app_theme.dart';
import 'package:flutter_movie_app/core/utils/functions.dart';
import 'package:flutter_movie_app/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsHeaderWidget extends StatelessWidget {
  final MovieDetailsEntity movieDetails;
  const DetailsHeaderWidget({
    super.key,
    required this.movieDetails,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Stack(
        children: [
          CustomShadermaskWidget(
            shaderMaskImg: getNetworkImage(movieDetails.backdropPath),
          ),
          Positioned.fill(
            top: 80.h,
            left: 20.w,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: HeaderInformation(movieDetails: movieDetails),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderInformation extends StatelessWidget {
  const HeaderInformation({
    super.key,
    required this.movieDetails,
  });

  final MovieDetailsEntity movieDetails;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            height: 130.h,
            width: 100.w,
            child: Opacity(
                opacity: 0.8,
                child: CustomCachedNetworkImageWidget(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  imageUrl: getNetworkImage(movieDetails.posterPath),
                )),
          ),
        ),
        const SizedBox(
          width: 14,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(movieDetails.originalTitle,
                  maxLines: 2, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    getDateYear(movieDetails.relaseDate),
                    maxLines: 1,
                    style: CustomTextStyle().detailsSubInformation,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const DotSeparator(),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    movieDetails.genres,
                    maxLines: 1,
                    style: CustomTextStyle().detailsSubInformation,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const DotSeparator(),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Text(
                      movieDetails.runtime,
                      maxLines: 1,
                      style: CustomTextStyle().detailsSubInformation,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.star_rate_rounded,
                    color: Colors.amber,
                    size: 20,
                  ),
                  Text("${movieDetails.voteAverage}",
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    movieDetails.voteCount,
                    style: CustomTextStyle().detailsSubInformation,
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class DotSeparator extends StatelessWidget {
  const DotSeparator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "\u25CF",
      style: TextStyle(
        color: Colors.white70,
      ),
    );
  }
}
