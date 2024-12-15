import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../home/profile_icon.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My recipes'),
        leading: const ProfileIcon(),
      ),
      body: const RecipesEmptyView(),
    );
  }
}

class RecipeSummaryTile extends StatelessWidget {
  const RecipeSummaryTile({required this.recipeId, super.key});
  final String recipeId;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Recipe $recipeId'),
    );
  }
}

class RecipesEmptyView extends StatelessWidget {
  const RecipesEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgPicture.asset('assets/images/recipes_tab_icon.svg', height: 140, width: 120),
          const SizedBox(height: 16),
          Text(
            'Here you can create recipes and organise them into recipe books',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'You can share recipes and recipe books with friends and family',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'To get started, tap the + button below',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
