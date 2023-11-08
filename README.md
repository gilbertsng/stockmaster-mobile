# Kevin Gilbert Sinaga - 2206826053
# PBP F

## README Tugas 7: Elemen Dasar Flutter
### 1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
Stateless Widget merupakan widget yang tidak memiliki state internal. Widget ini juga tidak dapat mengubah tampilannya sendiri (Jika ingin diubah maka harus dibuatkan widget baru) dan widget ini cocok untuk kasus sederhana karena tidak memerlukan pengelolaan state internal. Stateless widget lebih cocok digunakan untuk menampilkan teks atau gambar yang tidak berubah.

Stateful Widget merupakan widget yang memiliki state internal yang dapat berubah selama siklus hidup widget. Widget ini dapat memperbarui tampilannya sendiri ketika keadaan internalnya berubah dan widget ini memerlukan pengelolaan state internal.
Stateful widget lebih cocok digunakan untuk daftar interaktif, formulir, atau tampilan yang berubah.

### 2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
a. MaterialApp :  mengatur tema dan konfigurasi dasar aplikasi.
b. Scaffold :  membuat tata letak dasar yang berisi AppBar dan body.
c. AppBar : membuat bar dalam aplikasi.
d. Column : mengatur tampilan secara vertikal dalam satu column
e. Padding : menambahkan padding (mengatur jarak antara elemen satu dengan elemen lainnya)
f. InkWell : membuat area yang responsif terhadap sentuhan pengguna dan menampilkan pesan "SnackBar" saat diklik.
g. Container : mengelola tampilan (memberi margin dan padding).
h. Text : menampilkan text.
i. SnackBar : menampilkan pop-up kecil saat saat user menekan kartu item
j. Icon : menampilkan ikon dengan warna dan ukuran tertentu

### 3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
1. Membuat direktori baru dengan nama stockmaster, lalu saya generate project flutter pada direktor ini.
2. Saya melakukan git init pada direktori stockmaster.
3. Pada direktori stockmaster, saya menambahkan file baru dengan nama "menu.dart" dan menambahkan kode "import 'package:flutter/material.dart';"
4. Pada file "menu.dart" setelah mengimport file dari "main.dart" saya menambahkan kode yang berisi class MyHomepage dan class _MyHomePageState.
5. Pada langkah ke-4 akan memunculkan error pada file "main.dart" karena beberapa fungsi sudah dipindahkan ke "menu.dart". Untuk menghindari error saya menambahkan "import 'package:shopping_list/menu.dart';"
6. Untuk membuat tiga tombol sederhana (Lihat Item, Tambah Item, dan Logout), Pada file "main.dart" saya mengubah kode "MyHomePage(title: 'Flutter Demo Home Page')" menjadi "MyHomePage()"
7. File "menu.dart" saya melakukan modifikasi pada class MyHomePage() dari widget yang memiliki state ke widget yang tidak memilki state dan menghapus fungsi state yang ada pada bagian stateless widget:
```dart
class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            ...
        );
    }
}
```
8. Menambahkan class ShopItem berikut pada file "menu.dart"
```dart
class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}
```
9. Pada file "menu.dart" class MyHomePage extends StatelessWidget, saya menambahkan kode berikut di bawah MyHomePage({Key? key}) : super(key: key); untuk mendefinisikan tombol yang ingin ditambahkan
```dart
final List<ShopItem> items = [
    ShopItem("Lihat Produk", Icons.checklist),
    ShopItem("Tambah Produk", Icons.add_shopping_cart),
    ShopItem("Logout", Icons.logout),
];
```
10. Pada class yang sama, saya mengubah function Widget build menjadi seperti berikut
```dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan background color dan judul
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 28, 56, 121),
        title: const Text(
          'Dvntory',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      // Body aplikasi yang scrollable
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Padding disekitar column
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Main Menu',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // GridView untuk menampilkan item-item secara grid
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true, // Mengontrol apakah children harus shrink ke ukuran mereka di cross axis
                children: items.map((InvItem item) {
                  // Mapping dari list item ke widget InvCard
                  return InvCard(item);
                }).toList(), // Konversi kembali ke list setelah mapping
              ),
            ],
          ),
        ),
      ),
    );
  }
```
11. Lalu saya mendefinisikan function baru untuk tombol/kartu yang ditambahkan
```dart
class InvCard extends StatelessWidget {
  final InvItem item; // Item inventaris yang diterima

  const InvCard(this.item, {super.key}); // Constructor dengan super.key

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color, // Warna background dari card
      child: InkWell(
        onTap: () {
          // Handler ketika card diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!"))); // Menampilkan SnackBar
        },
        child: Container(
          padding: const EdgeInsets.all(8), // Padding disekitar content dalam card
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center content secara vertikal
              children: [
                Icon(
                  item.icon, // Icon dari item
                  color: Colors.white,
                  size: 40.0,
                ),
                const Padding(padding: EdgeInsets.all(3)), // Memberikan space antar elemen
                Text(
                  item.name, // Nama item
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white), // Style text
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
---
---