import 'package:flutter/material.dart';
import 'package:flutter_final_submission_dicoding/components/doctor_history_detail.dart';
import 'package:flutter_final_submission_dicoding/models/patient_medical_history.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HistoryScreenDetail extends StatelessWidget {
  const HistoryScreenDetail({super.key, required this.medical});
  final MedicalSummary medical;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: PhosphorIcon(PhosphorIconsRegular.arrowLeft),
          ),
          title: Text(
            'Patient Medical Summary',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        bottomNavigationBar: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth >= 720) {
              return SizedBox.shrink();
            } else {
              return BottomAppBarMobile(medical: medical);
            }
          },
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth >= 720) {
              return DesktopScreen(medical: medical);
            } else {
              return MobileScreen(medical: medical);
            }
          },
        ),
      ),
    );
  }
}

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({super.key, required this.medical});

  final MedicalSummary medical;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 600),
              child: Column(
                spacing: 32,
                children: [
                  Stack(
                    children: [
                      Positioned(
                        child: Container(
                          width: double.infinity,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Color(0xff9DBDD9),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      Column(
                        spacing: 0,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 12,
                              right: 12,
                              top: 16,
                              bottom: 0,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Color(0xffC5E5FF), Colors.white],
                                  stops: [0, 0.08],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4),
                                ),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 48,
                                    left: 16,
                                    right: 16,
                                    bottom: 16,
                                  ),
                                  child: Column(
                                    spacing: 16,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DoctorHistoryDetail(
                                        medicalSummary: medical,
                                      ),
                                      Column(
                                        spacing: 16,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            spacing: 12,
                                            children: [
                                              Container(
                                                width: 12,
                                                height: 12,
                                                decoration: BoxDecoration(
                                                  color: Color(0xff15AD7A),
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                              ),
                                              Text(
                                                'Diagnosis',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            medical.diagnosisDetail,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ],
                                      ),
                                      DashedDivider(
                                        color: Colors.grey[300]!,
                                        dashWidth: 8,
                                      ),
                                      Column(
                                        spacing: 16,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            spacing: 12,
                                            children: [
                                              Container(
                                                width: 12,
                                                height: 12,
                                                decoration: BoxDecoration(
                                                  color: Color(0xff15AD7A),
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                              ),
                                              Text(
                                                'Prescriptions',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          medical.prescriptions.isEmpty
                                              ? Text(
                                                  'No prescriptions',
                                                  style: Theme.of(
                                                    context,
                                                  ).textTheme.bodySmall,
                                                )
                                              : MasonryGridView.count(
                                                  shrinkWrap: true,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  crossAxisCount: 2,
                                                  mainAxisSpacing: 12,
                                                  crossAxisSpacing: 12,
                                                  itemCount: medical
                                                      .prescriptions
                                                      .length,
                                                  itemBuilder: (context, i) {
                                                    final p = medical
                                                        .prescriptions[i];
                                                    return _PrescriptionCard(
                                                      p: p,
                                                    );
                                                  },
                                                ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: SvgPicture.asset(
                              'assets/images/Lekukan.svg',
                              width: double.infinity,
                              height: 48,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            RightAppBar(medical: medical),
          ],
        ),
      ),
    );
  }
}

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key, required this.medical});

  final MedicalSummary medical;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          spacing: 32,
          children: [
            Stack(
              children: [
                Positioned(
                  child: Container(
                    width: double.infinity,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Color(0xff9DBDD9),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                Column(
                  spacing: 0,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: 16,
                        bottom: 0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xffC5E5FF), Colors.white],
                            stops: [0, 0.08],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4),
                          ),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 48,
                              left: 16,
                              right: 16,
                              bottom: 16,
                            ),
                            child: Column(
                              spacing: 16,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DoctorHistoryDetail(medicalSummary: medical),
                                Column(
                                  spacing: 16,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      spacing: 12,
                                      children: [
                                        Container(
                                          width: 12,
                                          height: 12,
                                          decoration: BoxDecoration(
                                            color: Color(0xff15AD7A),
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Diagnosis',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge
                                              ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      medical.diagnosisDetail,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ],
                                ),
                                DashedDivider(
                                  color: Colors.grey[300]!,
                                  dashWidth: 8,
                                ),
                                Column(
                                  spacing: 16,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      spacing: 12,
                                      children: [
                                        Container(
                                          width: 12,
                                          height: 12,
                                          decoration: BoxDecoration(
                                            color: Color(0xff15AD7A),
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Prescriptions',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge
                                              ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                    medical.prescriptions.isEmpty
                                        ? Text(
                                            'No prescriptions',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodySmall,
                                          )
                                        : MasonryGridView.count(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 12,
                                            itemCount:
                                                medical.prescriptions.length,
                                            itemBuilder: (context, i) {
                                              final p =
                                                  medical.prescriptions[i];
                                              return _PrescriptionCard(p: p);
                                            },
                                          ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: SvgPicture.asset(
                        'assets/images/Lekukan.svg',
                        width: double.infinity,
                        height: 48,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RightAppBar extends StatelessWidget {
  const RightAppBar({super.key, required this.medical});

  final MedicalSummary medical;

  @override
  Widget build(BuildContext context) {
    return Column(
    
      spacing: 16,
      children: [
        _ActionButton(icon: PhosphorIconsBold.pill, label: 'Treatment'),
        _ActionButton(icon: PhosphorIconsBold.note, label: 'Notes'),
        _ActionButton(
          icon: PhosphorIconsBold.shareNetwork,
          label: 'Share',
          onTap: () => _shareMedicalSummary(medical),
        ),
      ],
    );
  }
}

class BottomAppBarMobile extends StatelessWidget {
  const BottomAppBarMobile({super.key, required this.medical});

  final MedicalSummary medical;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 116,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 48,
        children: [
          _ActionButton(icon: PhosphorIconsBold.pill, label: 'Treatment'),
          _ActionButton(icon: PhosphorIconsBold.note, label: 'Notes'),
          _ActionButton(
            icon: PhosphorIconsBold.shareNetwork,
            label: 'Share',
            onTap: () => _shareMedicalSummary(medical),
          ),
        ],
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

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        InkWell(
          onTap: () {
            if (onTap != null) {
              onTap!();
              return;
            }
          },
          borderRadius: BorderRadius.circular(999),
          child: Column(
            spacing: 8,
            children: [
              Ink(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [Colors.white10, Colors.white],
                    center: Alignment(-0.8, -1),
                    radius: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(width: 2, color: Colors.white),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [PhosphorIcon(icon)],
                ),
              ),
            ],
          ),
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class _PrescriptionCard extends StatelessWidget {
  final Prescription p;
  const _PrescriptionCard({required this.p});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            p.name,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '${p.dosage} • ${p.form}',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          if (p.frequency.isNotEmpty) ...[
            Text(
              p.frequency,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

String _formatDate(DateTime date) {
  final String month = date.month.toString().padLeft(2, '0');
  final String day = date.day.toString().padLeft(2, '0');
  final String hour = date.hour.toString().padLeft(2, '0');
  final String minute = date.minute.toString().padLeft(2, '0');
  return '${date.year}-$month-$day $hour:$minute';
}

void _shareMedicalSummary(MedicalSummary medical) {
  final StringBuffer buffer = StringBuffer()
    ..writeln('Patient Medical Summary')
    ..writeln('Patient: ${medical.patientName}')
    ..writeln('Doctor: ${medical.doctor.name} (${medical.doctor.specialty})')
    ..writeln('Date: ${_formatDate(medical.date)}')
    ..writeln('Diagnosis: ${medical.diagnosisTitle}')
    ..writeln('Details: ${medical.diagnosisDetail}');

  if (medical.prescriptions.isNotEmpty) {
    buffer.writeln('Prescriptions:');
    for (final Prescription p in medical.prescriptions) {
      final String frequency =
          p.frequency.isNotEmpty ? ' • ${p.frequency}' : '';
      buffer.writeln('- ${p.name} ${p.dosage} (${p.form})$frequency');
    }
  }

  Share.share(
    buffer.toString(),
    subject: 'Patient Medical Summary',
  );
}
