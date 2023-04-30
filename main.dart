import 'package:flutter/material.dart';

// Pada fungsi main(), diinisialisasi kelas MyApp sebagai aplikasi utama. Di dalam kelas MyApp, terdapat judul aplikasi dan tema,
//  serta diatur halaman awal dengan menampilkan kelas LoginPage.

// Kelas LoginPage merupakan kelas yang memperlihatkan tampilan halaman login.
// Di dalam kelas ini, terdapat _formKey sebagai global key untuk validasi inputan pada form.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('assets/images/wifikoin.jpg'), context);

    return MaterialApp(
      title: 'Login WiFiKoin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  // Pada fungsi build() di dalam kelas LoginPage, digunakan widget Scaffold sebagai wadah utama untuk tampilan halaman login.
// Di dalam Scaffold terdapat Center widget yang berisi tampilan halaman login,
// dengan menggunakan widget SingleChildScrollView agar tampilan bisa di-scroll jika memenuhi layar.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //pada halaman loginPage terdapat gambar Logo WifiKoin
              //yang ditampilkan mengguanakn widget Image.asset
              Image.asset(
                'images/wifikoin.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Masukkan kode voucher',
                          labelText: 'KodeVoucher',
                          prefixIcon: Icon(Icons.person),
                        ),
                        //pada halaman ini terdapat satu kolom untuk menginputkan kode voucher
                        // dan dibawahnya terdapat button untuk memproses kode voucher yang telah diinputkan
                        // karena disini saya belum menggunakan kode untuk cek kode voucher maka
                        // apapun kata-kata yang akan diinputkan setelah di klik proses
                        //maka akan muncul voucher berhasil diredeem

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Kode Voucher Wajib di Isi';
                          }
                          return null;
                        },
                      ),
                                            SizedBox(height: 20),
                      // ElevatedButton ini yang akan memproses kode voucher
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            // Proses validasi voucher code di sini
                            // Jika voucher code valid, maka lakukan proses selanjutnya
                            // Jika tidak valid, tampilkan pesan error
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Kode Voucher Berhasil di Redem')),
                            );
                            // TODO: Implement login logic
                          }
                        },
                        child: Text('Proses'),
                      ),
                    ],
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

