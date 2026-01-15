
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; 
import '../../riverpod/animal_riverpod.dart'; 
import 'animal_card.dart';

class AnimalGridView extends ConsumerWidget {
  const AnimalGridView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncAnimals = ref.watch(animalListProvider);

    return asyncAnimals.when(
      data: (animals) {
        return GridView.builder(
          padding: EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            
            
            
            childAspectRatio: 1 / 1.3, 
          ),
          itemCount: animals.length,
          itemBuilder: (context, index) {
            final animal = animals[index];
            return AnimalCard(animal: animal);
          },
        );
      },
      loading: () {
        return Center(child: CircularProgressIndicator());
      },
      error: (err, stack) {
        // Ini akan memunculkan teks error asli di layar HP Anda
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Terjadi Error: $err', 
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}