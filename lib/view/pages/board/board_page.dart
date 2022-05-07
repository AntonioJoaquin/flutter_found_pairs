import 'package:flutter/material.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.red,
        ),
        title: const Text('Board Page'),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .1),
          SizedBox(
            height: 104 * 6,
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
              itemCount: 24,
              itemBuilder: (_, index) => Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
