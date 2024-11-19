import 'dart:async';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DatetimeController extends GetxController {
  String _currentTime = '';
  String _currentDate = '';
  Timer? _timer;

  String get currentTime => _currentTime;
  String get currentDate => _currentDate;

  @override
  void onInit() {
    super.onInit();
    _updateTime();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _updateTime);
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void _updateTime() {
    _currentTime = DateFormat('HH:mm').format(DateTime.now());
    _currentDate = DateFormat('EEEE, d MMMM').format(DateTime.now());
    update();
  }
}
