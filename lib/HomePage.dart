import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperapp/Detail%20Screen.dart';
import 'package:wallpaperapp/UiHElper.dart';
import 'package:wallpaperapp/WallPaperScreen.dart';

import 'WallpaperModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController SearchController = TextEditingController();
  var Key = "lj7dBprYc9mt2psoxhXNyxMtIC2NgN3LpbpRZrFM2ZCt6HgIboD4tDyC";
  late Future<WallpaperModel> wallpaper;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    wallpaper = FetchData("Nature");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade50,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UiHelper().SearchBox(SearchController, () {

                wallpaper = FetchData(SearchController.text);
                Navigator.push(context, MaterialPageRoute(builder: (context) => WallPaperScreen(wallpaper: wallpaper),));

            }),
            SizedBox(
              height: 10,
            ),
            UiHelper().Heading("Best of the month"),


            //Best Of the Month wallpaper
            FutureBuilder(
              future: wallpaper,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: snapshot.data!.photos!.map((photo) {
                        return Card(
                          elevation: 5,
                          shadowColor: Colors.grey.shade50,
                          color: Colors.black,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  color: Colors.white, width:4)),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                        imageUrl:
                                            photo.src!.portrait.toString()),
                                  ));
                            },
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              height: 200,
                              width: 350,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12)),
                              child: Image.network(
                                photo.src!.landscape.toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.hasError}"),
                  );
                } else {
                  return Container();
                }
              },
            ),
            UiHelper().Heading("Category"),

            // CategryTiles....................................................
            Expanded(
                child: GridView.count(
                 crossAxisCount: 3,
                 children: [
                   UiHelper().CategoryTile("https://images.pexels.com/photos/11769989/pexels-photo-11769989.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", "Animal"),
                   UiHelper().CategoryTile("https://images.pexels.com/photos/919073/pexels-photo-919073.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", "car"),
                   UiHelper().CategoryTile("https://images.pexels.com/photos/323780/pexels-photo-323780.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", "House"),
                   UiHelper().CategoryTile("https://images.pexels.com/photos/190819/pexels-photo-190819.jpeg?auto=compress&cs=tinysrgb&w=600", "Watch"),
                   UiHelper().CategoryTile("https://images.pexels.com/photos/2531709/pexels-photo-2531709.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", "Sky"),
                   UiHelper().CategoryTile("https://images.pexels.com/photos/2098427/pexels-photo-2098427.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", "Night sky"),
                   UiHelper().CategoryTile("https://images.pexels.com/photos/36717/amazing-animal-beautiful-beautifull.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", "Sunset"),
                   UiHelper().CategoryTile("https://images.pexels.com/photos/1395958/pexels-photo-1395958.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", "Fruits"),
                   UiHelper().CategoryTile("https://images.pexels.com/photos/2245436/pexels-photo-2245436.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", "Travel   ")
                 ],
            ))
          ],
        ),
      ),
    );
  }

  Future<WallpaperModel> FetchData(String MySearch) async {
    var Url = "https://api.pexels.com/v1/search?query=$MySearch";
    var response =
        await http.get(Uri.parse(Url), headers: {'Authorization': '$Key'});
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return WallpaperModel.fromJson(data);
    } else {
      return WallpaperModel();
    }
  }
}
