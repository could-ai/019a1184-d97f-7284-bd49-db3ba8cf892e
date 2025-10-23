import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NutriGuia'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              padding: const EdgeInsets.all(32.0),
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Text(
                  'Seu Guia para uma Alimentação Inteligente',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colors.white,
                    fontSize: 36,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // Category Cards
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  CategoryCard(
                    title: 'Proteínas',
                    icon: Icons.restaurant,
                    route: '/protein',
                  ),
                  CategoryCard(
                    title: 'Fibras',
                    icon: Icons.grass,
                    route: '/fiber',
                  ),
                  CategoryCard(
                    title: 'Carboidratos',
                    icon: Icons.bakery_dining,
                    route: '/carbs',
                  ),
                  CategoryCard(
                    title: 'Gorduras Boas',
                    icon: Icons.oil_barrel,
                    route: '/fats',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;

  const CategoryCard({
    super.key,
    required this.title,
    required this.icon,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, route),
        borderRadius: BorderRadius.circular(16.0),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 64.0,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 16.0),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
