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
