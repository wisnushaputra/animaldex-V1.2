

import 'package:flutter/material.dart';
import '../../models/animal.dart';
import '../screens/detail_screen.dart';

class AnimalCard extends StatelessWidget {
  final Animal animal;
  const AnimalCard({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(animal: animal),
          ),
        );
      },
      child: Card(
        
        color: animal.color,
        
        
        elevation: 0, 
        
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        
        
        child: Padding(
          padding: const EdgeInsets.all(12.0), 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              
              
              Flexible(
                flex: 3, 
                child: Hero(
                  tag: 'animal-hero-${animal.id}',
                  child: Image.network(
                    animal.imageUrl,
                    fit: BoxFit.contain,
                    // 1. Menangani proses unduh gambar
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child; // Gambar selesai dimuat
                      return Center(
                        child: CircularProgressIndicator(
                          // Menampilkan progress unduhan jika tersedia
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    // 2. Menangani jika URL rusak atau tidak ada internet
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[200],
                          child: const Icon(Icons.broken_image, color: Colors.grey),
                        );
                      },
              ),
                ),
              ),
              
              Spacer(flex: 1), 

              
              Text(
                animal.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              SizedBox(height: 4), 

              
              Text(
                
                '#${animal.id.padLeft(3, '0')}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}