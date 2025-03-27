import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:chledge/models/log_entry.dart';
import 'package:chledge/models/station.dart';

final Station station1 =
    Station(name: "Station A", description: "Main Station");
final Station station2 =
    Station(name: "Station B", description: "Branch Office");

String getCurrentDayMonthYear() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('dd MMM yyyy').format(now);
  return formattedDate;
}

final List<LogEntry> logEntries = [
  LogEntry(
    title: "Orientation",
    notes: "I was dying",
    dateTimeIn: DateTime(2025, 3, 21, 8, 0), // 2024-01-15 08:00
    dateTimeOut: DateTime(2025, 3, 21, 12, 0), // 2024-01-15 12:00
    holidayPercentage: 0,
    stationAssigned: station1,
    hourlyRate: 80.63,
  ),
  LogEntry(
    title: "Lunch Break",
    notes: "Someone was toxic",
    dateTimeIn: DateTime(2025, 3, 20, 12, 0),
    dateTimeOut: DateTime(2025, 3, 20, 13, 0),
    holidayPercentage: 0,
    stationAssigned: station1,
    hourlyRate: 80.63,
  ),
  LogEntry(
    title: "Afternoon Shift",
    notes: "Wanted to die",
    dateTimeIn: DateTime(2025, 3, 24, 13, 0),
    dateTimeOut: DateTime(2025, 3, 24, 17, 0),
    holidayPercentage: 0,
    stationAssigned: station1,
    hourlyRate: 80.63,
  ),
  LogEntry(
    title: "Holiday Shift",
    notes: "Killed my self",
    dateTimeIn: DateTime(2025, 3, 25, 9, 0),
    dateTimeOut: DateTime(2025, 3, 25, 17, 0),
    holidayPercentage: 100,
    stationAssigned: station2,
    hourlyRate: 80.63,
  ),
];

double totalHoursSum =
    logEntries.fold(0, (sum, entry) => sum + entry.totalHours);
double totalPaySum =
    logEntries.fold(0, (sum, entry) => sum + entry.totalIncome);

class Logs extends StatelessWidget {
  const Logs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          OverviewContainer(), // Extracted Overview Container
          Expanded(
            child: LogListView(), // Extracted Log ListView
          ),
        ],
      ),
    );
  }
}

class OverviewContainer extends StatelessWidget {
  const OverviewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24.0),
          bottomRight: Radius.circular(24.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context)
                .colorScheme
                .shadow
                .withAlpha((255 * 0.3).round()),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              getCurrentDayMonthYear(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OverviewItem(
                title: "Total Hours",
                value: totalHoursSum % 1 == 0
                    ? "${totalHoursSum.toInt()}hrs"
                    : "${totalHoursSum}hrs",
              ),
              OverviewItem(
                  title: "Total Shift", value: logEntries.length.toString()),
              OverviewItem(
                  title: "Total Income", value: totalPaySum.toStringAsFixed(2)),
            ],
          ),
        ],
      ),
    );
  }
}

class OverviewItem extends StatelessWidget {
  final String title;
  final String value;

  const OverviewItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        Text(value, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

class LogListView extends StatelessWidget {
  const LogListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: logEntries.length,
      itemBuilder: (context, index) {
        final logEntry = logEntries[index];
        // Use intl to format the date
        final dayOfWeek =
            DateFormat('E').format(logEntry.dateTimeIn); // 'E' for 3-letter day
        final dayOfMonth =
            DateFormat('d').format(logEntry.dateTimeIn); // 'd' for day of month
        // Combine title and description
        String fullTitle = logEntry.title;
        if (logEntry.notes.isNotEmpty) {
          fullTitle += ' | ${logEntry.notes}';
        }
        final String timeIn = DateFormat('HH:mm').format(logEntry.dateTimeIn);
        final String timeOut = DateFormat('HH:mm').format(logEntry.dateTimeOut);
        final String timeRange = '$timeIn - $timeOut';

        return ListTile(
          leading: SizedBox(
            width: 30,
            height: double.infinity, // Make it as tall as the ListTile
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center the content vertically
              children: [
                Text(
                  dayOfWeek.toUpperCase(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
                Text(dayOfMonth, style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
          title: Text(
            fullTitle,
            overflow: TextOverflow.ellipsis, // Handle overflow
            maxLines: 1,
          ),
          subtitle: Text(timeRange),
          trailing: SizedBox(
            width: 50,
            height: double.infinity, // Make it as tall as the ListTile
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center the content vertically
              children: [
                Text(
                  logEntry.totalHours % 1 == 0
                      ? "${logEntry.totalHours.toInt()}hrs"
                      : "${logEntry.totalHours}hrs",
                ),
                Text(
                  "₱${logEntry.totalIncome}",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
