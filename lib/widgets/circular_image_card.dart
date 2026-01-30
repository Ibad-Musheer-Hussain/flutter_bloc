import 'package:bloc_practice/res/constants/media_constants.dart';
import 'package:bloc_practice/res/theme/theme.dart';
import 'package:bloc_practice/utils/responsiveSize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


/// Reusable circular image card with title - used in browse grids
class CircularImageCard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;
  final double? size;

  const CircularImageCard({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    final cardSize = size ?? 80.rf(context);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: cardSize,
            width: cardSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CustomColors.white,
            ),
            child: image.isNotEmpty
                ? ClipOval(
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return SvgPicture.asset(MediaConstants.diaper);
                      },
                    ),
                  )
                : SvgPicture.asset(MediaConstants.diaper),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 100.rw(context),
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(fontSize: 12.rf(context)),
            ),
          ),
        ],
      ),
    );
  }
}
