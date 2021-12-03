import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:training_app/pages/video_info_page.dart';
import 'package:training_app/utils/colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString('assets/json/info.json')
        .then((value) {
      setState(() {
        info = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      // backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(
          top: 70.0,
          left: 30.0,
          right: 30.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Training',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: color.AppColor.homePageTitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: color.AppColor.homePageIcons,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 20,
                      color: color.AppColor.homePageIcons,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: color.AppColor.homePageIcons,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Training",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: color.AppColor.homePageSubTitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Details',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: color.AppColor.homePageDetail,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideoInfoPage(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: color.AppColor.homePageIcons,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.AppColor.gradientFirst.withOpacity(0.9),
                    color.AppColor.gradientSecond.withOpacity(0.8),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                  topRight: Radius.circular(80.0),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(5.0, 10.0),
                    blurRadius: 20.0,
                    color: color.AppColor.gradientSecond.withOpacity(0.2),
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  top: 25.0,
                  right: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Next workout',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Legs Tonning',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'and Glutes workout',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              size: 20.0,
                              color: color.AppColor.homePageContainerTextSmall,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              '60 mins',
                              style: TextStyle(
                                fontSize: 14.0,
                                color:
                                    color.AppColor.homePageContainerTextSmall,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60.0),
                            boxShadow: [
                              BoxShadow(
                                color: color.AppColor.gradientFirst,
                                blurRadius: 10.0,
                                offset: Offset(4.0, 8.0),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.play_circle_fill,
                            color: Colors.white,
                            size: 60.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 180.0,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 120.0,
                    margin: EdgeInsets.only(
                      top: 30.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/card.jpg'),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 40.0,
                          offset: Offset(
                            8.0,
                            10.0,
                          ),
                          color: color.AppColor.gradientSecond.withOpacity(
                            0.3,
                          ),
                        ),
                        BoxShadow(
                          blurRadius: 10.0,
                          offset: Offset(-1, -5),
                          color: color.AppColor.gradientSecond.withOpacity(
                            0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200.0,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                      right: 180.0,
                      bottom: 30.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/figure.png',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 100.0,
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(
                      left: 150.0,
                      top: 50.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'You are doing great',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: color.AppColor.homePageDetail,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Keep it up\n',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: color.AppColor.homePagePlainColor,
                            ),
                            children: [
                              TextSpan(
                                text: 'stick to your plan',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  'Area of focus!',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: color.AppColor.homePageTitle,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Expanded(
              child: OverflowBox(
                maxWidth: MediaQuery.of(context).size.width,
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                    itemCount: (info.length.toDouble() / 2).toInt(),
                    itemBuilder: (context, index) {
                      int a = 2 * index;
                      int b = 2 * index + 1;
                      return Row(
                        children: [
                          Container(
                            height: 170.0,
                            width: (MediaQuery.of(context).size.width - 90) / 2,
                            margin: const EdgeInsets.only(
                              left: 30.0,
                              bottom: 15.0,
                              top: 15.0,
                            ),
                            padding: const EdgeInsets.only(
                              bottom: 5.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                15.0,
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  info[a]['img'],
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(
                                    5,
                                    5,
                                  ),
                                  color:
                                      color.AppColor.gradientSecond.withOpacity(
                                    0.1,
                                  ),
                                ),
                                BoxShadow(
                                  offset: Offset(
                                    -5,
                                    -5,
                                  ),
                                  color:
                                      color.AppColor.gradientSecond.withOpacity(
                                    0.1,
                                  ),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[a]['title'],
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: color.AppColor.homePageDetail,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 170.0,
                            width: (MediaQuery.of(context).size.width - 90) / 2,
                            margin: const EdgeInsets.only(
                              left: 30.0,
                              bottom: 15.0,
                              top: 15.0,
                            ),
                            padding: const EdgeInsets.only(
                              bottom: 5.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                15.0,
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  info[b]['img'],
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(
                                    5,
                                    5,
                                  ),
                                  color:
                                      color.AppColor.gradientSecond.withOpacity(
                                    0.1,
                                  ),
                                ),
                                BoxShadow(
                                  offset: Offset(
                                    -5,
                                    -5,
                                  ),
                                  color:
                                      color.AppColor.gradientSecond.withOpacity(
                                    0.1,
                                  ),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[b]['title'],
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: color.AppColor.homePageDetail,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
