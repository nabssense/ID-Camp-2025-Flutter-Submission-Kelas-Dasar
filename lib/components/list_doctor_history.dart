import 'package:flutter/material.dart';
import 'package:flutter_final_submission_dicoding/history_screen_detail.dart';
import 'package:flutter_final_submission_dicoding/models/patient_medical_history.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ListDoctorHistory extends StatelessWidget {
  const ListDoctorHistory({super.key, required this.items, this.scrollable = true});

  final List<MedicalSummary>? items;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 768) {
            return MobileScreen(items: items, scrollable: scrollable);
          } else {
            final int crossAxisCount = constraints.maxWidth >= 1280 ? 3 : 2;
            return DesktopScreen(
              crossAxisCount: crossAxisCount,
              items: items,
              scrollable: scrollable,
            );
          }
        },
      ),
    );
  }
}

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({
    super.key,
    required this.crossAxisCount,
    this.items,
    this.scrollable = true,
  });

  final int crossAxisCount;
  final List<MedicalSummary>? items;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    final dataMedical = items ?? medicalHistoryList;
    return MasonryGridView.count(
      shrinkWrap: true,
      itemCount: dataMedical.length,
      crossAxisCount: crossAxisCount,
      physics: scrollable ? null : const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      itemBuilder: (context, index) {
        final MedicalSummary medicalSummary = dataMedical[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HistoryScreenDetail(medical: medicalSummary);
                },
              ),
            );
          },
          borderRadius: BorderRadius.circular(16),
          child: Ink(
            width: double.infinity,
            padding: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              gradient: const RadialGradient(
                colors: [Color(0xffC9FFED), Color(0xFFC5E5FF)],
                stops: [0.50, 1.0],
                center: Alignment(-1.0, -2),
                radius: 2.0,
              ),
              borderRadius: BorderRadius.circular(16),
              border: BoxBorder.all(color: Colors.white, width: 2),
            ),

            child: Row(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  medicalSummary.doctor.photoAsset,
                  width: 116,
                  height: 116,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        medicalSummary.doctor.name,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        medicalSummary.doctor.specialty,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        '${medicalSummary.doctor.durationLabel} • ${medicalSummary.diagnosisTitle}',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(color: Colors.black),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
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
  const MobileScreen({super.key, this.items, this.scrollable = true});

  final List<MedicalSummary>? items;
  final bool scrollable;


  @override
  Widget build(BuildContext context) {
    final dataMedical = items ?? medicalHistoryList;

    return ListView.separated(
      shrinkWrap: true,
      itemCount: dataMedical.length,
      physics: scrollable ? null : const NeverScrollableScrollPhysics(),
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final MedicalSummary medicalSummary = dataMedical[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HistoryScreenDetail(medical: medicalSummary);
                },
              ),
            );
          },

          borderRadius: BorderRadius.circular(16),
          child: Ink(
            width: double.infinity,
            padding: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              gradient: const RadialGradient(
                colors: [Color(0xffC9FFED), Color(0xFFC5E5FF)],
                stops: [0.50, 1.0],
                center: Alignment(-1.0, -2),
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
                Image.asset(
                  medicalSummary.doctor.photoAsset,
                  width: 116,
                  height: 116,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        medicalSummary.doctor.name,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        medicalSummary.doctor.specialty,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        '${medicalSummary.doctor.durationLabel} • ${medicalSummary.diagnosisTitle}',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(color: Colors.black),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
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
