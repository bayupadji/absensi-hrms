import 'dart:async';
import 'dart:io';
import 'package:absensi/app/utils/widgets/modals/error_modal.dart'; // Import file Bottom Sheet

class GlobalExceptionHandler {
  static void handleError(Object error) {
    String message;

    if (error is SocketException) {
      message =
          'Oops! It seems you are not connected to the internet. Please check your network settings and try again.';
    } else if (error is TimeoutException) {
      message =
          'The request is taking longer than expected. Please check your connection and try again.';
    } else if (error is HttpException) {
      message =
          'We encountered an issue while trying to reach the server. Please try again later.';
    } else if (error is FormatException) {
      message =
          'There was a problem with the data we received. Please try again.';
    } else {
      message =
          'Something went wrong. Please try again or contact support if the issue persists.';
    }

    // Menampilkan Bottom Sheet dengan pesan kesalahan
    ErrorBottomSheet.show(message);
  }
}
