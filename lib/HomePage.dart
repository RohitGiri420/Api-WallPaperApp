import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperapp/Detail%20Screen.dart';
import 'package:wallpaperapp/UiHElper.dart';

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
          children: [
            UiHelper().SearchBox(SearchController,(){

              setState(() {
                wallpaper = FetchData(SearchController.text);
              });
            }),
            SizedBox(height: 10,),
            FutureBuilder(future: wallpaper, builder: (context, snapshot) {
              if(snapshot.hasData){
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: snapshot.data!.photos!.map((photo){
                      return Card(
                        elevation: 2,
                        shadowColor: Colors.blueGrey,
                        color: Colors.black38,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.black38,width: 0.2)
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(imageUrl: photo.src!.portrait.toString()),));
                          },
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: 200,
                            width: 340,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: Image.network(photo.src!.landscape.toString(),fit: BoxFit.cover,),
                          ),
                        ),
                      );
                  }).toList(),),
                );
              }

              else if (snapshot.hasError){
                return Center(child:  Text("${snapshot.hasError}"),);
              }
              else{
                return Container();
              }
            },),
          ],
        ),
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



