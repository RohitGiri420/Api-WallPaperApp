import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'WallpaperModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  var Key = "lj7dBprYc9mt2psoxhXNyxMtIC2NgN3LpbpRZrFM2ZCt6HgIboD4tDyC";
    late Future<WallpaperModel> wallpaper;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    wallpaper = FetchData("home");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("wallpaper"),
        centerTitle: true,
      ),
    );
  }

  Future<WallpaperModel>FetchData(String MySearch) async {
    var Url = "https://api.pexels.com/v1/search?query=$MySearch";
    var response = await http.get(Uri.parse(Url),headers: {'Authorization' : '$Key'});
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      return WallpaperModel.fromJson(data);
    }
    else{
      return WallpaperModel();
    }
  }

}



