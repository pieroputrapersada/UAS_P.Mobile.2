## Ujian AKhir Semester Pemograman Mobile 2

## API Daftar Stasiun Kereta Api di Indonesia

## Profil
| #               | Biodata                  |
| --------------- | --------------------     |
| **Nama**        | Muhamad Suryanegara      |
| **NIM**         | 312110447                |
| **Kelas**       | TI.21.A.1                |
| **Mata Kuliah** | Pemrograman Mobile 2     |

A new Flutter project.

# Tutorial
buka aplikasi `Visual Studio Code`  , kemudian buat project baru dengan mengklik `Ctrl + Shift + P`  
```

- Lalu, pada direktori lib > main.dart hapus semua kode, kemudian ubah dengan kode ini:

```dart
    import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<dynamic> stationData = [];

  Future<void> fetchStationData() async {
    var response = await http.get(Uri.parse('https://booking.kai.id/api/stations2'));
    if (response.statusCode == 200) {
      setState(() {
        List<dynamic> responseData = json.decode(response.body) as List<dynamic>;
        for (var station in responseData) {
          String code = station['code'];
          String cityname = station['cityname'];
          station['cityname'] = cityname;
          stationData.add({
            'code': code,
            'name': station['name'],
            'city': station['city'],
            'cityname': cityname,
          });
        }
      });
    } else {
      print('Failed to fetch data from API.');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchStationData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Nama-Nama Stasiun',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: ListView.builder(
          itemCount: stationData.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(stationData[index]['name']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Code: ${stationData[index]['code']}'),
                  Text('City: ${stationData[index]['city']}'),
                  Text('City Name: ${stationData[index]['cityname']}'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

```

- Kemudian, tambahkan `APIKEY` kalian dalam url.

```dart
       (Uri.parse('https://booking.kai.id/api/stations2'));
```

- Dan jangan lupa menambahkan Library http pada file `pubspec.yaml`.

```dart
dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.4
```

- Buka terminal, Kemudian run command `flutter run`.
- Maka hasilnya akan seperti ini :>

## Berikut adalah hasilnya

![image](https://github.com/Muhamadsuryanegara/UAS_P.Mobile.2/assets/92678339/79d60c31-97bb-442e-88ef-40a8efbace24)



- Kode diatas dapat kalian improvisasi dengan kreasi kalian sendiri.

## Terima Kasih!



