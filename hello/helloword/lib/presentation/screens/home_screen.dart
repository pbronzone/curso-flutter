import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const name = 'homeScreen';
  final String username;
  HomeScreen({super.key, required this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Screen',
        ),
      ),
      body: _HomeView(
        username: widget.username,
      ),
    );
  }
}

class _HomeView extends StatefulWidget {
  final String username;
  _HomeView({super.key, required this.username});

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Bienvenido ${widget.username}'),
    );
  }
}
