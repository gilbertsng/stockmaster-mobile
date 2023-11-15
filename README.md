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
5. Pada langkah ke-4 akan memunculkan error pada file "main.dart" karena beberapa fungsi sudah dipindahkan ke "menu.dart". Untuk menghindari error saya menambahkan "```import 'package:stockmaster/menu.dart';```"
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
    ShopItem("Lihat Item", Icons.checklist),
    ShopItem("Tambah Item", Icons.add_shopping_cart),
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

## README Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements
### 1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

Navigator.push(), fungsinya adalah untuk menambah route/halaman baru ke tumpukan navigasi tanpa menghapus route sebelumnya sehingga user dapat kembali ke route sebelumnya.
Contoh: Dari halaman beranda ke halaman detail produk.
```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => DetailPage()),
);
```

Navigator.pushReplacement(), fungsinya adalah untuk menggantikan route saat ini dengan route yang baru (Route sebelumnya dihapus dari tumpukan navigasi).
Contoh: Mengganti halaman login dengan halaman utama setelah login berhasil.
```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => HomePage()),
);
```

### 2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
Container, widget untuk pembungkus, styling, dan positioning yang digunakan untuk membuat kotak dengan warna, ukuran, atau dekorasi tertentu
Row dan Column, untuk menata widget dalam satu baris atau kolom
Stack, untuk menumpuk widget satu diatas yang lain (idealnya untuk overlay atau positioning widget di atas widget lain)
ListView, menampilkan daftar elemen yang rolling vertikal atau horizontal (Cocok untuk daftar yang panjang atau data yang dinamis)
GridView, menampilkan daftar elemen dalam grid (untuk galeri foto atau item yang ditampilkan secara grid)
SizedBox, untuk menambahkan spasi berdasarkan lebar dan tinggi tertentu.

### 3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
TextFormField untuk Nama: Digunakan untuk memasukkan nama item.
```dart
child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Name",
                        labelText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _name = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Nama tidak boleh kosong!";
                        }
                        return null;
                      },
                    ),
```

TextFormField untuk Amount: Digunakan untuk user amount item.
```dart
child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Amount",
                          labelText: "Amount",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _amount = int.parse(value!);
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Amount tidak boleh kosong!";
                          }
                          if (int.tryParse(value) == null) {
                            return "Amount harus berupa angka!";
                          }
                          return null;
                        },
                      ),
```
TextFormField untuk Description: user dapat menulis deskripsi tentang item menggunakan TextField.
```dart
child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Description",
                          labelText: "Description",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _description = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Description tidak boleh kosong!";
                          }
                          return null;
                        },
                      ),
```

### 4. Bagaimana penerapan clean architecture pada aplikasi Flutter?

Clean Architecture merupakan konsep arsitektur perangkat lunak yang memisahkan kode menjadi lapisan dengan tanggung jawab yang berbeda, meningkatkan kebersihan dan kemudahan pemeliharaan kode. Dalam konteks Flutter:
Presentation Layer: Berisi UI dan logic UI. Menggunakan Widget untuk membangun UI dan mengambil data dari Bloc atau ViewModel.
Business Logic Layer (BLL): Menggunakan Bloc atau Provider untuk mengelola state dan logic aplikasi.
Data Layer: Terdiri dari Repository dan Data Source. Repository bertindak sebagai mediator antara BLL dan sumber data (API, database lokal).
Domain Layer: Berisi entitas dan use case. Entitas adalah model data, dan use case menentukan operasi bisnis.
Masing-masing lapisan ini harus memiliki tanggung jawab yang jelas dan terpisah untuk memudahkan testing, maintenance, dan scalability aplikasi.

### 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

- Pertama, saya membuat 2 direktori baru pada lib yaitu screens dan widgets fungsinya adalah untuk merapikan manajemen file
- Lalu saya membuat file shoplist_form.dart untuk menerima input dari user. Pada file tersebut saya membuat validasi agar input dari user tidak boleh kosong dan harus sesuai dengan tipe data atribut modelnya
```dart
class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";
  
    @override
    Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                'Form Tambah Produk',
              ),
            ),
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Name",
                        labelText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _name = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Nama tidak boleh kosong!";
                        }
                        return null;
                      },
                    ),
                  ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Amount",
                          labelText: "Amount",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _amount = int.parse(value!);
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Amount tidak boleh kosong!";
                          }
                          if (int.tryParse(value) == null) {
                            return "Amount harus berupa angka!";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Description",
                          labelText: "Description",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _description = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Description tidak boleh kosong!";
                          }
                          return null;
                        },
                      ),
                    ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.indigo),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Produk berhasil tersimpan'),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Nama: $_name'),
                                            Text('Amount: $_amount'),
                                            Text('Description: $_description'),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          child: const Text('OK'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              _formKey.currentState!.reset();
                              }
                            },
                            child: const Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ),
          ),
        );
    }
}
```

- Kemudian membuat drawer dan menghubungkan opsi tambah item yang berada pada drawer dan halaman utama ke shoplist_form.dart.
```dart
import 'package:flutter/material.dart';
import 'package:stockmaster/screens/menu.dart';
import 'package:stockmaster/screens/shoplist_form.dart';
import 'package:stockmaster/screens/see_items.dart';


class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              children: [
                Text(
                  'My Shop',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Catat seluruh keperluan belanjamu di sini!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  )
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => ShopFormPage(),
                )
              );
            },
          ),
        ],
      ),
    );
  }
}
```

- Diakhiri dengan menghubungkan pada halaman utama.

 