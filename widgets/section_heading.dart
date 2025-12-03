// import 'package:flutter/material.dart';
// import 'package:pambuddy/res/theme/theme.dart';
// import 'package:pambuddy/utils/responsiveSize.dart';

// /// Reusable section heading text widget
// /// Used for section titles like "Recommended Method", "Bank Account", etc.
// /// This component is used across multiple screens (payment, refund, orders, profile)
// class SectionHeading extends StatelessWidget {
//   final String text;
//   final double? fontSize;
//   final FontWeight? fontWeight;
//   final Color? color;

//   const SectionHeading({
//     super.key,
//     required this.text,
//     this.fontSize,
//     this.fontWeight,
//     this.color,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//             color: color ?? CustomColors.textFieldHintColor,
//             fontSize: fontSize ?? 14.rf(context),
//             fontWeight: fontWeight ?? FontWeight.w400,
//           ),
//     );
//   }
// }
