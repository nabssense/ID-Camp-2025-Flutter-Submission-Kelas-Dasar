class Prescription {
  final String name;
  final String dosage;
  final String form;
  final String frequency;
  final String note;

  Prescription({
    required this.name,
    required this.dosage,
    required this.form,
    required this.frequency,
    this.note = '',
  });
}

class DoctorInfo {
  final String name;
  final String specialty;
  final String photoAsset;
  final String durationLabel;
  final String checkType;

  DoctorInfo({
    required this.name,
    required this.specialty,
    required this.photoAsset,
    required this.durationLabel,
    required this.checkType,
  });
}

class MedicalSummary {
  final String id;
  final String patientName;
  final DateTime date;
  final DoctorInfo doctor;
  final String chiefComplaint;
  final String diagnosisTitle;
  final String diagnosisDetail;
  final List<Prescription> prescriptions;
  final List<String> treatmentSteps;
  final String notes;
  final DateTime? followUpDate;
  final List<String> attachments;
  final List<String> tags;

  MedicalSummary({
    required this.id,
    required this.patientName,
    required this.date,
    required this.doctor,
    required this.chiefComplaint,
    required this.diagnosisTitle,
    required this.diagnosisDetail,
    required this.prescriptions,
    required this.treatmentSteps,
    required this.notes,
    this.followUpDate,
    this.attachments = const [],
    this.tags = const [],
  });
}

final List<MedicalSummary> medicalHistoryList = [
  MedicalSummary(
    id: 'ms-20251006-001',
    patientName: 'Muhammad Nabil',
    date: DateTime(2025, 10, 6, 7, 45),
    doctor: DoctorInfo(
      name: 'Dr. Elara Vance',
      specialty: 'Internal Medicine',
      photoAsset: 'assets/images/Dokter1.webp',
      durationLabel: '15 min',
      checkType: 'Standard Check',
    ),
    chiefComplaint: 'High fever (up to 38.7°C), mild cough',
    diagnosisTitle: 'Suspected Viral AURI (Acute Upper Respiratory Infection)',
    diagnosisDetail:
        'The patient has an acute fever (up to 38.7°C). Suspected viral AURI, treated symptomatically. Continue close monitoring for complications and advise hydration and rest.',
    prescriptions: [
      Prescription(
        name: 'Paracetamol',
        dosage: '500 mg',
        form: 'Tablet',
        frequency: 'Twice daily (during fever)',
        note: 'Max 3 times in 24 hours if needed',
      ),
      Prescription(
        name: 'CTM',
        dosage: '4 mg',
        form: 'Tablet',
        frequency: 'Once nightly',
        note: 'To reduce allergy symptoms / help sleep rhythm',
      ),
      Prescription(
        name: 'Vitamin C & Zinc',
        dosage: '1000 mg',
        form: 'Tablet Effervescent',
        frequency: '1x sehari',
        note: '',
      ),
    ],
    treatmentSteps: [
      'Symptomatic treatment: antipyretic (paracetamol) if fever ≥38°C',
      'Rehydration and rest',
      'Monitor for breathing difficulty or persistent high fever >48 hours',
    ],
    notes:
        'Observe improvement within 48 hours. If the fever does not subside or severe respiratory symptoms appear, return to a healthcare facility.',
    followUpDate: DateTime(2025, 10, 8),
    attachments: ['assets/images/Dokter1.jpg'],
    tags: ['AURI', 'Fever'],
  ),

  MedicalSummary(
    id: 'ms-20250920-001',
    patientName: 'Muhammad Nabil',
    date: DateTime(2025, 9, 20, 14, 0),
    doctor: DoctorInfo(
      name: 'Dr. Marcus Klein',
      specialty: 'Infectious Disease',
      photoAsset: 'assets/images/Dokter2.webp',
      durationLabel: '20 min',
      checkType: 'Consultation',
    ),
    chiefComplaint: 'Sore throat, runny nose',
    diagnosisTitle: 'Pharyngitis (probable viral)',
    diagnosisDetail:
        'Probable viral pharyngitis based on exam. No signs of bacterial infection (no exudate, no high fever >39°C). Symptomatic care recommended.',
    prescriptions: [
      Prescription(
        name: 'Ibuprofen',
        dosage: '200 mg',
        form: 'Tablet',
        frequency: 'Three times daily after meals',
        note: '',
      ),
    ],
    treatmentSteps: [
      'Salt water gargle',
      'Analgesic/anti-inflammatory as needed',
    ],
    notes: 'No indication for antibiotics at this time.',
    followUpDate: null,
    attachments: [],
    tags: ['Pharyngitis'],
  ),

  MedicalSummary(
    id: 'ms-20250701-001',
    patientName: 'Muhammad Nabil',
    date: DateTime(2025, 7, 1, 10, 30),
    doctor: DoctorInfo(
      name: 'Dr. Chloe Bennet',
      specialty: 'General Pediatrics',
      photoAsset: 'assets/images/Dokter3.webp',
      durationLabel: '15 min',
      checkType: 'Child Check',
    ),
    chiefComplaint: 'Routine check (immunization review)',
    diagnosisTitle: 'Routine Check - Healthy',
    diagnosisDetail:
        'Routine pediatric check. Growth and development within normal range. Immunizations up to date.',
    prescriptions: [],
    treatmentSteps: ['Continue balanced diet', 'Vaccination up to schedule'],
    notes: 'Next routine visit: 6 months.',
    followUpDate: DateTime(2026, 1, 1),
    attachments: [],
    tags: ['Routine'],
  ),
  MedicalSummary(
    id: 'ms-20250612-001',
    patientName: 'Muhammad Nabil',
    date: DateTime(2025, 6, 12, 9, 15),
    doctor: DoctorInfo(
      name: 'Dr. Amara Syafira',
      specialty: 'Dermatology',
      photoAsset: 'assets/images/Dokter3.webp',
      durationLabel: '20 min',
      checkType: 'Skin Consult',
    ),
    chiefComplaint: 'Mild rash and itching on the arm',
    diagnosisTitle: 'Allergic Dermatitis (mild)',
    diagnosisDetail:
        'Mild skin irritation, likely an allergic reaction. Avoid triggers and use a gentle moisturizer.',
    prescriptions: [],
    treatmentSteps: [
      'Use fragrance-free moisturizer',
      'Avoid soaps with harsh detergents',
    ],
    notes: 'Follow up if not improved within 7 days.',
    followUpDate: DateTime(2025, 6, 19),
    attachments: [],
    tags: ['Dermatitis', 'Allergy'],
  ),
  MedicalSummary(
    id: 'ms-20250503-001',
    patientName: 'Muhammad Nabil',
    date: DateTime(2025, 5, 3, 11, 0),
    doctor: DoctorInfo(
      name: 'Dr. Laras Wulandari',
      specialty: 'Internal Medicine',
      photoAsset: 'assets/images/Dokter3.webp',
      durationLabel: '15 min',
      checkType: 'Consultation',
    ),
    chiefComplaint: 'Easily fatigued and mild dizziness',
    diagnosisTitle: 'Suspected Mild Anemia',
    diagnosisDetail:
        'Symptoms suggest mild anemia. A complete blood count is recommended.',
    prescriptions: [],
    treatmentSteps: [
      'Increase iron-rich foods',
      'Consider supplements after lab results',
    ],
    notes: 'Schedule lab check this week.',
    followUpDate: DateTime(2025, 5, 10),
    attachments: [],
    tags: ['Anemia', 'Checkup'],
  ),
  MedicalSummary(
    id: 'ms-20250418-001',
    patientName: 'Muhammad Nabil',
    date: DateTime(2025, 4, 18, 9, 0),
    doctor: DoctorInfo(
      name: 'Dr. Rania Prasetyo',
      specialty: 'General Pediatrics',
      photoAsset: 'assets/images/Dokter3.webp',
      durationLabel: '15 min',
      checkType: 'Growth Check',
    ),
    chiefComplaint: 'Monthly growth check and appetite review',
    diagnosisTitle: 'Growth Monitoring - Normal',
    diagnosisDetail:
        'Weight and height are tracking within expected percentiles. Appetite is good.',
    prescriptions: [],
    treatmentSteps: [
      'Maintain balanced meals and hydration',
      'Encourage regular physical activity',
    ],
    notes: 'Return in 3 months for routine monitoring.',
    followUpDate: DateTime(2025, 7, 18),
    attachments: [],
    tags: ['Growth', 'Pediatrics'],
  ),
  MedicalSummary(
    id: 'ms-20250302-001',
    patientName: 'Muhammad Nabil',
    date: DateTime(2025, 3, 2, 13, 20),
    doctor: DoctorInfo(
      name: 'Dr. Sari Mahendra',
      specialty: 'Family Medicine',
      photoAsset: 'assets/images/Dokter3.webp',
      durationLabel: '20 min',
      checkType: 'Consultation',
    ),
    chiefComplaint: 'Occasional stomach discomfort after meals',
    diagnosisTitle: 'Suspected Mild Dyspepsia',
    diagnosisDetail:
        'Symptoms consistent with mild dyspepsia. No red flags noted on exam.',
    prescriptions: [],
    treatmentSteps: [
      'Eat smaller, more frequent meals',
      'Limit spicy and oily foods',
    ],
    notes: 'Return if symptoms persist beyond 2 weeks.',
    followUpDate: null,
    attachments: [],
    tags: ['Dyspepsia', 'Digestive'],
  ),
  MedicalSummary(
    id: 'ms-20250210-001',
    patientName: 'Muhammad Nabil',
    date: DateTime(2025, 2, 10, 16, 5),
    doctor: DoctorInfo(
      name: 'Dr. Nadia Hartini',
      specialty: 'ENT',
      photoAsset: 'assets/images/Dokter3.webp',
      durationLabel: '15 min',
      checkType: 'ENT Check',
    ),
    chiefComplaint: 'Nasal congestion and intermittent sneezing',
    diagnosisTitle: 'Allergic Rhinitis (suspected)',
    diagnosisDetail:
        'Symptoms suggest allergic rhinitis. Recommended environmental control and observation.',
    prescriptions: [],
    treatmentSteps: [
      'Avoid dust and known allergens',
      'Use saline nasal rinse as needed',
    ],
    notes: 'Follow up if symptoms worsen.',
    followUpDate: null,
    attachments: [],
    tags: ['Rhinitis', 'Allergy'],
  ),
];
