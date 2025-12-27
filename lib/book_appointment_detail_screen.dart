import 'package:flutter/material.dart';
import 'package:flutter_final_submission_dicoding/components/snackbar_custom.dart';
import 'package:flutter_final_submission_dicoding/models/doctor_list.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BookAppointmentDetailScreen extends StatelessWidget {
  const BookAppointmentDetailScreen({super.key, required this.doctor});
  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: PhosphorIcon(PhosphorIconsRegular.arrowLeft),
          ),
          title: Text(
            'Doctor',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        bottomNavigationBar: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth <= 720) {
              return BottomAppBarMobile(doctor: doctor);
            } else {
              return BottomAppBarMobile(doctor: doctor);
            }
          },
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth >= 720) {
              return DesktopScreen(doctor: doctor);
            } else {
              return MobileScreen(doctor: doctor);
            }
          },
        ),
      ),
    );
  }
}

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({super.key, required this.doctor});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    final List<DoctorAvailability> availability = doctor.availability;
    final DoctorAvailability? activeAvailability = availability.isNotEmpty
        ? availability.first
        : null;
    final List<String> timeSlots = activeAvailability?.times ?? const [];

    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Image.asset(doctor.imageAsset, width: 320, scale: 1),
              ),
              Expanded(
                child: Column(
                  spacing: 32,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        top: 16,
                        left: 16,
                        right: 16,
                        bottom: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        spacing: 16,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            spacing: 16,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    doctor.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    spacing: 12,
                                    children: [
                                      Text(
                                        doctor.specialty,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                      Text(
                                        doctor.tags.join(', '),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                doctor.priceLabel,
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                          DashedDivider(color: Colors.grey[300]!, dashWidth: 8),
                          Column(
                            spacing: 16,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                spacing: 12,
                                children: [
                                  PhosphorIcon(
                                    PhosphorIconsFill.star,
                                    size: 20,
                                    color: Colors.yellow.shade700,
                                  ),
                                  Text(
                                    doctor.rating.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: 16,
                        left: 16,
                        right: 16,
                        bottom: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        spacing: 16,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            spacing: 16,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 12,
                                children: [
                                  Text(
                                    'Day Availability',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      spacing: 16,
                                      children: availability
                                          .map(
                                            (item) => _ButtonDate(
                                              onTap: () {
                                                showSnackBarCustom(context, title: 'Maaf, fitur belum tersedia 🙏🏻☺️');
                                              },
                                              isActive: false,
                                              date: item.date,
                                              day: item.day.substring(0, 3),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          DashedDivider(color: Colors.grey[300]!, dashWidth: 8),
                          Column(
                            spacing: 16,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Time',
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 128,
                                child: MasonryGridView.count(
                                  itemCount: timeSlots.length,
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                  itemBuilder: (context, index) {
                                    return _ChipCustom(
                                      date: timeSlots[index],
                                      onTap: () {
                                        showSnackBarCustom(context, title: 'Maaf, fitur belum tersedia 🙏🏻☺️');
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
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
      ),
    );
  }
}

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key, required this.doctor});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    final List<DoctorAvailability> availability = doctor.availability;
    final DoctorAvailability? activeAvailability = availability.isNotEmpty
        ? availability.first
        : null;
    final List<String> timeSlots = activeAvailability?.times ?? const [];

    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(
              'assets/images/Dokter1.webp',
              width: double.infinity,
              scale: 1,
            ),
            Column(
              spacing: 32,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 16,
                    left: 16,
                    right: 16,
                    bottom: 16,
                  ),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    spacing: 16,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        spacing: 16,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doctor.name,
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                spacing: 12,
                                children: [
                                  Text(
                                    doctor.specialty,
                                    style: Theme.of(context).textTheme.bodyLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  Text(
                                    doctor.tags.join(', '),
                                    style: Theme.of(context).textTheme.bodyLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            doctor.priceLabel,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      DashedDivider(color: Colors.grey[300]!, dashWidth: 8),
                      Column(
                        spacing: 16,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            spacing: 12,
                            children: [
                              PhosphorIcon(
                                PhosphorIconsFill.star,
                                size: 20,
                                color: Colors.yellow.shade700,
                              ),
                              Text(
                                doctor.rating.toString(),
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                spacing: 32,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      top: 16,
                      left: 16,
                      right: 16,
                      bottom: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                    ),
                    child: Column(
                      spacing: 16,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          spacing: 16,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 12,
                              children: [
                                Text(
                                  'Day Availability',
                                  style: Theme.of(context).textTheme.titleLarge
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    spacing: 16,
                                    children: availability
                                        .map(
                                          (item) => _ButtonDate(
                                            onTap: () {
                                              showSnackBarCustom(context, title: 'Maaf, fitur belum tersedia 🙏🏻☺️');
                                            },
                                            isActive: false,
                                            date: item.date,
                                            day: item.day.substring(0, 3),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        DashedDivider(color: Colors.grey[300]!, dashWidth: 8),
                        Column(
                          spacing: 16,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Time',
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 128,
                              child: MasonryGridView.count(
                                itemCount: timeSlots.length,
                                crossAxisCount: 3,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                itemBuilder: (context, index) {
                                  return _ChipCustom(
                                    date: timeSlots[index],
                                    onTap: () {
                                      showSnackBarCustom(context, title: 'Maaf, fitur belum tersedia 🙏🏻☺️');
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
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

class _ChipCustom extends StatelessWidget {
  const _ChipCustom({required this.date, this.onTap});

  final String date;
  final dynamic onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(999),
        ),
        alignment: Alignment.center,
        child: Text(date),
      ),
    );
  }
}

class BottomAppBarMobile extends StatelessWidget {
  const BottomAppBarMobile({super.key, required this.doctor});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.grey.shade100,
      child: FilledButton(
        onPressed: () {
          showSnackBarCustom(context, title: 'Maaf, fitur belum tersedia 🙏🏻☺️');
        },
        child: Text(
          'Book Appointment',
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

class DashedDivider extends StatelessWidget {
  final double height;
  final double dashWidth;
  final double dashSpace;
  final Color color;
  final Axis direction;

  const DashedDivider({
    super.key,
    this.height = 1.0,
    this.dashWidth = 6.0,
    this.dashSpace = 4.0,
    this.color = Colors.grey,
    this.direction = Axis.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double totalLength = direction == Axis.horizontal
            ? constraints.constrainWidth()
            : constraints.constrainHeight();

        final int dashCount = (totalLength / (dashWidth + dashSpace)).floor();

        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: direction,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: direction == Axis.horizontal ? dashWidth : height,
              height: direction == Axis.vertical ? dashWidth : height,
              child: DecoratedBox(decoration: BoxDecoration(color: color)),
            );
          }),
        );
      },
    );
  }
}

class _ButtonDate extends StatelessWidget {
  const _ButtonDate({
    required this.date,
    required this.day,
    required this.isActive,
    this.onTap,
  });
  final int date;
  final String day;

  final bool isActive;
  final dynamic onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 72,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isActive
              ? Theme.of(context).colorScheme.primary
              : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: isActive ? 1 : 0,
            color: Colors.grey.shade500,
          ),
        ),
        child: Column(
          children: [
            Text(
              '$date',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: isActive ? Colors.white : Colors.black,
              ),
            ),
            Text(
              day,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: isActive ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
