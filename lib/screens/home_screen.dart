import 'package:flutter/material.dart';
import 'package:test_3d/widgets/views/home/input_tap_view.dart';
import 'package:test_3d/widgets/views/home/solution_tap_view.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          title: Text(
            'Isolated Footing',
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            )
          ],
          bottom: TabBar(
            tabs: [
              Tab(child: Text("Input")),
              Tab(
                child: Text("Solution"),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            InputTapView(),
            SolutionTapView(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {},
        ),
      ),
    );
  }
}
