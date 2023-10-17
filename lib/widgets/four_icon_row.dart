import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            IconButton(
              icon: Icon(Icons.add, color: Color(0xffF5F5F1), size: 24,),
              onPressed: () {},
            ),
            Text(
              'My List',
              style: TextStyle(color: Color(0xffF5F5F1), fontSize: 10),
            ),
          ],
        ),
        Column(
          children: [
            IconButton(
              icon: Icon(Icons.thumb_up_alt_outlined, color: Color(0xffF5F5F1), size: 24,),
              onPressed: () {},
            ),
            Text(
              'Like',
              style: TextStyle(color: Color(0xffF5F5F1), fontSize: 10),
            ),
          ],
        ),
        Column(
          children: [
            IconButton(
              icon: Icon(Icons.share, color: Color(0xffF5F5F1), size: 24,),
              onPressed: () {},
            ),
            Text(
              'Share',
              style: TextStyle(color: Color(0xffF5F5F1), fontSize: 10),
            ),
          ],
        ),
        Column(
          children: [
            IconButton(
              icon: Icon(Icons.download, color: Color(0xffF5F5F1), size: 24,),
              onPressed: () {},
            ),
            Text(
              'Download',
              style: TextStyle(color: Color(0xffF5F5F1), fontSize: 10),
            ),
          ],
        ),
      ],
    );
  }
}
