
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
    chiefComplaint: 'Demam tinggi (hingga 38.7°C), batuk ringan',
    diagnosisTitle: 'Suspected Viral AURI (Acute Upper Respiratory Infection)',
    diagnosisDetail:
        'The patient has an acute fever (up to 38.7°C). Suspected viral AURI, treated symptomatically. Continue close monitoring for complications and advise hydration and rest.',
    prescriptions: [
      Prescription(
        name: 'Paracetamol',
        dosage: '500 mg',
        form: 'Tablet',
        frequency: '2x sehari (saat demam)',
        note: 'Maks 3 kali 24 jam jika diperlukan',
      ),
      Prescription(
        name: 'CTM',
        dosage: '4 mg',
        form: 'Tablet',
        frequency: '1x sehari malam',
        note: 'Untuk mengurangi gejala alergi/ritme tidur',
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
      'Symptomatic treatment: antipiretik (paracetamol) bila demam ≥38°C',
      'Rehydration and rest',
      'Monitor for breathing difficulty or persistent high fever >48 jam',
    ],
    notes:
        'Observasi perbaikan dalam 48 jam. Jika demam tidak turun atau muncul gejala pernapasan berat, segera kembali ke fasilitas kesehatan.',
    followUpDate: DateTime(2025, 10, 8),
    attachments: [
      'assets/images/Dokter1.jpg',
    ],
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
    chiefComplaint: 'Sakit tenggorokan, pilek',
    diagnosisTitle: 'Pharyngitis (probable viral)',
    diagnosisDetail:
        'Probable viral pharyngitis based on exam. No signs of bacterial infection (no exudate, no high fever >39°C). Symptomatic care recommended.',
    prescriptions: [
      Prescription(
        name: 'Ibuprofen',
        dosage: '200 mg',
        form: 'Tablet',
        frequency: '3x sehari setelah makan',
        note: '',
      ),
    ],
    treatmentSteps: [
      'Salt water gargle',
      'Analgesic/anti-inflammatory as needed',
    ],
    notes: 'Tidak ada indikasi antibiotik saat ini.',
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
    chiefComplaint: 'Kontrol rutin (immunization check)',
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
];
