import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/components/presentation/widgets/cached_network_image_widget.dart';
import 'package:flutter_movie_app/core/resources/app_theme/app_colors.dart';

class CustomShadermaskWidget extends StatelessWidget {
  final String shaderMaskImg;
  const CustomShadermaskWidget({super.key, required this.shaderMaskImg});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.dstIn,
      shaderCallback: (rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.backgroundColor.withOpacity(0.6),
            AppColors.backgroundColor.withOpacity(0.6),
            Colors.transparent
          ],
          stops: const [0.3, 0.5, 1],
        ).createShader(
          Rect.fromLTRB(0, 0, rect.width, rect.height),
        );
      },
      child: CustomCachedNetworkImageWidget(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        imageUrl: shaderMaskImg,
      ),
    );
  }
}
