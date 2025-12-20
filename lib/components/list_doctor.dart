import 'package:flutter/material.dart';
import 'package:flutter_final_submission_dicoding/book_appointment_detail_screen.dart';
import 'package:flutter_final_submission_dicoding/models/doctor_list.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter_final_submission_dicoding/components/gradient_button.dart';

class ListDoctor extends StatelessWidget {
  const ListDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 768) {
            return MobileScreen();
          } else {
            final crossAxisCount = constraints.maxWidth >= 1280 ? 3 : 2;
            return DesktopScreen(crossAxisCount: crossAxisCount);
          }
        },
      ),
    );
  }
}

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({super.key, required this.crossAxisCount});

  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      itemCount: doctorList.length,
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      itemBuilder: (context, index) {
        final Doctor doctor = doctorList[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return BookAppointmentDetailScreen(doctor: doctor);
                },
              ),
            );
          },
          borderRadius: BorderRadius.circular(16),
          child: Ink(
            width: double.infinity,
            padding: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [Colors.teal[600]!, Colors.white],
                stops: [0.20, 1.0],
                center: Alignment(-1.2, -2.2),
                radius: 2.0,
              ),
              borderRadius: BorderRadius.circular(16),
              border: BoxBorder.all(color: Colors.white, width: 2),
            ),
            child: Row(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(doctor.imageAsset, width: 116, height: 116),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor.name,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        doctor.specialty,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        doctor.priceLabel,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                GradientButton(
                  onPressed: () {},
                  gradient: LinearGradient(
                    colors: [Color(0xff2DAAAB), Color(0xff1AAF7B)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  child: PhosphorIcon(
                    PhosphorIconsBold.calendarBlank,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: doctorList.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final Doctor doctor = doctorList[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return BookAppointmentDetailScreen(doctor: doctor);
                },
              ),
            );
          },
          borderRadius: BorderRadius.circular(16),
          child: Ink(
            width: double.infinity,
            padding: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [Colors.teal[600]!, Colors.white],
                stops: [0.20, 1.0],
                center: Alignment(-1.2, -2.2),
                radius: 2.0,
              ),
              borderRadius: BorderRadius.circular(16),
              border: BoxBorder.all(color: Colors.white, width: 2),
            ),
            child: Row(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(doctor.imageAsset, width: 116, height: 116),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor.name,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        doctor.specialty,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        doctor.priceLabel,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                GradientButton(
                  onPressed: () {},
                  gradient: LinearGradient(
                    colors: [Color(0xff2DAAAB), Color(0xff1AAF7B)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  child: PhosphorIcon(
                    PhosphorIconsBold.calendarBlank,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
