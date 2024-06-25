# flutter_application_12

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Mapping List

mapping adalah teknik memetakan sebuah data ke dalam sebuah list. pada flutter mapping list digunakan dalam pembuatan widget berulang agar memakai data dari sebuah list. mapping sendiri hanya bisa dilakukan pada widget yang memiliki childern atau list view builder yang mengembalikan widget dengan jumlah yang banyak sekaligus.

- contoh list map
```dart
final faker = Faker();
  late final List<Map<String, dynamic>> myList;
  MyApp({super.key}) {
    myList = List.generate(
        10,
        (_) => {
              "name": faker.person.name(),
              "age": faker.randomGenerator.integer(40, min: 20),
              "favorite_color": [
                "black",
                "white",
                "red",
                "green",
                "blue",
                "black",
                "white",
                "red",
                "green",
                "blue"
              ],
              "image":
                  "https://picsum.photos/id/${faker.randomGenerator.integer(100)}/200/300",
            });
  }
```

khusus pada map yang berupa sebuah List kita harus melakukan extract method list yang akan kita gunakan untuk melakukan sebuah mapping dari data list sebelumnya contoh pada favorite_color merupakan List<String> yang harus kita mapping kembali.

```dart
(data['favorite_color'] as List<String>)
                            .map((color) {
                          return Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            color: Colors.amber,
                            child: Text(color),
                          );
                        }).toList()
```

mapping sendiri sangat berguna jika kita mempunyai dari lebih dari satu bahkan banyak agar tidak melakukan perulangan secara manual atau membuat wiget secara berulang cukup dengan metop map().toList() maka widget akan dibuat sesuai dengan banyaknya data yang akan di mapping.

```dart
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final faker = Faker();
  late final List<Map<String, dynamic>> myList;
  MyApp({super.key}) {
    myList = List.generate(
        10,
        (_) => {
              "name": faker.person.name(),
              "age": faker.randomGenerator.integer(40, min: 20),
              "favorite_color": [
                "black",
                "white",
                "red",
                "green",
                "blue",
                "black",
                "white",
                "red",
                "green",
                "blue"
              ],
              "image":
                  "https://picsum.photos/id/${faker.randomGenerator.integer(100)}/200/300",
            });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Mapping List',
          ),
        ),
        body: ListView(
            children: myList.map((data) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // row
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(data['image']),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name: ${data['name']}"),
                            Text("Age: ${data['age']}"),
                          ],
                        )
                      ],
                    ),

                    // favorite color
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: (data['favorite_color'] as List<String>)
                            .map((color) {
                          return Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            color: Colors.amber,
                            child: Text(color),
                          );
                        }).toList(),
                      ),
                    ),
                  ]),
            ),
          );
        }).toList()),
      ),
    );
  }
}
```
![code-snapshot](https://github.com/appworkspaceRM/mapping-list/assets/135511281/3d29464d-3216-49bc-94c5-44f9427beb0a)

