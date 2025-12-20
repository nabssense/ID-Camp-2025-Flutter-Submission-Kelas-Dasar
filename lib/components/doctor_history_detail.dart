import 'package:flutter/material.dart';
import 'package:flutter_final_submission_dicoding/models/patient_medical_history.dart';

class DoctorHistoryDetail extends StatelessWidget {
  const DoctorHistoryDetail({super.key, required this.medicalSummary});

  final MedicalSummary medicalSummary;
  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        gradient: const RadialGradient(
          colors: [Color(0xffC9FFED), Color(0xFFC5E5FF)],
          stops: [0.50, 1.0],
          center: Alignment(-1.1, -0.6),
          radius: 2.0,
        ),
        borderRadius: BorderRadius.circular(16),
        border: BoxBorder.all(color: Colors.white, width: 2),
      ),
      child: Row(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            medicalSummary.doctor.photoAsset,
            width: 116,
            height: 116,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16),
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
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
                  ),
                  Text(
                    '${medicalSummary.doctor.durationLabel} • ${medicalSummary.diagnosisTitle}',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
