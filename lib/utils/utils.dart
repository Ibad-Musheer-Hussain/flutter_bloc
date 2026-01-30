import 'package:bloc_practice/res/constants/constants.dart';
import 'package:bloc_practice/res/constants/media_constants.dart';
import 'package:bloc_practice/res/theme/theme.dart';
import 'package:bloc_practice/utils/responsiveSize.dart';
import 'package:bloc_practice/widgets/custom_bottom_sheet.dart';
import 'package:bloc_practice/widgets/custom_button.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum MessageType {
  success(CustomColors.snackbarColor),
  warning(CustomColors.warningMessageColor),
  error(CustomColors.errorMessageColor);

  final Color value;
  const MessageType(this.value);
}

class Utils {
  static final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  // Getter to access the global key
  static GlobalKey<ScaffoldMessengerState> get scaffoldMessengerKey =>
      _scaffoldMessengerKey;

  static Future<String> getImage(ImageSource source) async {
    String imagePath = "";
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: source,
        imageQuality: 80,
      );
      if (pickedFile != null) {
        imagePath = pickedFile.path;
      }
      return imagePath;
    } catch (e) {
      if (kDebugMode) {
        print("Error picking image: $e");
      }
      return e.toString();
    }
  }

  static Future<List<String>> getMultipleImages() async {
    List<String> imagePaths = [];
    try {
      final pickedFiles = await ImagePicker().pickMultiImage(imageQuality: 80);
      if (pickedFiles.isNotEmpty) {
        imagePaths = pickedFiles.map((file) => file.path).toList();
      }

      return imagePaths;
    } catch (e) {
      return [];
    }
  }

  static String capitalizeFirstLetterOfEveryWord(String text) {
    List<String> words = text.split(' ');
    List<String> capitalizedWords =
        words.map((word) {
          if (word.isNotEmpty) {
            return word[0].toUpperCase() + word.substring(1);
          } else {
            return '';
          }
        }).toList();
    return capitalizedWords.join(' ');
  }

  static showSnackBarMessage(
    String message, {
    int messageDuration = 3,
    MessageType? type,
    bool? isFloating,
    VoidCallback? onClose,
  }) async {
    final snackBar = _scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.black)),
        behavior: (isFloating ?? false) ? SnackBarBehavior.floating : null,
        backgroundColor: type?.value,
        duration: Duration(seconds: messageDuration),
      ),
    );

    final snackBarClosedReason = await snackBar.closed;
    if (SnackBarClosedReason.values.contains(snackBarClosedReason)) {
      onClose?.call();
    }
  }

  static Widget progress({
    double? width,
    double? height,
    Color? normalProgressColor,
    bool? showWhite,
  }) {
    if (Constants.useLottieProgress) {
      return LottieBuilder.asset(
        'assets/lottie/${showWhite == true ? Constants.progressLottieFileWhite : Constants.progressLottieFile}',
        width: width ?? 45,
        height: height ?? 45,
        delegates: LottieDelegates(
          values: [
            ValueDelegate.color([
              'Layer 5 Outlines',
              'Group 1',
              '**',
            ], value: CustomColors.primary),
            ValueDelegate.color([
              'cube 4 Outlines',
              'Group 1',
              '**',
            ], value: CustomColors.primary),
            ValueDelegate.color([
              'cube 2 Outlines',
              'Group 1',
              '**',
            ], value: CustomColors.primary),
            ValueDelegate.color([
              'cube 3 Outlines',
              'Group 1',
              '**',
            ], value: CustomColors.primary),
          ],
        ),
      );
    } else {
      return CircularProgressIndicator(color: normalProgressColor);
    }
  }

  static Future<void> showCustomBottomSheet({
    required BuildContext context,
    required Widget child,
    bool? isScrolling,
  }) {
    return showModalBottomSheet(
      barrierColor: CustomColors.primaryTextColor.withValues(alpha: 0.4),
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: isScrolling ?? false,
      useSafeArea: true,
      builder: (context) => child,
    );
  }

  static void showToast(
    String message, {
    Toast toastLength = Toast.LENGTH_SHORT,
    ToastGravity gravity = ToastGravity.TOP,
    Color? backgroundColor,
    Color? textColor,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: gravity,
      backgroundColor: backgroundColor ?? CustomColors.snackbarColor,
      textColor: textColor ?? CustomColors.black,
    );
  }

  static String getMonthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }

  static void showImagePickerBottomSheet(
    BuildContext context, {
    required Function(String imagePath) onImageSelected,
    bool allowMultiple = false,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder:
          (context) => CustomBottomSheet(
            title: 'Choose Photo',
            options: const ['Camera', 'Gallery'],
            secondaryOptions: const ['Take a new photo', 'Choose from gallery'],
            prefixIcons: null,
            showIndicators: null,
            onSelectOption: (selectedOption) async {
              if (selectedOption == 'Camera') {
                final imagePath = await getImage(ImageSource.camera);
                if (imagePath.isNotEmpty) {
                  onImageSelected(imagePath);
                }
              } else if (selectedOption == 'Gallery') {
                if (allowMultiple) {
                  final imagePaths = await getMultipleImages();
                  for (final imagePath in imagePaths) {
                    if (imagePath.isNotEmpty) {
                      onImageSelected(imagePath);
                    }
                  }
                } else {
                  final imagePath = await getImage(ImageSource.gallery);
                  if (imagePath.isNotEmpty) {
                    onImageSelected(imagePath);
                  }
                }
              }
            },
          ),
    );
  }

  static void showAlertBox(
    BuildContext context, {
    String? title,
    String? message,
    String? cancelMessage,
    String? buttonMessage,
    String? svgPath,
    bool? showCancelButton = false,
    VoidCallback? onPressed,
    VoidCallback? onCancelPressed,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: CustomColors.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                // Background SVG
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SvgPicture.asset(
                      MediaConstants.alertBoxMask,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Content
                Padding(
                  padding: EdgeInsets.all(24.rw(context)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        svgPath ?? MediaConstants.subscription,
                        height: 24,
                        width: 24,
                        colorFilter: ColorFilter.mode(
                          CustomColors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(height: 12.rh(context)),
                      if (title != null) ...[
                        Text(
                          title,
                          style: Theme.of(
                            context,
                          ).textTheme.headlineSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16.rh(context)),
                      ],
                      if (message != null) ...[
                        Text(
                          message,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 24.rh(context)),
                      ],
                      CustomButton(
                        onPressed:
                            onPressed ??
                            () {
                              Navigator.of(context).pop();
                            },
                        buttonColor: CustomColors.white,
                        textColor: CustomColors.primary,
                        buttonTitle: buttonMessage ?? 'Back to Home',
                      ),
                      if (showCancelButton == true) ...[
                        Column(
                          children: [
                            SizedBox(height: 12.rh(context)),
                            CustomButton(
                              showElevation: false,
                              onPressed:
                                  onCancelPressed ??
                                  () {
                                    Navigator.of(context).pop();
                                  },
                              buttonColor: Colors.transparent,
                              border: BorderSide(color: CustomColors.white),
                              textColor: CustomColors.white,
                              buttonTitle: cancelMessage ?? 'Back to Home',
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
