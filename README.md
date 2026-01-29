# animaldex

## Deskripsi Aplikasi 
AnimalDex adalah aplikasi ensiklopedia hewan modern yang dirancang untuk memberikan 
pengalaman eksplorasi dunia satwa yang menyenangkan dan edukatif. Dengan visualisasi karakter 
hewan dalam gaya 3D Cartoon yang unik, aplikasi ini kini hadir dengan performa yang lebih cepat 
dan data yang dinamis berkat pembaruan arsitektur backend. 

## Apa yang Baru? (Pembaruan Teknis) 
Pembaruan terbesar pada versi ini adalah migrasi sistem manajemen data dari penyimpanan 
lokal (hardcoded/local JSON) ke Supabase API. 
- Real-time Data Fetching: Data hewan (nama, deskripsi, kategori, dan URL gambar) kini diambil 
secara langsung (fetch) dari database Supabase, memungkinkan pembaruan konten tanpa 
perlu memperbarui versi aplikasi di toko aplikasi. 
- Optimasi Aset: Gambar 3D berkualitas tinggi kini di-load melalui jaringan dengan caching yang 
efisien, menjaga ukuran aplikasi tetap ringan. 

## Fitur Unggulan 
1.  Smart Search (Pencarian Cepat) Fitur pencarian real-time yang memungkinkan pengguna 
menemukan hewan favorit mereka dengan cepat hanya dengan mengetikkan nama. 
Algoritma pencarian yang responsif memudahkan navigasi di dalam koleksi hewan yang 
terus bertambah. 
2.  Integrasi API Supabase Menghubungkan aplikasi dengan backend Supabase yang handal 
untuk: 
- Mengambil daftar hewan secara dinamis. 
- Manajemen aset gambar yang lebih terstruktur. 
- Skalabilitas data yang lebih mudah di masa depan. 
3.  Visualisasi 3D Cartoon Style Setiap hewan ditampilkan dalam format seni kartun 3D 
berkualitas tinggi, memberikan tampilan yang bersih, modern, dan sangat menarik bagi 
pengguna dari segala usia. 
4. Deskripsi Edukatif & Ringkas Menyajikan informasi hewan dalam format "satu paragraf" 
yang padat dan mudah dicerna (seperti yang telah dibuat sebelumnya), mencakup habitat, 
perilaku unik, dan fakta menarik. 
5. Kategori & Filter (Fitur Tambahan) Pengguna kini dapat menyaring hewan berdasarkan 
kategori (misalnya: Karnivora, Herbivora, Unggas, Mamalia) untuk pengalaman belajar 
yang lebih terstruktur. 
6. UI/UX yang Imersif 
- Splash Screen baru dengan logo AnimalDex 3D. 
- Tampilan Detail View dengan animasi transisi yang halus (Hero Animation) saat 
memilih hewan. 


## Teknologi yang Digunakan 
• Framework: Flutter (Dart) 
• Backend & Database: Supabase (PostgreSQL) 
• State Management: Riverpod 




## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
