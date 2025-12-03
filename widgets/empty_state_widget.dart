import 'package:bloc_practice/utils/responsiveSize.dart';
import 'package:flutter/material.dart';


class EmptyStateWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Color? iconColor;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final Widget? customIcon;

  const EmptyStateWidget({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.iconColor,
    this.titleStyle,
    this.subtitleStyle,
    this.customIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customIcon ??
              Icon(
                icon,
                size: 64.rf(context),
                color: iconColor ?? Colors.grey,
              ),
          SizedBox(height: 16.rh(context)),
          Text(
            title,
            style: titleStyle ??
                TextStyle(
                  fontSize: 18.rf(context),
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
            textAlign: TextAlign.center,
          ),
          if (subtitle != null) ...[
            SizedBox(height: 8.rh(context)),
            Text(
              subtitle!,
              style: subtitleStyle ??
                  TextStyle(
                    fontSize: 14.rf(context),
                    color: Colors.grey[500],
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}

