import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  ListViewPage({super.key});

  final List<Products> list = [
    Products(name: 'John Doe', color: Colors.amber),
    Products(name: 'Anne Tue', color: Colors.blue),
    Products(name: 'Robert Mow', color: Colors.red),
    Products(name: 'Johny Toe', color: Colors.green),
    Products(name: 'Leo Car', color: Colors.purple),
    Products(name: 'Paul Num', color: Colors.grey),
  ];

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Colors.deepPurple,
  //     ),
  //     body: ListView.builder(
  //       itemCount: list.length,
  //       itemBuilder: (context, index) => Container(
  //         height: 200,
  //         color: list[index].color,
  //         child: Center(
  //           child: Text(list[index].name),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ListView Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: list.length,
        itemBuilder: (context, index) => Container(
          height: 200,
          color: list[index].color,
          child: Center(
            child: Text(list[index].name),
          ),
        ),
      ),
    );
  }
}

class Products {
  final String name;
  final Color color;

  Products({required this.name, required this.color});
}
