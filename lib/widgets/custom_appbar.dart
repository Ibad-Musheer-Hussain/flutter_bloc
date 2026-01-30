import 'package:bloc_practice/res/theme/theme.dart';
import 'package:bloc_practice/utils/responsiveSize.dart';
import 'package:bloc_practice/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final String title;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final bool? centerTitle;
  final String? actionSvgPath;
  final VoidCallback? onActionTap;
  final List<Widget>? actions;
  const CustomAppBar({
    super.key,
    required this.showBackButton,
    required this.title,
    this.actions,
    this.centerTitle,
    this.textStyle,
    this.backgroundColor,
    this.actionSvgPath,
    this.onActionTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 2);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? CustomColors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            centerTitle: centerTitle ?? false,
            leadingWidth: 70,
            automaticallyImplyLeading: showBackButton,
            backgroundColor: Colors.transparent,
            leading: showBackButton ? const CustomBackButton() : null,
            title: Text(
              title,
              style: textStyle ??
                  Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(fontSize: 15.rf(context)),
            ),
            actions: [
              if (actionSvgPath != null)
                GestureDetector(
                  onTap: onActionTap ?? () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SvgPicture.asset(
                      actionSvgPath!,
                      height: 25.rh(context),
                      width: 25.rh(context),
                    ),
                  ),
                ),
              if (actions != null) ...actions!,
            ],
            elevation: 0,
            shadowColor: Colors.transparent,
            scrolledUnderElevation: 0,
            systemOverlayStyle: backgroundColor == Colors.transparent
                ? const SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: Brightness.dark,
                  )
                : null,
          ),
          if (backgroundColor != Colors.transparent)
            Container(
              height: 1.0,
              color: CustomColors.secondaryTextColor.withAlpha(64),
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
            ),
        ],
      ),
    );
  }
}
