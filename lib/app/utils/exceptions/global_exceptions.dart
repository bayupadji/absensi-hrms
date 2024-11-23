import 'dart:async';
import 'dart:io';
import 'package:absensi/app/utils/widgets/modals/error_modal.dart';

class GlobalExceptionHandler {
  static void handleError(Object error) {
    String message;

    if (error is SocketException) {
      message = 'Ups! Sepertinya Anda tidak tersambung ke internet. Periksa pengaturan jaringan Anda dan coba lagi.';
    } else if (error is TimeoutException) {
      message = 'Permintaan membutuhkan waktu lebih lama dari yang diharapkan. Periksa koneksi Anda dan coba lagi.';
    } else if (error is HttpException) {
      message = 'Kami mengalami masalah saat mencoba menjangkau server. Silakan coba lagi nanti.';
    } else if (error is FormatException) {
      message = 'Ada masalah dengan data yang kami terima. Silakan coba lagi.';
    } else {
      message = 'Ada yang tidak beres. Silakan coba lagi atau hubungi dukungan jika masalah terus berlanjut.';
    }

    // Menampilkan Bottom Sheet dengan pesan kesalahan
    ErrorBottomSheet.show(message);
  }
}
