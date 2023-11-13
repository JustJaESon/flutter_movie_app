import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/resources/app_theme/app_colors.dart';
import 'package:flutter_movie_app/core/utils/functions.dart';
import 'package:flutter_movie_app/features/movie_details/domain/entities/movie_review_entity.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoviesDetailsReviewsWidget extends StatelessWidget {
  final List<MovieReviewEntity> _movieReviews;
  const MoviesDetailsReviewsWidget(this._movieReviews, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Reviews", style: Theme.of(context).textTheme.titleLarge),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: _movieReviews.length,
            itemBuilder: (BuildContext context, int index) {
              return MovieDetailsReviewCard(_movieReviews[index]);
            },
          ),
        ),
      ],
    );
  }
}

class MovieDetailsReviewCard extends StatelessWidget {
  final MovieReviewEntity _movieReview;
  const MovieDetailsReviewCard(this._movieReview, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0.w, 8.h, 28.w, 0.h),
      padding: EdgeInsets.fromLTRB(12.w, 16.h, 12.w, 12.h),
      decoration: BoxDecoration(
          color: AppColors.secondaryBackground,
          borderRadius: BorderRadius.circular(10)),
      width: MediaQuery.of(context).size.width * .9.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipOval(
                child: SizedBox(
                  height: 50.h,
                  width: 50.w,
                  child: CachedNetworkImage(
                    imageUrl: getProfileImageUrl(_movieReview.avatarUrl),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_movieReview.authorName,
                        style: Theme.of(context).textTheme.titleLarge),
                    Text("@${_movieReview.authorUsername}",
                        style: Theme.of(context).textTheme.titleMedium)
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_movieReview.content,
                    maxLines: 5,
                    style: Theme.of(context).textTheme.displayMedium),
                _getRatingBarIndicator(_movieReview.rating),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _getRatingBarIndicator(double rating) {
  return RatingBarIndicator(
    unratedColor: Colors.grey,
    rating: rating,
    itemBuilder: (_, __) => const Icon(
      Icons.star_rate_rounded,
      color: Colors.amber,
    ),
    itemCount: 5,
    itemSize: 24.0,
    direction: Axis.horizontal,
  );
}
