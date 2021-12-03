import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:training_app/utils/colors.dart' as color;
import 'package:video_player/video_player.dart';

class VideoInfoPage extends StatefulWidget {
  const VideoInfoPage({Key? key}) : super(key: key);

  @override
  _VideoInfoPageState createState() => _VideoInfoPageState();
}

class _VideoInfoPageState extends State<VideoInfoPage> {
  List videoInfo = [];
  bool _playArea = false;
  bool _isPlaying = false;
  bool _isDisposed = false;
  int _isPlayingIndex = -1;
  Duration? _duration;
  Duration? _position;
  var _progress = 0.0;
  VideoPlayerController? _controller;
  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString('assets/json/videoinfo.json')
        .then((value) {
      setState(() {
        videoInfo = jsonDecode(value);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _isDisposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _playArea
            ? BoxDecoration(color: color.AppColor.gradientSecond)
            : BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.AppColor.gradientFirst.withOpacity(0.9),
                    color.AppColor.gradientSecond,
                  ],
                  begin: FractionalOffset(
                    0.0,
                    0.4,
                  ),
                  end: Alignment.topRight,
                ),
              ),
        child: Column(
          children: [
            _playArea
                ? Container(
                    child: Column(
                      children: [
                        Container(
                          height: 100.0,
                          padding: const EdgeInsets.only(
                            top: 50.0,
                            left: 30.0,
                            right: 30.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  print('pressed');
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 20.0,
                                  color: color.AppColor.secondPageIconColor,
                                ),
                              ),
                              Icon(
                                Icons.info_outline,
                                size: 20.0,
                                color: color.AppColor.secondPageIconColor,
                              ),
                            ],
                          ),
                        ),
                        _playView(context),
                        _controllView(context),
                      ],
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.only(
                      top: 70.0,
                      left: 30.0,
                      right: 30.0,
                    ),
                    height: 300.0,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20.0,
                                color: color.AppColor.secondPageIconColor,
                              ),
                            ),
                            Icon(
                              Icons.info_outline,
                              size: 20.0,
                              color: color.AppColor.secondPageIconColor,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          'Legs Tonning',
                          style: TextStyle(
                            fontSize: 25.0,
                            color: color.AppColor.secondPageTitleColor,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'and Glutes workout',
                          style: TextStyle(
                            fontSize: 25.0,
                            color: color.AppColor.secondPageTitleColor,
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 30.0,
                              width: 90.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    color.AppColor
                                        .secondPageContainerGradient1stColor,
                                    color.AppColor
                                        .secondPageContainerGradient2ndColor
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.timer,
                                    size: 20.0,
                                    color: color.AppColor.secondPageIconColor,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    '68 min',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color:
                                            color.AppColor.secondPageIconColor),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: Container(
                                height: 30.0,
                                width: 250.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      color.AppColor
                                          .secondPageContainerGradient1stColor,
                                      color.AppColor
                                          .secondPageContainerGradient2ndColor
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.handyman_outlined,
                                      size: 20.0,
                                      color: color.AppColor.secondPageIconColor,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      'Resistent band, Kettlebell',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: color
                                              .AppColor.secondPageIconColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70.0),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Circuit 1: Legs Tonning',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: color.AppColor.circuitsColor,
                          ),
                        ),
                        SizedBox(
                          width: 30.0,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.loop,
                              size: 30.0,
                              color: color.AppColor.loopColor,
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              '3 sets',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: color.AppColor.setsColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      child: _listView(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String convertTwo(int value) {
    return value < 10 ? '0$value' : '$value';
  }

  Widget _controllView(BuildContext context) {
    final noMute = (_controller?.value?.volume ?? 0) > 0;
    final duration = _duration?.inSeconds ?? 0;
    final head = _position?.inSeconds ?? 0;
    final remainingLength = max(0, duration - head);
    final mins = convertTwo(remainingLength ~/ 60.0);
    final secs = convertTwo(remainingLength % 60);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.red[700],
            inactiveTrackColor: Colors.red[100],
            trackShape: RoundedRectSliderTrackShape(),
            trackHeight: 2.0,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
            thumbColor: Colors.redAccent,
            overlayColor: Colors.red.withAlpha(32),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
            tickMarkShape: RoundSliderTickMarkShape(),
            activeTickMarkColor: Colors.red[700],
            inactiveTickMarkColor: Colors.red[100],
            valueIndicatorShape: PaddleSliderValueIndicatorShape(),
            valueIndicatorColor: Colors.redAccent,
            valueIndicatorTextStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          child: Slider(
            value: max(
              0,
              min(_progress * 100, 100),
            ),
            min: 0,
            max: 100,
            divisions: 100,
            label: _position?.toString().split(".")[0],
            onChanged: (value) {
              setState(() {
                _progress = value * 0.01;
              });
            },
            onChangeStart: (value) {
              _controller?.pause();
            },
            onChangeEnd: (value) {
              final duration = _controller?.value.duration;
              if (duration != null) {
                var newValue = max(0, min(value, 99)) * 0.01;
                var millis = (duration.inMilliseconds * newValue).toInt();
                _controller?.seekTo(Duration(milliseconds: millis));
                _controller?.play();
              }
            },
          ),
        ),
        Container(
          height: 40.0,
          width: MediaQuery.of(context).size.width,
          color: color.AppColor.gradientSecond,
          margin: const EdgeInsets.only(
            bottom: 5.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.0, 0.0),
                        blurRadius: 4.0,
                        color: Color.fromARGB(
                          50,
                          0,
                          0,
                          0,
                        ),
                      ),
                    ],
                  ),
                  child: Icon(
                    noMute ? Icons.volume_up : Icons.volume_off,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  if (noMute) {
                    _controller?.setVolume(0.0);
                  } else {
                    _controller?.setVolume(1.0);
                  }
                  setState(() {});
                },
              ),
              TextButton(
                onPressed: () async {
                  final index = _isPlayingIndex - 1;
                  if (index >= 0 && videoInfo.length >= 0) {
                    _onInitializeVideo(index);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: [
                            Icon(
                              Icons.face,
                              size: 20.0,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'You are watching first video!',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        backgroundColor: color.AppColor.gradientSecond,
                      ),
                    );
                  }
                },
                child: Icon(
                  Icons.fast_rewind,
                  size: 36.0,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () async {
                  if (_isPlaying) {
                    setState(() {
                      _isPlaying = false;
                    });
                    _controller?.pause();
                  } else {
                    setState(() {
                      _isPlaying = true;
                    });
                    _controller?.play();
                  }
                },
                child: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 36.0,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () async {
                  final index = _isPlayingIndex + 1;
                  if (index <= videoInfo.length - 1) {
                    _onInitializeVideo(index);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: [
                            Icon(
                              Icons.face,
                              size: 20.0,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'You have finished watching all the videos!!!',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        backgroundColor: color.AppColor.gradientSecond,
                      ),
                    );
                  }
                },
                child: Icon(
                  Icons.fast_forward,
                  size: 36.0,
                  color: Colors.white,
                ),
              ),
              Text(
                "$mins : $secs",
                style: TextStyle(color: Colors.white, shadows: <Shadow>[
                  Shadow(
                    offset: Offset(0.0, 0.1),
                    blurRadius: 4.0,
                    color: Color.fromARGB(150, 0, 0, 0),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      print('controller have value ');
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(
          child: Text(
            'Prepairing...',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white60,
            ),
          ),
        ),
      );
    }
  }

  _onInitializeVideo(int index) async {
    final controller = VideoPlayerController.network(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");
    final oldController = _controller;
    if (oldController != null) {
      oldController.removeListener(_onControllerUpdate);
      oldController.pause();
    }
    setState(() {});
    controller
      ..initialize().then((_) {
        oldController?.dispose();
        _isPlayingIndex = index;
        controller.addListener(_onControllerUpdate);
        controller.play();
        setState(() {});
      });
    _controller = controller;
  }

  _onTapVideo(int index) async {
    _onInitializeVideo(index);
  }

  var _onUpdateControllerTime;
  void _onControllerUpdate() async {
    if (_isDisposed) {
      return;
    }
    _onUpdateControllerTime = 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (_onUpdateControllerTime > now) {
      return;
    }
    _onUpdateControllerTime = now + 500;

    final controller = _controller;
    if (controller == null) {
      return;
    }
    if (!controller.value.isInitialized) {
      return;
    }

    if (_duration == null) {
      _duration = _controller?.value.duration;
    }
    var duration = _duration;
    if (duration == null) return;
    var position = await controller.position;
    _position = position;
    final isPlaying = controller.value.isPlaying;
    _isPlaying = isPlaying;
    if (isPlaying) {
      if (_isDisposed) return;
      setState(() {
        _progress = position!.inMilliseconds.ceilToDouble() /
            duration.inMilliseconds.ceilToDouble();
      });
    }
  }

  _listView() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 8.0,
      ),
      itemCount: videoInfo.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            _onTapVideo(index);
            setState(() {
              _playArea = _playArea ? false : true;
              print("play area" + _playArea.toString());
            });

            debugPrint(
              index.toString(),
            );
          },
          child: _buildCard(index),
        );
      },
    );
  }

  _buildCard(int index) {
    return Container(
      height: 135.0,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 80.0,
                width: 80.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage(
                      videoInfo[index]["thumbnail"],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoInfo[index]["title"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Text(
                      videoInfo[index]["time"],
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 18.0,
          ),
          Row(
            children: [
              Container(
                width: 80.0,
                height: 20.0,
                decoration: BoxDecoration(
                  color: Color(
                    0xffeaeefc,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    '15s rest',
                    style: TextStyle(
                      color: Color(
                        0xff839fed,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  for (int i = 0; i < 70; i++)
                    i.isEven
                        ? Container(
                            height: 1.0,
                            width: 3.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF839fed),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          )
                        : Container(
                            height: 1.0,
                            width: 3.0,
                            color: Colors.white,
                          ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
