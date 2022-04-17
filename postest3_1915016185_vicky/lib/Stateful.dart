import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const Stateful());
}

class Stateful extends StatelessWidget {
  const Stateful({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Tipe { pc, laptop, mouse, keyboard, storage }

class _MyHomePageState extends State<MyHomePage> {
  String Barang = '', Harga = '', Deskripsi = '', Jenis = 'PC', Kondisi = '';
  final BarangController = TextEditingController();
  final HargaController = TextEditingController();
  final DeskripsiController = TextEditingController();
  final JenisController = TextEditingController();

  bool? isActive = false;

  Tipe? tipe = Tipe.pc;

  void pilihjenis(String value) {
    Jenis = value;
  }

  @override
  void dispose() {
    // TODO: implement dispose

    BarangController.dispose();
    HargaController.dispose();
    DeskripsiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD1E1E0),
      appBar: AppBar(
        title: Text("1915016185_Vicky Pranandika Wijaksana"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text("Nama : ${Barang}"),
            Text("Harga : ${Harga}"),
            Text("Deskripsi : ${Deskripsi}"),
            Text("Jenis Barang : ${Jenis}"),
            Divider(
              thickness: 5,
            ),
            TextField(
              controller: BarangController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Masukkan Nama Barang",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: HargaController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Masukkan Harga",
              ),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: DeskripsiController,
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Deskripsi",
              ),
            ),
            ListTile(
              leading: Radio(
                value: Tipe.pc,
                groupValue: tipe,
                onChanged: (Tipe? t) {
                  setState(() {
                    tipe = t;
                    Jenis = "PC";
                  });
                },
              ),
              title: Text("PC"),
            ),
            ListTile(
              leading: Radio(
                value: Tipe.laptop,
                groupValue: tipe,
                onChanged: (Tipe? t) {
                  setState(() {
                    tipe = t;
                    Jenis = "Laptop";
                  });
                },
              ),
              title: Text("Laptop"),
            ),
            ListTile(
              leading: Radio(
                value: Tipe.mouse,
                groupValue: tipe,
                onChanged: (Tipe? t) {
                  setState(() {
                    tipe = t;
                    Jenis = "Mouse";
                  });
                },
              ),
              title: Text("Mouse"),
            ),
            ListTile(
              leading: Radio(
                value: Tipe.keyboard,
                groupValue: tipe,
                onChanged: (Tipe? t) {
                  setState(() {
                    tipe = t;
                    Jenis = "Keyboard";
                  });
                },
              ),
              title: Text("Keyboard"),
            ),
            ListTile(
              leading: Radio(
                value: Tipe.storage,
                groupValue: tipe,
                onChanged: (Tipe? t) {
                  setState(() {
                    tipe = t;
                    Jenis = "Storage";
                  });
                },
              ),
              title: Text("Storage"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Barang = BarangController.text;
                  Harga = HargaController.text;
                  Deskripsi = DeskripsiController.text;
                  Jenis = Jenis;
                });
              },
              child: Text("Tampilkan"),
              style: ElevatedButton.styleFrom(),
            ),
          ],
        ),
      ),
    );
  }
}
