import 'dart:ui';
import 'package:OnlineCourseAppUI/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:OnlineCourseAppUI/question_screens/dsa.dart';
import 'package:OnlineCourseAppUI/question_screens/os.dart';
import 'package:OnlineCourseAppUI/question_screens/dbms.dart';
import 'package:OnlineCourseAppUI/question_screens/oops.dart';

class UserProfile extends StatefulWidget {
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  double data = getprogress();
  _launchURL1() async {
    print('inside function');
    const url =
        'https://play.google.com/store/apps/details?id=com.codelibrary.dsa';
    if (await canLaunch(url)) {
      print('launching now');
      await launch(url);
    } else {
      print('cant launch url');
      throw 'Could not launch $url';
    }
  }
  //https://play.google.com/store/apps/details?id=com.codelibrary.oops_preparation

  _launchURL2() async {
    print('inside second function');
    const url = 'https://play.google.com/store/apps/dev?id=5030189643631776316';
    if (await canLaunch(url)) {
      print('launching now');
      await launch(url);
    } else {
      print('cant launch url');
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height * 1.9;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: _width,
              decoration: BoxDecoration(
                gradient: new LinearGradient(
                  colors: [
                    backgroundColor1,
                    backgroundColor0,
                    backgroundColor0,
                    backgroundColor1,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: SafeArea(
                  child: Container(
                    width: _width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 10,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              Container(
                                height: _height * 0.12,
                                width: _height * 0.12,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: userShadow,
                                      offset: Offset(4, 10),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(
                                    "assets/images/user.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Mr. Developer",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: _height * 0.07,
                          width: _width,
                          margin: EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white.withOpacity(0.3),
                          ),
                          child: ListTile(
                            leading: SvgPicture.asset(
                              "assets/images/medal.svg",
                              width: 40,
                              height: 40,
                            ),
                            title: Text(
                              "Premium Member",
                              style: UserTopicStyle,
                            ),
                            subtitle: Text(
                              "Member since app install",
                              style: UserSubtitleStyle,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        /*
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          //height: _height * 0.28,
                          width: _width,
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white.withOpacity(0.3),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Learned Core Subjects",
                                style: UserTopicStyle,
                              ),
                              SizedBox(height: 15),
                              LinearPercentIndicator(
                                animation: true,
                                animateFromLastPercent: true,
                                lineHeight: 15.0,
                                animationDuration: 1000,
                                percent: getprogress(), //0.8,
                                //linearGradient: LinearGradient(),
                                //percent: getDoubleValuesSF(),
                                //percent: returndouble(),
                                center: Text(
                                  (getprogress() * 100).toString() + '%',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                backgroundColor: Colors.grey.withOpacity(0.5),
                                progressColor: Color.fromRGBO(218, 138, 255, 1),
                              ),
                              Center(
                                child: Text(
                                  "Data Structure & Algorithms",
                                  style: UserSubtitleStyle,
                                ),
                              ),
                              SizedBox(height: 15),
                              LinearPercentIndicator(
                                animation: true,
                                animateFromLastPercent: true,
                                lineHeight: 15.0,
                                animationDuration: 1000,
                                percent: getprogress2(), //0.8,
                                //linearGradient: LinearGradient(),
                                //percent: getDoubleValuesSF(),
                                //percent: returndouble(),
                                center: Text(
                                  (getprogress2() * 100).toString() + '%',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                backgroundColor: Colors.grey.withOpacity(0.5),
                                progressColor: Color.fromRGBO(255, 120, 169, 1),
                              ),
                              Center(
                                child: Text(
                                  "Operating Systems",
                                  style: UserSubtitleStyle,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              LinearPercentIndicator(
                                animation: true,
                                animateFromLastPercent: true,
                                lineHeight: 15.0,
                                animationDuration: 1000,
                                percent: getprogress3(), //0.8,
                                //linearGradient: LinearGradient(),
                                //percent: getDoubleValuesSF(),
                                //percent: returndouble(),
                                center: Text(
                                  (getprogress3() * 100).toString() + '%',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                backgroundColor: Colors.grey.withOpacity(0.5),
                                progressColor: Color.fromRGBO(255, 185, 135, 1),
                              ),
                              Center(
                                child: Text(
                                  "DBMS",
                                  style: UserSubtitleStyle,
                                ),
                              ),
                              SizedBox(height: 15),
                              LinearPercentIndicator(
                                animation: true,
                                animateFromLastPercent: true,
                                lineHeight: 15.0,
                                animationDuration: 1000,
                                percent: getprogress4(), //0.8,
                                //linearGradient: LinearGradient(),
                                //percent: getDoubleValuesSF(),
                                //percent: returndouble(),
                                center: Text(
                                  (getprogress4() * 100).toString() + '%',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                backgroundColor: Colors.grey.withOpacity(0.5),
                                progressColor: Color.fromRGBO(137, 207, 240, 1),
                              ),
                              Center(
                                child: Text(
                                  "OOPS",
                                  style: UserSubtitleStyle,
                                ),
                              ),
                              //SizedBox(height: 10),
                              //ProgressBar(),
                              /*
                              Container(
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: FaIcon(
                                        FontAwesomeIcons.circleNotch,
                                        color: partColor1,
                                      ),
                                      title: Text(
                                        "Algorithms",
                                        style: UserSubtitleStyle,
                                      ),
                                    ),
                                    ListTile(
                                      leading: FaIcon(
                                        FontAwesomeIcons.circleNotch,
                                        color: partColor2,
                                      ),
                                      title: Text(
                                        "DBMS",
                                        style: UserSubtitleStyle,
                                      ),
                                    ),
                                    ListTile(
                                      leading: FaIcon(
                                        FontAwesomeIcons.circleNotch,
                                        color: partColor2,
                                      ),
                                      title: Text(
                                        "Operating Systems",
                                        style: UserSubtitleStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              )*/
                            ],
                          ),
                        ),*/
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            _launchURL1(); //change after publishing
                            print('share pressed');
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 30,
                            ),
                            //height: _height * 0.28,
                            width: _width,
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white.withOpacity(0.3),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                new Container(
                                  width: _width,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.share_rounded,
                                              color: Colors.lightBlue),
                                          SizedBox(width: 15),
                                          Text(
                                            'Share with your friends',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20,
                                              color: blackColor,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            _launchURL2();
                            print('share pressed');
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 30,
                            ),
                            width: _width,
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white.withOpacity(0.3),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                new Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.android_rounded,
                                            color: Colors.green,
                                          ),
                                          SizedBox(width: 15),
                                          Text(
                                            'More Apps from Us',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20,
                                              color: blackColor,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            _launchURL1();
                            print('share pressed');
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 30,
                            ),
                            //height: _height * 0.28,
                            width: _width,
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white.withOpacity(0.3),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                new Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow[700],
                                          ),
                                          SizedBox(width: 15),
                                          Text(
                                            'Rate Us', //change after publishing
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20,
                                              color: blackColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
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

/*
class ProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      height: 15,
      width: _width,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: partColor0,
      ),
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: Container(
          height: 15,
          width: _width,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: partColor1,
          ),
          child: FractionallySizedBox(
            widthFactor: 0.7,
            child: Container(
              height: 15,
              width: _width,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: partColor2,
              ),
              child: FractionallySizedBox(
                widthFactor: 0.7,
                child: Container(
                  height: 15,
                  width: _width,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: partColor3,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/