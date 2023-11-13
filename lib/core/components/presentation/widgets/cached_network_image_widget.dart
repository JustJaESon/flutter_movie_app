import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/resources/app_theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class CustomCachedNetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  const CustomCachedNetworkImageWidget(
      {super.key,
      required this.imageUrl,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[850]!,
        highlightColor: Colors.grey[800]!,
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: AppColors.secondaryBackground),
      ),
      errorWidget: (context, url, error) =>
          const Icon(Icons.error), // You can customize the error widget
    );
  }
}
