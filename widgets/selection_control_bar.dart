// import 'package:flutter/material.dart';
// import 'package:pambuddy/res/theme/theme.dart';
// import 'package:pambuddy/utils/responsiveSize.dart';

// /// Reusable selection control bar widget for selective checkout feature
// /// Displays selection count and "Select All" checkbox
// /// Used across cart, new subscription, and edit subscription flows
// class SelectionControlBar extends StatelessWidget {
//   final int selectedCount;
//   final int totalCount;
//   final bool areAllSelected;
//   final VoidCallback onToggleSelectAll;

//   const SelectionControlBar({
//     super.key,
//     required this.selectedCount,
//     required this.totalCount,
//     required this.areAllSelected,
//     required this.onToggleSelectAll,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Container(
//         padding: EdgeInsets.symmetric(
//           horizontal: 24.rw(context),
//           vertical: 12.rh(context),
//         ),
//         decoration: BoxDecoration(
//           color: CustomColors.milk3.withOpacity(0.4),
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(
//             color: CustomColors.milk3.withOpacity(0.6),
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             // Selection count display
//             Text(
//               '$selectedCount of $totalCount selected',
//               style: TextStyle(
//                 fontSize: 14.rf(context),
//                 fontWeight: FontWeight.w500,
//                 color: CustomColors.primaryTextColor,
//                 fontFamily: 'Poppins',
//               ),
//             ),
//             // Select All checkbox with label
//             GestureDetector(
//               onTap: onToggleSelectAll,
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Checkbox(
//                     value: areAllSelected,
//                     onChanged: (_) => onToggleSelectAll(),
//                     activeColor: CustomColors.primary,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                     visualDensity: VisualDensity.compact,
//                   ),
//                   SizedBox(width: 4.rw(context)),
//                   Text(
//                     'Select All',
//                     style: TextStyle(
//                       fontSize: 14.rf(context),
//                       fontWeight: FontWeight.w600,
//                       color: CustomColors.primaryTextColor,
//                       fontFamily: 'Poppins',
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
