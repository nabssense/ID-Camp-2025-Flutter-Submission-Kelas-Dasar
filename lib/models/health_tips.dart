class HealthTips {
  final String title;
  final String description;
  final String imageAsset;
  final String bio; 
  final List<String> tags;

  HealthTips({
    required this.title,
    required this.description,
    required this.imageAsset,
    required this.bio,
    required this.tags,
  });
}

var healthTipsList = [
  HealthTips(
    title: 'Recovery Fuel', 
    description: 'Refuel with protein+carbs within 60 mins',
    imageAsset: 'assets/images/Recovery-Fuel.png', 
    bio: 'Penting untuk mengonsumsi protein dan karbohidrat setelah berolahraga berat untuk memulihkan otot dan energi.',
    tags: ['Article'], 
  ),
  HealthTips(
    title: 'The Power of Sleep',
    description: 'Aim for 7-9 hours of quality sleep nightly',
    imageAsset: 'assets/images/Sleep.jpg', 
    bio: 'Tidur yang cukup sangat penting untuk fungsi kognitif, perbaikan fisik, dan kesehatan mental.',
    tags: ['Health Tips'],
  ),
  HealthTips(
    title: 'Stay Hydrated',
    description: 'Drink at least 8 glasses of water a day',
    imageAsset: 'assets/images/Hydrated.jpg', 
    bio: 'Dehidrasi dapat memengaruhi tingkat energi dan suasana hati Anda. Pastikan asupan cairan harian tercukupi.',
    tags: ['Daily Tips'],
  ),
  HealthTips(
    title: 'Mindful Eating',
    description: 'Eat slowly and savor every bite',
    imageAsset: 'assets/images/Eat.jpg', 
    bio: 'Makan dengan penuh kesadaran dapat meningkatkan pencernaan dan membantu Anda mengenali rasa kenyang.',
    tags: ['Article'],
  ),
];