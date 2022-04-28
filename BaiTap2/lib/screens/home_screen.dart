import 'package:flutter/material.dart';

import '../widgets/movie_list_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Popular',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        //color: Colors.red,
        child: Column(
          children: [
            const SizedBox(height: 4),
            Expanded(child: MovieList(),),

          ],
        ),
      ),
    );
  }
}
