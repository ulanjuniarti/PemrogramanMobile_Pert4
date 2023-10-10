import 'package:flutter/material.dart';
import 'toast.dart'; // Import file form.dart

class ListItem {
  int value;
  String name;
  ListItem(this.value, this.name);
}

class DropdownDemo extends StatefulWidget {
  @override
  _DropdownDemoState createState() => _DropdownDemoState();
}

class _DropdownDemoState extends State<DropdownDemo> {
  List<ListItem> _dropdownItems = [
    ListItem(1, "FILKOM"),
    ListItem(2, "FMIPA"),
    ListItem(3, "FTP"),
    ListItem(4, "FEB"),
  ];

  late List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  late ListItem _itemSelected;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _itemSelected = _dropdownMenuItems[0].value!; // Default pilih yang pertama
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(
      List<ListItem> listItems) {
    List<DropdownMenuItem<ListItem>> items = <DropdownMenuItem<ListItem>>[];
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Form dengan Dropdown"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                border: Border.all(),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: _itemSelected,
                  items: _dropdownMenuItems,
                  onChanged: (value) {
                    setState(() {
                      _itemSelected = value!;
                    });
                  },
                ),
              ),
            ),
          ),
          Text("Fakultas Terpilih : ${_itemSelected.name}"),
        ],
      ),
    );
  }
}

class FormDemo extends StatefulWidget {
  @override
  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  final _formKey = GlobalKey<FormState>();
  List<ListItem> _dropdownItems = [
    ListItem(1, "FKes"),
    ListItem(2, "FST"),
    ListItem(3, "FIS"),
  ];
  late ListItem _itemSelected;
  late String _nama;
  late String _nomorTelepon;
  late DateTime _tanggalLahir;
  late List<DropdownMenuItem<ListItem>> _dropdownMenuItems;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _itemSelected = _dropdownMenuItems[0].value!; // Default pilih yang pertama
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(
      List<ListItem> listItems) {
    List<DropdownMenuItem<ListItem>> items = <DropdownMenuItem<ListItem>>[];
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Demo'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
                hintText: 'Masukkan nama anda',
                labelText: 'Nama',
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Tolong diisi terlebih dahulu';
                }
                return null;
              },
              onSaved: (value) {
                _nama = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.phone),
                hintText: 'Masukkan no telepon',
                labelText: 'Telepon',
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Tolong diisi terlebih dahulu';
                }
                return null;
              },
              onSaved: (value) {
                _nomorTelepon = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.calendar_today),
                hintText: 'Masukkan tanggal lahir (YYYY-MM-DD)',
                labelText: 'Tanggal lahir',
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Tolong diisi terlebih dahulu';
                }
                return null;
              },
              onSaved: (value) {
                // Di sini Anda dapat melakukan konversi dari string tanggal ke DateTime jika diperlukan.
                _tanggalLahir = DateTime.parse(value!);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  border: Border.all(),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: _itemSelected,
                    items: _dropdownMenuItems,
                    onChanged: (value) {
                      setState(() {
                        _itemSelected = value!;
                      });
                    },
                  ),
                ),
              ),
            ),
            Text("Fakultas Terpilih : ${_itemSelected.name}"),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validasi form
                  if (_formKey.currentState!.validate()) {
                    // Simpan data yang diisi
                    _formKey.currentState!.save();

                    // Jika form valid, tampilkan Snackbar.
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              'Data diproses: $_nama, $_nomorTelepon, $_tanggalLahir')),
                    );
                  }
                },
                child: Text('Kirim'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Pindah ke halaman FormDemo saat tombol ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ToastDemo()),
                  );
                },
                child: Text('Pindah Halaman'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Demo Form dan Dropdown'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(height: 40),
            FormDemo(),
            SizedBox(height: 20),
            DropdownDemo(),
          ],
        ),
      ),
    );
  }
}