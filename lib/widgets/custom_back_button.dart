import 'package:bloc_practice/res/constants/media_constants.dart';
import 'package:bloc_practice/res/theme/theme.dart';
import 'package:bloc_practice/utils/responsiveSize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double? size;
  final Color? backgroundColor;
  final Color? iconColor;
  final EdgeInsets? padding;

  const CustomBackButton({
    super.key,
    this.onPressed,
    this.size,
    this.backgroundColor,
    this.iconColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () => Navigator.pop(context),
      child: Padding(
        padding: EdgeInsets.only(left: 24.rw(context)),
        child: Container(
          width: size ?? 40.rf(context),
          height: size ?? 40.rf(context),
          padding: padding ?? EdgeInsets.all(5.rf(context)),
          decoration: BoxDecoration(
            color: backgroundColor ?? CustomColors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: SvgPicture.asset(
            MediaConstants.arrowLeft,
            colorFilter: ColorFilter.mode(
              iconColor ?? CustomColors.milk3,
              BlendMode.srcIn,
            ),
            width:
                (size ?? 40.rf(context)) * 0.6, // Icon is 60% of container size
            height: (size ?? 40.rf(context)) * 0.6,
          ),
        ),
      ),
    );
  }
}
