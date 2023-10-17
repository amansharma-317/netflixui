import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_ui/models/episode_model.dart';
import 'package:netflix_ui/widgets/four_icon_row.dart';
import 'package:netflix_ui/widgets/grid_view_file.dart';
import 'package:netflix_ui/widgets/list_view_file.dart';
import 'package:video_player/video_player.dart';

import '../models/selected_show.dart';

class EpisodesScreen extends StatefulWidget {
  final String title;
  final String description;
  final int numberOfEpisodes;
  final List<Episode> episodes;
  //number, title, desc, dateOfRelease, duration;
  EpisodesScreen({Key? key,required this.title,
    required this.description,
    required this.numberOfEpisodes,
    required this.episodes}) : super(key: key);

  @override
  State<EpisodesScreen> createState() => _EpisodesScreenState();
}

class _EpisodesScreenState extends State<EpisodesScreen>  with TickerProviderStateMixin{
  late VideoPlayerController _controller;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/ForBiggerBlazes.mp4')
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      }).catchError((onError){
      print(onError.toString());
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff141414),
        appBar: AppBar(
            backgroundColor: Color(0xff141414),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Color(0xffF5F5F1),),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.search, color: Color(0xffF5F5F1),),
                onPressed: () {
                  // Add search logic here
                },
              ),
            ],
          ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _controller.value.isInitialized
                      ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        VideoPlayer(_controller),
                        _PlayPauseOverlay(controller: _controller),
                        VideoProgressIndicator(_controller, allowScrubbing: true),
                      ],
                    ),
                  )
                      : CircularProgressIndicator(),

                  //title
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.title,
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          color: Color(0xffF5F5F1)
                        ),
                      ),
                    ),
                  ),

                  //row below title
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          '2022',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
                                letterSpacing: 1,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 2),
                        child: Icon(Icons.text_format_rounded, color:  Colors.grey,)
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          '6 Seasons',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
                                letterSpacing: 1,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          child: Icon(Icons.hd_outlined, color:  Colors.grey,)
                      ),
                      Container(
                          child: Icon(Icons.subtitles, color:  Colors.grey,)
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'New episode coming on Monday',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            color: Color(0xffF5F5F1)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      onPressed: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.play_arrow, color: Color(0xff141414),),
                          Text('Play', style: TextStyle(color: Color(0xff141414), fontSize: 16),),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffF5F5F1),
                        fixedSize: Size(double.maxFinite,height*0.06),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 4,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      onPressed: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.download, color: Color(0xffF5F5F1),),
                          Text('Download S6:E1', style: TextStyle(color: Color(0xffF5F5F1), fontSize: 16),),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff272829),
                        fixedSize: Size(double.maxFinite,height*0.06),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'S6:E1 \"Solaricks\"',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            color: Color(0xffF5F5F1)
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 8,),
                  Container(
                    margin: EdgeInsets.only(left: 12, right: width*0.15),
                    child: Text(
                      widget.description,
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 11.0,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 1,
                            color: Color(0xffF5F5F1)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8,),
                  Container(
                    //padding: EdgeInsets.only(left: 12, right: width*0.15),
                    child: ExpansionTile(
                      title: Text(
                        !isExpanded ? 'Starring: Justin Rolland, Chris Parnell...more' : 'Starring:',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 11.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            color: Color(0xffF5F5F1),
                          ),
                        ),
                      ),
                      trailing: isExpanded ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text('Less', style: TextStyle(color: Color(0xffF5F5F1))),
                      ) : Text('More', style: TextStyle(color: Color(0xF5F5F1))),
                      onExpansionChanged: (expanded) {
                        setState(() {
                          isExpanded = expanded;
                        });
                      },
                      children: [
                        Text(
                          'Justin Rolland, Chris Parnell, Spencer Grammer, daii, dsjasj,fa',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.normal,
                              letterSpacing: 1,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ),

                  SizedBox(height: 4,),
                  Container(
                    padding: EdgeInsets.only(left: 12, right: width*0.15),
                    child: Row(
                      children: [
                        Text(
                          'Creators: ',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontSize: 11.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                color: Color(0xffF5F5F1)
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Dan Harmon, Justin Rolland',
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
                        ),
                      ],
                    ),
                  ),


                  SizedBox(height: 8,),

                  ButtonRow(),

                  SizedBox(height: 12,),

                  //tab-icons /////////////
                  Container(
                    width: double.maxFinite,
                    child: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      indicator: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Color(0xffE50914), width: 3.0),
                        ),
                      ),
                      labelColor: Color(0xffF5F5F1),
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Color(0xffE50914),
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: [
                        Container(
                          width: width*0.2,
                          child: Tab(
                            child: Text('Episodes', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xffF5F5F1))),
                          ),
                        ),
                        Container(
                          child: Tab(
                            child: Text('More Like This', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xffF5F5F1))),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //tab-bar views //////////

                  Container(
                    padding: EdgeInsets.only(left: 12, right: 12),
                    width: constraints.maxHeight,
                    height: 500,
                    //height: height*0.5,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        MyListView(episodes: episodes),
                        MyGridView(selectedShows: selectedShows),
                    ],
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}

/////////////
class _PlayPauseOverlay extends StatefulWidget {
  final VideoPlayerController controller;

  const _PlayPauseOverlay({required this.controller});

  @override
  _PlayPauseOverlayState createState() => _PlayPauseOverlayState();
}

class _PlayPauseOverlayState extends State<_PlayPauseOverlay> {
  late bool _isMuted;

  @override
  void initState() {
    super.initState();
    _isMuted = widget.controller.value.volume == 0;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: widget.controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
            color: Colors.black26,
            child: Center(
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 100.0,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              if (widget.controller.value.isPlaying) {
                widget.controller.pause();
              } else {
                widget.controller.play();
              }
            });
          },
        ),
        Positioned(
          top: 10.0,
          right: 10.0,
          child: IconButton(
            icon: _isMuted ? Icon(Icons.volume_off) : Icon(Icons.volume_up),
            onPressed: () {
              setState(() {
                _isMuted = !_isMuted;
                widget.controller.setVolume(_isMuted ? 0 : 1.0);
              });
            },
          ),
        ),
      ],
    );
  }
}










