import 'package:get/get.dart';

class DatePickerController extends GetxController {
  var selectedDate = DateTime.now().obs;
  DateTime? dateMin;
  DateTime? dateMax;
  DateTime? initialDate;

  void setDates(DateTime init, DateTime min, int maxYears) {
    initialDate = init;
    dateMin = min; // Set the minimum date
    dateMax = DateTime.now().add(Duration(days: maxYears * 365));
    selectedDate.value = initialDate ?? selectedDate.value;
  }

  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
  }

  void resetSelectedDate(){
    if (initialDate != null) {
      selectedDate.value = initialDate!;
    }
  }
}
