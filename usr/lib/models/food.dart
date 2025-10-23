class Food {
  final String name;
  final String image; // Placeholder for illustration
  final String portion;
  final double nutrientAmount;
  final int calories;

  const Food({
    required this.name,
    required this.image,
    required this.portion,
    required this.nutrientAmount,
    required this.calories,
  });
}

enum SortOption {
  name,
  nutrient,
}
