import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String imageUrl;
  DetailScreen({super.key,required this.imageUrl});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 12,left: 12,right: 12),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(

          ),
          child: Image.network(widget.imageUrl,fit: BoxFit.cover,),
        ),
      ),
    );
  }
}
