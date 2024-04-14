import 'package:flutter/material.dart';
import 'package:wallpaperapp/WallpaperModel.dart';

import 'Detail Screen.dart';

class WallPaperScreen extends StatefulWidget {

   Future<WallpaperModel> wallpaper;
  WallPaperScreen({super.key,required this.wallpaper});

  @override
  State<WallPaperScreen> createState() => _WallPaperScreenState();
}

class _WallPaperScreenState extends State<WallPaperScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: FutureBuilder(future: widget.wallpaper, builder: (context, snapshot) {
        return SingleChildScrollView(
          child: Center(
            child: Column(

              children:(snapshot.data != null && snapshot.data!.photos != null) ? snapshot.data!.photos!.map((photo) {
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
              }).toList():  [Container()]
            ),
          ),
        );
      },),
    );
  }

}
