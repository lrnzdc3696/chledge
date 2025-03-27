import 'package:chledge/models/station.dart';

class LogEntry {
  String title;
  String notes;
  DateTime dateTimeIn;
  DateTime dateTimeOut;
  int holidayPercentage;
  Station stationAssigned;
  double hourlyRate; // Added hourly rate

  LogEntry({
    required this.title,
    required this.notes,
    required this.dateTimeIn,
    required this.dateTimeOut,
    required this.holidayPercentage,
    required this.stationAssigned,
    required this.hourlyRate, // Added hourly rate parameter
  });

  // Getters

  double get totalHours {
    return dateTimeOut.difference(dateTimeIn).inMinutes / 60.0;
  }

  double get totalIncome {
    double baseRate = hourlyRate;
    if (isHoliday) {
      baseRate *= (1 + holidayPercentage / 100.0);
    }
    return totalHours * baseRate;
  }

  bool get isHoliday => holidayPercentage > 0;

  double get regularHours {
    if (totalHours <= 8) {
      return totalHours;
    } else {
      return 8;
    }
  }

  double get otHours {
    if (totalHours > 8) {
      return totalHours - 8;
    } else {
      return 0;
    }
  }

  double get nightHours {
    // Example: Night hours are between 10 PM and 6 AM
    int inHour = dateTimeIn.hour;
    int outHour = dateTimeOut.hour;
    int inMinute = dateTimeIn.minute;
    int outMinute = dateTimeOut.minute;

    if (inHour > outHour) {
      outHour = outHour + 24;
    }

    double nightHours = 0;
    for (int hour = inHour; hour < outHour; hour++) {
      int actualHour = hour % 24;

      if (actualHour >= 22 || actualHour < 6) {
        if (hour == inHour && inMinute > 0) {
          nightHours = nightHours + (60 - inMinute) / 60;
        } else if (hour == outHour - 1 && outMinute > 0) {
          nightHours = nightHours + outMinute / 60;
        } else {
          nightHours = nightHours + 1.0;
        }
      }
    }
    return nightHours;
  }

  double get holidayHours {
    if (isHoliday) {
      return totalHours;
    } else {
      return 0;
    }
  }

  double get rate => hourlyRate; // Added getter for rate

  @override
  String toString() {
    return 'LogEntry{title: $title, notes: $notes, dateTimeIn: $dateTimeIn, dateTimeOut: $dateTimeOut, holidayPercentage: $holidayPercentage, stationAssigned: $stationAssigned, hourlyRate:$hourlyRate}';
  }
}
