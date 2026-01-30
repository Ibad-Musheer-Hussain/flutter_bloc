import 'package:bloc_practice/utils/responsiveSize.dart';
import 'package:flutter/material.dart';

class ErrorStateWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;
  final IconData? icon;
  final Color? iconColor;
  final String? retryButtonText;

  const ErrorStateWidget({
    super.key,
    required this.errorMessage,
    required this.onRetry,
    this.icon,
    this.iconColor,
    this.retryButtonText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon ?? Icons.error_outline,
            size: 64.rf(context),
            color: iconColor ?? Colors.red,
          ),
          SizedBox(height: 16.rh(context)),
          Text(
            errorMessage,
            style: TextStyle(
              fontSize: 16.rf(context),
              color: Colors.red,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.rh(context)),
          ElevatedButton(
            onPressed: onRetry,
            child: Text(retryButtonText ?? 'Retry'),
          ),
        ],
      ),
    );
  }
}

