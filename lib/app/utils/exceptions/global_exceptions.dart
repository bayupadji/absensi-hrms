import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class GlobalExceptionHandler {
  static Future<void> handleError(Object error, StackTrace stackTrace) async {
    String message;

    try {
      if (error is SocketException) {
        message = 'Ups! Sepertinya Anda tidak tersambung ke internet. Periksa pengaturan jaringan Anda dan coba lagi.';
      } else if (error is TimeoutException) {
        message = 'Permintaan membutuhkan waktu lebih lama dari yang diharapkan. Periksa koneksi Anda dan coba lagi.';
      } else if (error is HttpException) {
        message = 'Kami mengalami masalah saat mencoba menjangkau server. Silakan coba lagi nanti.';
      } else if (error is FormatException) {
        message = 'Ada masalah dengan data yang kami terima. Silakan coba lagi.';
      } else if (error is IOException) {
        message = 'Terjadi kesalahan input/output. Silakan coba lagi.';
      } else if (error is AssertionError) {
        message = 'Terjadi kesalahan dalam logika aplikasi. Silakan coba lagi.';
      } else if (error is Exception) {
        message = 'Terjadi kesalahan yang tidak terduga. Silakan coba lagi.';
      } else {
        message = 'Ada yang tidak beres. Silakan coba lagi atau hubungi dukungan jika masalah terus berlanjut.';
      }

      // Check if GPS is enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        message = 'GPS tidak aktif. Silakan aktifkan GPS untuk melanjutkan.';
      }

      // Menampilkan Bottom Sheet dengan pesan kesalahan
      // ErrorBottomSheet.show(message);

      // Menampilkan log pesan kesalahan
      if (kDebugMode) {
        print('Error: $message');
      }
    } catch (e) {
      // Logging error
      if (kDebugMode) {
        print('Error: $e');
        print('StackTrace: $stackTrace');
      }
      rethrow;
    }
  }
}
