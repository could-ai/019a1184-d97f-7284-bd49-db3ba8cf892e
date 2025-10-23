import 'package:flutter/material.dart';
import '../models/food.dart';

class FoodListScreen extends StatefulWidget {
  final String category;

  const FoodListScreen({super.key, required this.category});

  @override
  State<FoodListScreen> createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {
  SortOption _sortOption = SortOption.name;
  late List<Food> _foods;

  @override
  void initState() {
    super.initState();
    _foods = _getFoodsForCategory(widget.category);
    _sortFoods();
  }

  List<Food> _getFoodsForCategory(String category) {
    switch (category) {
      case 'Proteínas':
        return [
          const Food(name: 'Frango', image: '🍗', portion: '100g', nutrientAmount: 31.0, calories: 165),
          const Food(name: 'Salmão', image: '🐟', portion: '100g', nutrientAmount: 25.0, calories: 206),
          const Food(name: 'Ovos', image: '🥚', portion: '2 unidades', nutrientAmount: 12.6, calories: 155),
          const Food(name: 'Iogurte Grego', image: '🥛', portion: '170g', nutrientAmount: 10.0, calories: 100),
          const Food(name: 'Lentilhas', image: '🫘', portion: '100g', nutrientAmount: 9.0, calories: 116),
        ];
      case 'Fibras':
        return [
          const Food(name: 'Aveia', image: '🥣', portion: '40g', nutrientAmount: 4.0, calories: 150),
          const Food(name: 'Brócolis', image: '🥦', portion: '100g', nutrientAmount: 2.6, calories: 34),
          const Food(name: 'Maçãs', image: '🍎', portion: '1 unidade', nutrientAmount: 4.4, calories: 95),
          const Food(name: 'Feijão', image: '🫘', portion: '100g', nutrientAmount: 7.9, calories: 127),
          const Food(name: 'Amêndoas', image: '🥜', portion: '28g', nutrientAmount: 3.5, calories: 161),
        ];
      case 'Carboidratos':
        return [
          const Food(name: 'Batata Doce', image: '🍠', portion: '100g', nutrientAmount: 20.0, calories: 86),
          const Food(name: 'Arroz Integral', image: '🍚', portion: '100g', nutrientAmount: 25.0, calories: 130),
          const Food(name: 'Banana', image: '🍌', portion: '1 unidade', nutrientAmount: 27.0, calories: 105),
          const Food(name: 'Quinoa', image: '🌾', portion: '100g', nutrientAmount: 21.0, calories: 120),
        ];
      case 'Gorduras Boas':
        return [
          const Food(name: 'Abacate', image: '🥑', portion: '50g', nutrientAmount: 7.5, calories: 80),
          const Food(name: 'Azeite de Oliva', image: '🫒', portion: '1 colher', nutrientAmount: 14.0, calories: 119),
          const Food(name: 'Nozes', image: '🥜', portion: '28g', nutrientAmount: 18.0, calories: 185),
          const Food(name: 'Sementes de Chia', image: '🌱', portion: '15g', nutrientAmount: 9.0, calories: 60),
        ];
      default:
        return [];
    }
  }

  void _sortFoods() {
    setState(() {
      if (_sortOption == SortOption.name) {
        _foods.sort((a, b) => a.name.compareTo(b.name));
      } else {
        _foods.sort((a, b) => b.nutrientAmount.compareTo(a.nutrientAmount));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alimentos Ricos em ${widget.category}'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Sort Options
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Ordenar por: '),
                DropdownButton<SortOption>(
                  value: _sortOption,
                  onChanged: (SortOption? newValue) {
                    if (newValue != null) {
                      _sortOption = newValue;
                      _sortFoods();
                    }
                  },
                  items: const [
                    DropdownMenuItem(
                      value: SortOption.name,
                      child: Text('Nome'),
                    ),
                    DropdownMenuItem(
                      value: SortOption.nutrient,
                      child: Text('Quantidade de Nutriente'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Food List
          Expanded(
            child: ListView.builder(
              itemCount: _foods.length,
              itemBuilder: (context, index) {
                final food = _foods[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Text(
                          food.image,
                          style: const TextStyle(fontSize: 40),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                food.name,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                'Porção: ${food.portion}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Text(
                                'Nutriente: ${food.nutrientAmount}g',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Text(
                                'Calorias: ${food.calories}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
