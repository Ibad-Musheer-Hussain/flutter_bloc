// import 'package:flutter/material.dart';
// import 'package:pambuddy/res/theme/theme.dart';
// import 'package:pambuddy/utils/responsiveSize.dart';

// /// Reusable subtitle text widget
// /// Used for secondary text like "Inclusive Of All Taxes", card type labels, etc.
// /// This component is used across multiple screens for consistent subtitle styling
// class SubtitleText extends StatelessWidget {
//   final String text;
//   final double? fontSize;
//   final Color? color;
//   final TextAlign? textAlign;

//   const SubtitleText({
//     super.key,
//     required this.text,
//     this.fontSize,
//     this.color,
//     this.textAlign,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       textAlign: textAlign,
//       style: Theme.of(context).textTheme.bodySmall?.copyWith(
//             color: color ?? CustomColors.secondaryTextColor,
//             fontSize: fontSize ?? 10.rf(context),
//           ),
//     );
//   }
// }
