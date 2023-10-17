import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/episode_model.dart';

class MyListView extends StatelessWidget {
  final List<Episode> episodes;

  MyListView({required this.episodes});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: episodes.length,
        itemBuilder: (BuildContext context, int index) {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Image.network('https://cdn.vox-cdn.com/thumbor/ChC3ttDapb0tvkD4uoxMi9f67N4=/0x0:1584x891/920x613/filters:focal(841x310:1093x562):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/71950445/rick_and_morty_s4_image.0.png',
                          fit: BoxFit.fill,),
                      ),
                      SizedBox(width: 12,),
                      Expanded(
                        flex: 6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text((index+1).toString() + '. ' + episodes[index].title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Color(0xffF5F5F1)),),
                            Text(episodes[index].duration, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey))
                          ],
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        flex: 1,
                        child: Icon(Icons.file_download_outlined, color: Color(0xffF5F5F1),),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    episodes[index].description,
                    maxLines: 4,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 11.0,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 1,
                          color: Colors.grey
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
