import 'package:flutter/material.dart';
import 'recipe_detail.dart'; // Import the details page

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Recipes Home';
    return MaterialApp(
      title: appTitle,
      home: RecipeHomeScreen(),
    );
  }
}

class RecipeHomeScreen extends StatelessWidget {
  const RecipeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Recipes Home';

    return Scaffold(
      appBar: AppBar(title: const Text(appTitle)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // List of food items with buttons
            TitleSection(name: 'Breakfast Pizza', location: '35 mins'),
            ButtonSection(
              name: 'Breakfast Pizza',
              location: '35 mins',
              ingredients: [
                '2 eggs',
                '1 pizza crust',
                '1/2 cup cheese',
                '1/4 cup tomato sauce',
              ],
              steps: [
                'Preheat oven to 375°F (190°C).',
                'Spread tomato sauce on pizza crust.',
                'Sprinkle cheese over the sauce.',
                'Crack eggs on top and bake for 15 minutes.',
              ],
            ),

            TitleSection(name: 'Pancakes with Maple Syrup', location: '25 mins'),
            ButtonSection(
              name: 'Pancakes with Maple Syrup',
              location: '25 mins',
              ingredients: [
                '1 cup flour',
                '1 egg',
                '1 cup milk',
                '2 tbsp sugar',
                '1 tsp baking powder',
                '1/2 tsp salt',
                'Maple syrup for serving',
              ],
              steps: [
                'Mix all ingredients in a bowl.',
                'Heat a pan over medium heat and add butter.',
                'Pour batter into the pan and cook until bubbles form.',
                'Flip and cook until golden brown.',
                'Serve with maple syrup.',
              ],
            ),

            TitleSection(name: 'Avocado Toast', location: '15 mins'),
            ButtonSection(
              name: 'Avocado Toast',
              location: '15 mins',
              ingredients: [
                '2 slices of bread',
                '1 ripe avocado',
                '1/2 lemon (juice)',
                'Salt & pepper to taste',
              ],
              steps: [
                'Toast the bread until golden brown.',
                'Mash the avocado with lemon juice, salt, and pepper.',
                'Spread avocado mixture on toasted bread.',
                'Enjoy your avocado toast!',
              ],
            ),

            TitleSection(name: 'Omelette with Cheese', location: '20 mins'),
            ButtonSection(
              name: 'Omelette with Cheese',
              location: '20 mins',
              ingredients: [
                '3 eggs',
                '1/4 cup shredded cheese',
                '1 tbsp butter',
                'Salt & pepper to taste',
              ],
              steps: [
                'Whisk eggs in a bowl.',
                'Heat butter in a pan over medium heat.',
                'Pour eggs into the pan and cook for 3 minutes.',
                'Sprinkle cheese on top and fold the omelette.',
                'Cook for another 2 minutes, then serve.',
              ],
            ),

            TitleSection(name: 'French Toast', location: '30 mins'),
            ButtonSection(
              name: 'French Toast',
              location: '30 mins',
              ingredients: [
                '2 slices of bread',
                '1 egg',
                '1/2 cup milk',
                '1 tsp cinnamon',
                'Butter for cooking',
                'Maple syrup for serving',
              ],
              steps: [
                'Whisk egg, milk, and cinnamon together.',
                'Dip bread slices into the mixture.',
                'Heat butter in a pan and cook bread until golden brown on both sides.',
                'Serve with maple syrup.',
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(location, style: TextStyle(color: Colors.grey[500])),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red[500]),
          const Text('41'),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  final String name;
  final String location;
  final List<String> ingredients;
  final List<String> steps;

  const ButtonSection({
    super.key,
    required this.name,
    required this.location,
    required this.ingredients,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeDetail(
                  name: name,
                  location: location,
                  ingredients: ingredients,
                  steps: steps,
                ),
              ),
            );
          },
          child: Row(
            children: [
              Icon(Icons.near_me, color: color),
              const SizedBox(width: 5),
              const Text('RECIPE'),
            ],
          ),
        ),
        
      ],
    );
  }
}
