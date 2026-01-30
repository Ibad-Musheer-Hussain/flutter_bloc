import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  iconTheme: const IconThemeData(color: CustomColors.primary),
  fontFamily: 'Urbanist',
  snackBarTheme: const SnackBarThemeData(
      backgroundColor: CustomColors.primary,
      behavior: SnackBarBehavior.floating),
  dialogTheme: DialogThemeData(
    backgroundColor: CustomColors.white,
  ),
  bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)))),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: CustomColors.white,
      unselectedItemColor: CustomColors.grey,
      selectedItemColor: CustomColors.white),
  splashColor: CustomColors.white.withValues(alpha: .5),
  highlightColor: CustomColors.white.withValues(alpha: .5),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: CustomColors.primary,
    selectionColor: CustomColors.primary,
    selectionHandleColor: CustomColors.white,
  ),
  colorScheme: ColorScheme.fromSwatch(
    accentColor: CustomColors.primary,
  ),
  checkboxTheme: CheckboxThemeData(side: BorderSide(color: CustomColors.white)),
  listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: CustomColors.grey),
          borderRadius: BorderRadius.circular(5))),
  textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(CustomColors.primary))),
  dividerColor: CustomColors.grey,
  appBarTheme: AppBarTheme(
      color: CustomColors.black,
      elevation: 0,
      foregroundColor: CustomColors.white),
  scaffoldBackgroundColor: CustomColors.black,
  primaryColor: CustomColors.primary,
  primaryColorLight: CustomColors.primary.withValues(alpha: .5),
  brightness: Brightness.light,
  hintColor: CustomColors.grey,
  switchTheme: SwitchThemeData(
      thumbColor:
          WidgetStateProperty.all(CustomColors.primary.withValues(alpha: .8)),
      trackColor:
          WidgetStateProperty.all(CustomColors.primary.withValues(alpha: .1))),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          fixedSize: const WidgetStatePropertyAll<Size>(Size(999, 50)),
          backgroundColor: const WidgetStatePropertyAll(CustomColors.primary),
          padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(horizontal: 10, vertical: 10)))),
  textTheme: TextTheme(
// Main Heading
    displayLarge: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: CustomColors.headingColor,
      fontFamily: 'Urbanist',
    ),
// Sub Heading
    displayMedium: const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      color: CustomColors.primaryTextColor,
      fontFamily: 'Poppins',
    ),
// Section Heading
    displaySmall: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: CustomColors.primaryTextColor,
      fontFamily: 'Poppins',
    ),
// Card Titles
    headlineLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: CustomColors.white,
      fontFamily: 'Urbanist',
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: CustomColors.white,
      fontFamily: 'Urbanist',
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: CustomColors.white,
      fontFamily: 'Montserrat',
    ),
// Bold Titles
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: CustomColors.white,
      fontFamily: 'Urbanist',
    ),
    titleMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: CustomColors.white,
      fontFamily: 'Poppins',
    ),
    titleSmall: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: CustomColors.primaryTextColor,
      fontFamily: 'Mustica Pro',
    ),
// Main body text
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: CustomColors.white,
      fontFamily: 'Urbanist',
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: CustomColors.white,
      fontFamily: 'Urbanist',
    ),
    bodySmall: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w600,
      color: CustomColors.white,
      fontFamily: 'Urbanist',
    ),
// Buttons
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: CustomColors.white,
      fontFamily: 'Urbanist',
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: CustomColors.white,
      fontFamily: 'Urbanist',
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: CustomColors.white,
      fontFamily: 'Poppins',
    ),
  ),
);
ThemeData lightTheme = ThemeData(
  primaryColor: CustomColors.primary,
  scaffoldBackgroundColor: CustomColors.primaryScreenColor,
// scaffoldBackgroundColor: CustomColors.white,
  fontFamily: 'Urbanist',
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: CustomColors.primary,
    behavior: SnackBarBehavior.fixed,
  ),
  dialogTheme: DialogThemeData(
    backgroundColor: CustomColors.white,
  ),
  bottomSheetTheme: const BottomSheetThemeData(
      dragHandleColor: Colors.grey,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)))),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: CustomColors.white,
      unselectedItemColor: CustomColors.grey,
      selectedItemColor: CustomColors.white),
  splashColor: CustomColors.white.withValues(alpha: .5),
  highlightColor: CustomColors.white.withValues(alpha: .5),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: CustomColors.primary,
    selectionColor: CustomColors.primary,
    selectionHandleColor: CustomColors.white,
  ),
  colorScheme: ColorScheme.fromSwatch(
    accentColor: CustomColors.primary,
// primarySwatch: CustomColors.primary
  ),
  listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: CustomColors.grey),
          borderRadius: BorderRadius.circular(5))),
  dividerColor: CustomColors.grey,
  textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(CustomColors.primary))),
  appBarTheme: AppBarTheme(
      color: CustomColors.white,
      elevation: 0,
      foregroundColor: CustomColors.black),
  primaryColorLight: CustomColors.primary.withValues(alpha: .5),
  brightness: Brightness.light,
  hintColor: CustomColors.grey,
// switchTheme: SwitchThemeData(
// thumbColor: WidgetStateProperty.all(CustomColors.primary.withValues(.5)),
// trackColor: WidgetStateProperty.all(CustomColors.bg)),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          fixedSize: const WidgetStatePropertyAll<Size>(Size(999, 40)),
          backgroundColor: const WidgetStatePropertyAll(CustomColors.primary),
          padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(horizontal: 10, vertical: 10)))),
  textTheme: TextTheme(
// Main Heading
    displayLarge: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: CustomColors.headingColor,
      fontFamily: 'Urbanist',
    ),
// Sub Heading
    displayMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: CustomColors.appbarTextColor.withValues(alpha: 0.6),
      fontFamily: 'Poppins',
    ),
// Section Heading
    displaySmall: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: CustomColors.primaryTextColor,
      fontFamily: 'Poppins',
    ),
// Card Titles
    headlineLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: CustomColors.appbarTextColor,
      fontFamily: 'Montserrat',
    ),
    headlineMedium: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: CustomColors.secondaryTextColor,
      fontFamily: 'Poppins',
    ),
    headlineSmall: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: CustomColors.appbarTextColor,
      fontFamily: 'Montserrat',
    ),
// Bold Titles
    titleLarge: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: CustomColors.primaryTextColor,
      fontFamily: 'Urbanist',
    ),
    titleMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: CustomColors.white,
      fontFamily: 'Poppins',
    ),
    titleSmall: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: CustomColors.appbarTextColor,
      fontFamily: 'Poppins',
    ),
// Main body text
    bodyLarge: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: CustomColors.primaryTextColor,
      fontFamily: 'Urbanist',
    ),
    bodyMedium: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: CustomColors.primaryTextColor,
      fontFamily: 'Poppins',
    ),
    bodySmall: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: CustomColors.textFieldHintColor,
      fontFamily: 'Poppins',
    ),
// Buttons
    labelLarge: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: CustomColors.btnTextColor,
      fontFamily: 'Mustica Pro',
    ),
    labelMedium: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: CustomColors.primaryTextColor,
      fontFamily: 'Urbanist',
    ),
    labelSmall: const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: CustomColors.primaryTextColor,
      fontFamily: 'Poppins',
    ),
  ),
);

class CustomColors {
  static const Color transparent = Colors.transparent;
  static const Color milk1 = Color(0xFFEFEFEF);
  static const Color milk2 = Color(0xFFD4E4FB); //Color(0xFFF4F4F4); //;
  static const Color milk3 =
      Color.fromARGB(255, 37, 101, 197); //Color.fromARGB(255, 86, 148, 235);
  static const Color primary = Color.fromARGB(255, 37, 101, 197);
  // Color.fromARGB(255, 86, 148, 235); //Color(0xFFFD548F);
  static const Color pink = Color(0xFFFD548F);
  static Color bottomNavBarColor = milk2.withOpacity(0.5); //Color(0xFFF1E5EB);
  static const Color detailRowColor = Color.fromARGB(255, 235, 219, 227);
  static const Color headingColor = Color(0xFFEF5A79);
  static const Color appbarTextColor = Color(0xFF252223);
  static const Color primaryTextColor = Color(0xFF3F3F3F);
  static const Color snackbarColor = Color(0xFFFFFF99);
  static const Color secondaryTextColor = Color(0xFF828282);
  static const Color mediaContainerColor = Color(0xFFDADADA);
  static const Color productCardTextColor = Color(0xFF252223);
  static const Color productCardPriceColor = Color(0xFF242424);
  static const Color tileBorderColor = Color(0xFFEEEEEE);
  static const Color tileSelectedColor = Color(0xFFFFF6EF);
  static const Color bodyTextColor = Color(0xFFE4E6E8);
  static const Color btnTextColor = Color(0xFF545052);
  static const Color bodyGrey = Color(0xFFF6F6F6);
  static const Color textFieldHintColor = Color(0xFF6A6A6A);
  static const Color textFieldBorderColor = Color(0xFFC3C3C3);
  static const Color containerBorderColor = Color(0xFFD9D9D9);
  static const Color deliveredContainerColor = Color(0xFFFFF2E3);
  static const Color loginGradient1 = Color(0xFFFBD8E0);
  static const Color loginGradient2 = Color(0xFFFAD3D2);
  static const Color loginGradient3 = Color(0xFFFCDBCD);
  static const Color loginGradient4 = Color(0xFFF7D2B5);
  static const Color homeGradient1 = Color(0xFFD4E4FB); //Color(0xFFF9D7F3);
  static const Color homeGradient2 = Color(0xFFEFEFEF); //Color(0xFFEFEFEF);
  static const Color myOrderGradient = Color(0xFFFFE0EE);
  static const Color textFieldFillColor = Color(0xFFF4F5F6);
  static const Color borderColor = Color(0xFFECECEC);
  static const Color navBarColor = Color(0xFFFFFFFF);
  static const Color primaryScreenColor = Color(0xFFEFF0F2);
  static const Color gradientTop = Color(0xFFFFDBCE);
  static const Color gradientMiddle = Color(0xFFFED5C2);
  static const Color gradientBottom = Color(0xFFFF79A0);
  static const Color red = Color(0xFFEA4335);
  static const Color green = Color(0xFF2CBD53);
  static const Color blue = Color(0xFF1A70AD);
  static const Color lightBlue = Color(0xFFE1EBFF);
  static const Color lightOrange = Color(0xFFFAB12F);
  static const Color lightGreen = Color(0xFF07A279);
  static const Color purple = Color(0xFF958CFE);
  static const Color lightPurple = Color(0xFFEEE1FF);
  static Color black = Colors.black;
  static Color white = Colors.white;
  static Color grey = Colors.grey;
  static const Color errorMessageColor = Color.fromARGB(255, 166, 4, 4);
  static const Color warningMessageColor = Color(0xFFC2AF6F);
  static Color success = const Color(0xFF5fa777);
  static Color greenColor = const Color(0xFFDBF7E6);
  static Color checkBoxGreen = const Color(0xff07a27a);
  static Color cardColor = const Color(0xffF7F8F9);
  static const Color gradientEnd = Color(0xFFFFB2CE);

  // Filter chip colors
  static const Color chipInactiveText =
      Color(0x80252223); // #252223 with 50% opacity
  static const Color appbarTextColor60 =
      Color(0x99252223); // #252223 with 60% opacity
  static const Color appbarTextColor80 =
      Color(0xCC252223); // #252223 with 80% opacity

  // Button background color with 25% opacity
  static const Color buttonBackgroundLight =
      Color(0x40FD548F); // #FD548F with 25% opacity
  static const Color primaryBorder30 =
      Color(0x4DFD548F); // #FD548F with 30% opacity

  // Status chip colors
  static const Color statusActiveColor =
      Color(0xFF51CC71); // Green for active status
  static const Color statusPausedColor =
      Color(0xFFCE9700); // Orange for paused status
  static const Color statusActiveBackground =
      Color(0x4051CC71); // #51CC71 with 25% opacity
  static const Color statusPausedBackground =
      Color(0x40CE9700); // #CE9700 with 25% opacity
}
