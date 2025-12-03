import 'package:bloc_practice/res/constants/constants.dart';
import 'package:bloc_practice/res/theme/theme.dart';
import 'package:bloc_practice/utils/responsiveSize.dart';
import 'package:bloc_practice/widgets/custom_button.dart';
import 'package:flutter/material.dart';


class CustomButtonToggle extends StatefulWidget {
  final VoidCallback onPrimaryPressed;
  final VoidCallback onSecondaryPressed;
  final String primaryTitle;
  final String secondaryTitle;
  final bool initialPrimarySelected;

  const CustomButtonToggle({
    super.key,
    required this.onPrimaryPressed,
    required this.onSecondaryPressed,
    required this.primaryTitle,
    required this.secondaryTitle,
    this.initialPrimarySelected = true,
  });

  @override
  State<CustomButtonToggle> createState() => _CustomButtonToggleState();
}

class _CustomButtonToggleState extends State<CustomButtonToggle> {
  late bool isPrimarySelected;

  @override
  void initState() {
    super.initState();
    isPrimarySelected = widget.initialPrimarySelected;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            onPressed: () {
              setState(() => isPrimarySelected = true);
              widget.onPrimaryPressed();
            },
            buttonTitle: widget.primaryTitle,
            buttonColor:
                isPrimarySelected ? CustomColors.primary : CustomColors.white,
            border: const BorderSide(color: CustomColors.primary),
            btnTextStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: isPrimarySelected
                      ? CustomColors.white
                      : CustomColors.primary,
                  fontSize: 14.rf(context),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                  fontFamily: Constants.fontFamily,
                ),
          ),
        ),
        SizedBox(width: 20.rw(context)),
        Expanded(
          child: CustomButton(
            onPressed: () {
              setState(() => isPrimarySelected = false);
              widget.onSecondaryPressed();
            },
            buttonTitle: widget.secondaryTitle,
            buttonColor:
                isPrimarySelected ? CustomColors.white : CustomColors.primary,
            border: const BorderSide(color: CustomColors.primary),
            btnTextStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: isPrimarySelected
                      ? CustomColors.primary
                      : CustomColors.white,
                  fontSize: 14.rf(context),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                  fontFamily: Constants.fontFamily,
                ),
          ),
        ),
      ],
    );
  }
}
