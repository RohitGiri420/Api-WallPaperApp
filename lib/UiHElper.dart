import 'dart:ui';

import 'package:flutter/material.dart';

class UiHelper{

  SearchBox(TextEditingController controller,VoidCallback onPressed){
    return Card(

      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.white)
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: IconButton(onPressed:
            onPressed,
            icon: Icon(Icons.search_rounded,color:Colors.black38,),),
          hintText: "Find Wallpaper",
          hintStyle: TextStyle(color: Colors.black38),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black38),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black38),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Heading(String text){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(text,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.black54),),
    );
  }


  CategoryTile(String Url, String text){
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 5,
        shadowColor: Colors.black,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: BorderSide(width: 3,color: Colors.white)),
        child: Stack(
          children: [

            // BackGround Image Container
            Container(
              clipBehavior: Clip.antiAlias,
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey.shade50,borderRadius: BorderRadius.circular(8)),
              child: Image.network("$Url",fit: BoxFit.fill,),
            ),

            //Filter and Text Container
            Container(
              clipBehavior: Clip.antiAlias,
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: ClipRect(
                child: BackdropFilter(filter: ImageFilter.blur(sigmaY: 2.0,sigmaX: 2.0),child: Center(
                    child: Text("$text",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),)),),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

