import 'package:bloc_practice/ui/home/homescreen.dart';
import 'package:flutter/material.dart';

class RouteNames {
  static const String searchScreen = '/search';
  static const String splashScreen = 'splash_screen';
  static const String onboardingScreen = 'onboarding_screen';
  static const String loginScreen = 'login_screen';
  static const String homeScreen = '/home';
  static const String profileScreen = '/profile';
  // static const String refundScreen = '/refund_screen';
  static const String myOrdersScreen = '/my_orders_screen';
  static const String paymentScreen = '/payment_screen';
  static const String voucherScreen = '/voucher_screen';
  static const String addressScreen = '/address_screen';
  static const String bottomNavbarScreen = '/bottom_navbar_screen';
  static const String productDetailScreen = '/product_detail_screen';
  static const String testDbScreen = '/test-db-screen';
  static const String subscriptionManagementScreen =
      '/subscription-management-screen';
  static const String subscriptionDetailScreenTwo =
      '/subscription-detail-screen-two';
  static const String subscriptionInvoicesScreen =
      '/subscription-invoices-screen';
  static const String invoicesScreen = '/invoices-screen';
  static const String refundHistoryScreen = '/refund-history-screen';
  static const String subscriptionFrequencySelectionScreen =
      '/subscription-frequency-selection';
  static const String subscriptionDayDateSelectionScreen =
      '/subscription-day-date-selection';
  static const String checkoutSubscriptionScreen =
      '/checkout-subscription-screen';
  static const String cartScreen = '/cart';
  static const String deliveryAddressScreen = '/delivery-address';
  static const String orderCompleteScreen = '/order-complete';
  static const String editProfileScreen = '/edit-profile';
  static const String multiPageNavigationScreen = '/multi-page-navigation';
  static const String termsAndConditionsScreen = '/terms-and-conditions';
  static const String privacyPolicyScreen = '/privacy-policy';
  static const String helpCenterScreen = '/help-center';
  static const String categoriesBrowseScreen = '/categories-browse';
  static const String brandsBrowseScreen = '/brands-browse';
  static const String bestSellersScreen = '/best-sellers';
}

class Routes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments as Map<String, dynamic>?;
    switch (routeSettings.name) {
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const MyHomePage(),
        );

      // case RouteNames.refundScreen:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const RefundScreen());
      // case RouteNames.myOrdersScreen:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const MyOrdersScreen());

      default:
        return MaterialPageRoute(
          builder:
              (BuildContext context) =>
                  const Center(child: Text('No Route Defined')),
        );
    }
  }
}
