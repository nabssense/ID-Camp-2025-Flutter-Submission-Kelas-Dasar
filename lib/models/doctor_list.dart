class Doctor {
  final String name;
  final String specialty; 
  final String subtitle; 
  final String priceLabel; 
  final double rating; 
  final String imageAsset; 
  final String bio; 
  final List<String> tags; 
  final List<DoctorAvailability> availability;

  Doctor({
    required this.name,
    required this.specialty,
    required this.subtitle,
    required this.priceLabel,
    required this.rating,
    required this.imageAsset,
    required this.bio,
    required this.tags,
    required this.availability,
  });
}

class DoctorAvailability {
  final String day;
  final int date;
  final List<String> times;

  const DoctorAvailability({
    required this.day,
    required this.date,
    required this.times,
  });
}

var doctorList = [
  Doctor(
    name: 'Dr. Elara Vance',
    specialty: 'Internal Medicine',
    subtitle: 'Internal Medicine · 15 min · Standard Check',
    priceLabel: '\$10 / Hour',
    rating: 4.9,
    imageAsset: 'assets/images/Dokter1.webp',
    
    bio: 'Experienced internal medicine specialist focused on adult care and preventive treatment.',
    tags: ['General', 'Adults'],
    availability: [
      DoctorAvailability(
        day: 'Monday',
        date: 18,
        times: ['07:00 WIB', '09:00 WIB', '11:00 WIB', '15:00 WIB'],
      ),
      DoctorAvailability(
        day: 'Tuesday',
        date: 19,
        times: ['08:00 WIB', '10:00 WIB', '13:00 WIB', '16:00 WIB'],
      ),
      DoctorAvailability(
        day: 'Wednesday',
        date: 20,
        times: ['07:30 WIB', '09:30 WIB', '12:30 WIB', '14:30 WIB'],
      ),
      DoctorAvailability(
        day: 'Thursday',
        date: 21,
        times: ['08:00 WIB', '10:00 WIB', '12:00 WIB', '17:00 WIB'],
      ),
      DoctorAvailability(
        day: 'Friday',
        date: 22,
        times: ['07:00 WIB', '09:00 WIB', '13:00 WIB', '16:00 WIB'],
      ),
      DoctorAvailability(
        day: 'Saturday',
        date: 23,
        times: ['08:00 WIB', '10:00 WIB', '12:00 WIB', '14:00 WIB'],
      ),
    ],
  ),

  Doctor(
    name: 'Dr. Marcus Klein',
    specialty: 'Infectious Disease',
    subtitle: 'Infectious Disease · 20 min · Consultation',
    priceLabel: '\$12 / Hour',
    rating: 4.8,
    imageAsset: 'assets/images/Dokter2.webp',
    
    bio: 'Specialist in infectious diseases, experience with complex infections and antibiotic stewardship.',
    tags: ['Infectious', 'Adults'],
    availability: [
      DoctorAvailability(
        day: 'Monday',
        date: 18,
        times: ['09:00 WIB', '11:00 WIB', '13:00 WIB', '16:00 WIB'],
      ),
      DoctorAvailability(
        day: 'Tuesday',
        date: 19,
        times: ['08:30 WIB', '10:30 WIB', '14:30 WIB', '17:30 WIB'],
      ),
      DoctorAvailability(
        day: 'Wednesday',
        date: 20,
        times: ['07:00 WIB', '09:00 WIB', '12:00 WIB', '15:00 WIB'],
      ),
      DoctorAvailability(
        day: 'Thursday',
        date: 21,
        times: ['08:00 WIB', '11:00 WIB', '13:30 WIB', '16:30 WIB'],
      ),
      DoctorAvailability(
        day: 'Friday',
        date: 22,
        times: ['09:00 WIB', '10:00 WIB', '12:00 WIB', '15:00 WIB'],
      ),
    ],
  ),

  Doctor(
    name: 'Dr. Chloe Bennet',
    specialty: 'General Pediatrics',
    subtitle: 'Pediatrics · 15 min · Child Check',
    priceLabel: '\$10 / Hour',
    rating: 4.9,
    imageAsset: 'assets/images/Dokter3.webp',
    
    bio: 'Friendly pediatrician with special interest in childhood development and immunization schedules.',
    tags: ['Pediatrics', 'Child'],
    availability: [
      DoctorAvailability(
        day: 'Monday',
        date: 18,
        times: ['08:00 WIB', '10:00 WIB', '13:00 WIB', '15:00 WIB'],
      ),
      DoctorAvailability(
        day: 'Tuesday',
        date: 19,
        times: ['07:30 WIB', '09:30 WIB', '11:30 WIB', '14:30 WIB'],
      ),
      DoctorAvailability(
        day: 'Wednesday',
        date: 20,
        times: ['08:00 WIB', '10:00 WIB', '12:00 WIB', '16:00 WIB'],
      ),
      DoctorAvailability(
        day: 'Thursday',
        date: 21,
        times: ['09:00 WIB', '11:00 WIB', '13:00 WIB', '15:00 WIB'],
      ),
      DoctorAvailability(
        day: 'Friday',
        date: 22,
        times: ['08:30 WIB', '10:30 WIB', '12:30 WIB', '14:30 WIB'],
      ),
    ],
  ),

  Doctor(
    name: 'Dr. Ethan Holloway',
    specialty: 'Emergency Medicine',
    subtitle: 'Emergency Medicine · 10 min · Quick Check',
    priceLabel: '\$15 / Hour',
    rating: 4.9,
    imageAsset: 'assets/images/Dokter4.webp',
    bio: 'Emergency physician skilled in acute care and stabilisation for urgent medical conditions.',
    tags: ['Emergency', 'Urgent'],
    availability: [
      DoctorAvailability(
        day: 'Monday',
        date: 18,
        times: ['10:00 WIB', '12:00 WIB', '14:00 WIB', '18:00 WIB'],
      ),
      DoctorAvailability(
        day: 'Tuesday',
        date: 19,
        times: ['09:00 WIB', '11:00 WIB', '13:00 WIB', '17:00 WIB'],
      ),
      DoctorAvailability(
        day: 'Wednesday',
        date: 20,
        times: ['08:00 WIB', '10:00 WIB', '12:00 WIB', '16:00 WIB'],
      ),
      DoctorAvailability(
        day: 'Thursday',
        date: 21,
        times: ['09:30 WIB', '11:30 WIB', '14:30 WIB', '18:30 WIB'],
      ),
      DoctorAvailability(
        day: 'Friday',
        date: 22,
        times: ['10:00 WIB', '12:00 WIB', '15:00 WIB', '19:00 WIB'],
      ),
    ],
  ),

  Doctor(
    name: 'Dr. Haylie Philips',
    specialty: 'Family Medicine',
    subtitle: 'Family Medicine · 20 min · Comprehensive',
    priceLabel: '\$11 / Hour',
    rating: 4.7,
    imageAsset: 'assets/images/Dokter1.webp', 
    bio: 'Family doctor providing continuous care across all ages with focus on preventive health.',
    tags: ['Family', 'General'],
    availability: [
      DoctorAvailability(
        day: 'Monday',
        date: 18,
        times: ['07:00 WIB', '09:00 WIB', '11:00 WIB', '13:00 WIB'],
      ),
      DoctorAvailability(
        day: 'Tuesday',
        date: 19,
        times: ['08:00 WIB', '10:00 WIB', '12:00 WIB', '14:00 WIB'],
      ),
      DoctorAvailability(
        day: 'Wednesday',
        date: 20,
        times: ['09:00 WIB', '11:00 WIB', '13:00 WIB', '15:00 WIB'],
      ),
      DoctorAvailability(
        day: 'Thursday',
        date: 21,
        times: ['08:30 WIB', '10:30 WIB', '12:30 WIB', '16:30 WIB'],
      ),
      DoctorAvailability(
        day: 'Friday',
        date: 22,
        times: ['07:30 WIB', '09:30 WIB', '11:30 WIB', '13:30 WIB'],
      ),
    ],
  ),
];
