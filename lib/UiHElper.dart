import 'package:flutter/material.dart';

class UiHelper{

  SearchBox(TextEditingController controller,VoidCallback onPressed){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(

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
      ),
    );
  }
}