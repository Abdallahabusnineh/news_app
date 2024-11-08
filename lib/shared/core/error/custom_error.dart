import 'package:flutter/material.dart';
import 'package:news_app/shared/core/utils/app_router.dart';

class CustomErrorPage extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const CustomErrorPage({
    required Key key,
    required this.errorDetails,
  })  : assert(errorDetails != null),
        super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Oops! Something Went Wrong')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 80),
            const SizedBox(height: 16),
            const Text(
              'An error occurred',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
             RichText(
              text: const TextSpan(
                text: 'We’re sorry for the inconvenience. Please try again or contact support if the issue persists.',

              ),
              textAlign: TextAlign.center,

            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                appRouter.popForced();
              },
              child: const Text('Go Back'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {

                // Optionally add retry logic here
              },
              child: const Text('Retry'),
            ),
            // You can also show the error details in debug mode
            if (const bool.fromEnvironment('dart.vm.product') == false)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'Error: ${errorDetails.exception}',
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
