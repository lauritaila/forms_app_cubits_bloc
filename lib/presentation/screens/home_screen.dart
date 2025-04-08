import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: Text("Cubits"),
            subtitle: Text("Simple state management tool."),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: (){context.push("/cubits");},
          ),
          ListTile(
            title: Text("Bloc"),
            subtitle: Text("Complex state management tool."),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: (){context.push("/bloc");},
          ),
        ],
      ),
    );
  }
}