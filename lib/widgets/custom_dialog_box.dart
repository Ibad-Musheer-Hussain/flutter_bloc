import 'package:bloc_practice/res/constants/constants.dart';
import 'package:bloc_practice/res/theme/theme.dart';
import 'package:bloc_practice/utils/responsiveSize.dart';
import 'package:bloc_practice/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final String acceptButtonText;
  final VoidCallback acceptButtonOnTap;
  final bool? showTextField;
  final Widget? textField;
  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    required this.acceptButtonText,
    required this.acceptButtonOnTap,
    this.showTextField = false,
    this.textField,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        systemNavigationBarDividerColor: Colors.transparent,
        statusBarColor: Colors.black.withValues(alpha: 0),
      ),
      child: AlertDialog(
        backgroundColor: CustomColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: CustomColors.primaryTextColor,
                fontWeight: FontWeight.w700,
                fontSize: context.font.larger + 2.rf(context),
                letterSpacing: 0.25,
              ),
          textAlign: TextAlign.center,
        ),
        content: showTextField == true
            ? textField
            : Text(
                content,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: CustomColors.secondaryTextColor,
                      fontWeight: FontWeight.w400,
                      fontSize: context.font.normal.rf(context),
                      letterSpacing: 1,
                      height: 1.3,
                    ),
              ),
        actionsOverflowAlignment: OverflowBarAlignment.center,
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Cancel Button
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.rw(context)),
                  child: CustomButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    buttonTitle: Constants.cancel,
                    buttonColor: CustomColors.textFieldFillColor,
                    textColor: CustomColors.primary,
                    height: 49,
                    radius: 10,
                    fontSize: context.font.normal.rf(context),
                    showElevation: false,
                  ),
                ),
              ),
              SizedBox(width: 10.rw(context)),
              // Accept Button
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.rw(context)),
                  child: CustomButton(
                    onPressed: acceptButtonOnTap,
                    buttonTitle: acceptButtonText,
                    buttonColor: CustomColors.primary,
                    textColor: CustomColors.white,
                    height: 49,
                    radius: 10,
                    fontSize: context.font.normal.rf(context),
                    showElevation: false,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
