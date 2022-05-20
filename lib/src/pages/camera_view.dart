import 'dart:io';

import 'package:flutter/material.dart';

class CameraView extends StatelessWidget {
  const CameraView(this.path);
  final path;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: const Icon(
          Icons.close_sharp,
          color: Colors.white,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.crop,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.emoji_emotions_outlined)),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.title,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              )),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              child: Image.file(
                File(path),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                child: TextFormField(
                  maxLength: 6,
                  minLines: 1,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.add_photo_alternate),
                      hintText: 'Add a caption...',
                      suffixIcon: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                          child: Icon(
                        Icons.check,
                        color: Colors.white,
                      )),
                      hintStyle: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
