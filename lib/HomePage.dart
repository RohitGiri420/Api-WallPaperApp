import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var Url = "https://api.pexels.com/v1/search?query=nature&per_page=1";
  var Key = "lj7dBprYc9mt2psoxhXNyxMtIC2NgN3LpbpRZrFM2ZCt6HgIboD4tDyC";

  Future

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("wallpaper"),
        centerTitle: true,
      ),
    );
  }
}
