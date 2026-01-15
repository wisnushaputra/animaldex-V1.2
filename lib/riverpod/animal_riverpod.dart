

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/animal.dart';
import 'dart:io';



// 1. Provider untuk menyimpan teks pencarian (StateProvider)
final searchQueryProvider = StateProvider<String>((ref) => '');

// 2. Update animalListProvider agar mendengarkan searchQueryProvider
final animalListProvider = FutureProvider<List<Animal>>((ref) {
  // Watch (pantau) teks pencarian
  final search = ref.watch(searchQueryProvider);
  final service = ref.watch(animalServiceProvider);
  
  // Panggil fungsi getAnimals dengan parameter pencarian
  return service.getAnimals(query: search);
});


class AnimalService {
  final _supabase = Supabase.instance.client;

  Future<List<Animal>> getAnimals({String query = ''}) async {
    var supabaseQuery = _supabase.from('animals').select();

    // Jika ada teks pencarian, tambahkan filter SQL 'ilike' (tidak peka huruf besar/kecil)
    if (query.isNotEmpty) {
      supabaseQuery = supabaseQuery.ilike('name', '%$query%');
    }

    final response = await supabaseQuery;
    return (response as List).map((data) => Animal.fromJson(data)).toList();




  //   try {
  //   final response = await _supabase.from('animals').select();

    
    
   
  //   print('Data dari Supabase: $response'); 

  //   return (response as List).map((data) => Animal.fromJson(data)).toList();
  // } catch (e) {
    
  //   print('Error di Service: $e'); 
  //   rethrow;
  // }
}



  // Fungsi untuk Menambah Hewan Baru
  Future<void> addAnimal({
    required String name,
    required String description,
    required String colorHex,
    required File imageFile,
  }) async {
    // 1. Upload Gambar ke Supabase Storage
    final String fileName = '${DateTime.now().millisecondsSinceEpoch}.png';
    final String path = await _supabase.storage
        .from('animal-images')
        .upload(fileName, imageFile);

    // 2. Dapatkan Public URL gambar yang baru diupload
    final String imageUrl = _supabase.storage
        .from('animal-images')
        .getPublicUrl(fileName);

    // 3. Simpan data teks ke tabel 'animals'
    await _supabase.from('animals').insert({
      'name': name,
      'description': description,
      'image_url': imageUrl,
      'color_hex': colorHex,
    });
  }

}



// // Provider tetap sama, sehingga UI tidak perlu tahu perubahan di dalamnya
final animalServiceProvider = Provider<AnimalService>((ref) => AnimalService());

// final animalListProvider = FutureProvider<List<Animal>>((ref) {
//   return ref.watch(animalServiceProvider).getAnimals();
// });