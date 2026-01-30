// lib/widgets/detail_row.dart

import 'package:bloc_practice/res/theme/theme.dart';
import 'package:bloc_practice/utils/responsiveSize.dart';
import 'package:flutter/material.dart';


Widget detailRow({
  required IconData iconData,
  required String label,
  required String value,
  required BuildContext context,
}) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          CustomColors.milk2.withOpacity(0.6),
          CustomColors.milk2.withOpacity(0.2),
        ],
      ),
      borderRadius: BorderRadius.circular(6.rf(context)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.01),
          offset: const Offset(0, 2),
          blurRadius: 4,
          spreadRadius: 0,
        ),
      ],
      border: Border.all(
        color: CustomColors.milk2.withOpacity(1),
        width: 1.5.rf(context),
      ),
    ),
    padding: EdgeInsets.symmetric(
        horizontal: 8.rw(context), vertical: 10.rh(context)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 12.rw(context)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 13.rf(context),
                  color: CustomColors.primaryTextColor.withOpacity(0.9),
                  fontFamily: 'Poppins',
                  letterSpacing: 0.7,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.rh(context)),
              Row(
                children: [
                  Icon(
                    iconData,
                    size: 14.rf(context),
                    color: CustomColors.appbarTextColor.withOpacity(0.5),
                  ),
                  SizedBox(width: 4.rw(context)),
                  Expanded(
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: 12.rf(context),
                        color: CustomColors.appbarTextColor.withOpacity(0.4),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
