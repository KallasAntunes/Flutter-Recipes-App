import 'package:flutter/material.dart';
import 'package:loka/entities/entities.dart';

class RecipePage extends StatelessWidget {
  const RecipePage(this.item, {Key? key}) : super(key: key);

  final RecipeEntity item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Details'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text(item.name ?? '', style: const TextStyle(fontSize: 30))),
              if (item.category != null) ...{
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text('Category: ',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(item.category!, style: const TextStyle(fontSize: 18)),
                  ],
                ),
              },
              if (item.garnish != null) ...{
                const SizedBox(height: 15),
                const Text('Garnish: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(item.garnish!, style: const TextStyle(fontSize: 18)),
              },
              if (item.glass != null) ...{
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text('Glass: ',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(item.glass!, style: const TextStyle(fontSize: 18)),
                  ],
                ),
              },
              if (item.ingredients?.isNotEmpty == true) ...{
                const SizedBox(height: 15),
                const Text('Ingredients: ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                ...?item.ingredients
                    ?.map((e) {
                      if (e.amount == null || e.unit == null || e.ingredient == null) return null;
                      return Text("\u2022 ${e.amount} ${e.unit} of ${e.ingredient ?? ''}",
                          style: const TextStyle(fontSize: 18));
                    })
                    .whereType<Text>()
                    .toList(),
              },
              if (item.preparation != null) ...{
                const SizedBox(height: 15),
                const Text('How to Prepare: ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text(item.preparation ?? '', style: const TextStyle(fontSize: 18)),
              },
            ],
          ),
        ),
      ),
    );
  }
}
