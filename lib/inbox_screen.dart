import 'package:flutter/material.dart';
import 'package:flutter_final_submission_dicoding/components/snackbar_custom.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 768) {
            return MobileScreen();
          } else {
            return DesktopScreen();
          }
        },
      ),
    );
  }
}

class _InboxItem {
  const _InboxItem({
    required this.icon,
    required this.message,
    required this.dateTime,
  });

  final IconData icon;
  final String message;
  final DateTime dateTime;
}

String _formatDayDate(DateTime date) {
  const List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  const List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  final String dayName = days[date.weekday - 1];
  final String monthName = months[date.month - 1];
  return '$dayName, ${date.day} $monthName ${date.year}';
}

String _formatTime(DateTime date) {
  final String hour = date.hour.toString().padLeft(2, '0');
  final String minute = date.minute.toString().padLeft(2, '0');
  return '$hour:$minute';
}

final List<_InboxItem> _inboxItems = [
  _InboxItem(
    icon: PhosphorIconsFill.mailbox,
    message: 'New policy update',
    dateTime: DateTime(2025, 10, 6, 9, 30),
  ),
  _InboxItem(
    icon: PhosphorIconsFill.stethoscope,
    message: 'Appointment confirmed',
    dateTime: DateTime(2025, 10, 8, 14, 10),
  ),
  _InboxItem(
    icon: PhosphorIconsFill.prescription,
    message: 'Prescription ready',
    dateTime: DateTime(2025, 10, 10, 18, 45),
  ),
];

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 32,
            children: [
              Text(
                'Inbox',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Expanded(
                    child: Column(
                      spacing: 16,
                      children: [
                        for (final _InboxItem item in _inboxItems)
                          ButtonInbox(
                            onTap: () {
                              showSnackBarCustom(
                                context,
                                title: 'Maaf, fitur belum tersedia 🙏🏻☺️',
                              );
                            },
                            iconLeft: item.icon,
                            message: item.message,
                            day: _formatDayDate(item.dateTime),
                            time: _formatTime(item.dateTime),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Text(
                'Inbox',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Column(
                spacing: 16,
                children: [
                  for (final _InboxItem item in _inboxItems)
                    ButtonInbox(
                      onTap: () {
                        showSnackBarCustom(
                          context,
                          title: 'Maaf, fitur belum tersedia 🙏🏻☺️',
                        );
                      },
                      iconLeft: item.icon,
                      message: item.message,
                      day: _formatDayDate(item.dateTime),
                      time: _formatTime(item.dateTime),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonInbox extends StatelessWidget {
  const ButtonInbox({
    super.key,
    required this.iconLeft,
    required this.message,
    required this.day,
    required this.time,
    this.onTap,
  });

  final dynamic iconLeft;
  final String message;
  final String day;
  final String time;
  final dynamic onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          spacing: 16,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(999),
              ),
              child: PhosphorIcon(
                iconLeft,
                size: 32,
                color: Colors.blue.shade700,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        Text(
                          day,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          time,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
