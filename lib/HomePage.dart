import 'dart:ui';
import 'package:OnlineCourseAppUI/courseDetails.dart';
import 'package:OnlineCourseAppUI/coursemodel.dart';
import 'package:OnlineCourseAppUI/question_screens/dsa.dart';
import 'package:OnlineCourseAppUI/style.dart';
import 'package:OnlineCourseAppUI/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: _height,
        width: _width,
        decoration: BoxDecoration(
          gradient: new LinearGradient(
            colors: [
              backgroundColor0,
              backgroundColor1,
              backgroundColor2,
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
              padding: EdgeInsets.only(
                left: 20,
                right: 15,
                top: 25,
                bottom: 15,
                //right: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          "CS & IT Interview Questions",
                          style: UserStyle,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => UserProfile(),
                            ),
                          );
                        },
                        child: Center(
                          child: Column(
                            children: [
                              CircleAvatar(
                                //backgroundColor: Colors.greenAccent[400],
                                backgroundImage: AssetImage(
                                  "assets/images/user.jpg",
                                ),
                                radius: 50,
                                //Text
                              ),
                              SizedBox(height: 7),
                              Text(
                                "My Profile",
                                style: TextStyle(
                                  color: Color.fromRGBO(28, 39, 74, 1),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  //FaIcon(FontAwesomeIcons.bars, size: 30),

                  /*
                  //search bar (non functional)
                  Container(
                    height: 60,
                    width: _width,
                    margin: EdgeInsets.only(
                      right: 30,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Search",
                          style: GoogleFonts.poppins(
                            color: Colors.grey.withOpacity(0.8),
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                          ),
                        ),
                        Spacer(),
                        FaIcon(FontAwesomeIcons.search),
                      ],
                    ),
                  ),*/

                  //tiles
                  /*
                  Container(
                    padding: EdgeInsets.only(right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /*
                        Text(
                          "Browse by Categories",
                          style: TopicStyle,
                        ),
                        */
                        
                      ],
                    ),
                  ),*/

                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        /*
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Chips(
                              topic: "Amazon",
                              isSelected: true,
                            ),
                            Chips(
                              topic: "Facebook",
                              isSelected: false,
                            ),
                            Chips(
                              topic: "Adobe",
                              isSelected: false,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Chips(
                              topic: "Apple",
                              isSelected: false,
                            ),
                            Chips(
                              topic: "Netflix",
                              isSelected: false,
                            ),
                            Chips(
                              topic: "many more+",
                              isSelected: false,
                            ),
                          ],
                        ),*/
                        SizedBox(height: 20),
                        Courses(course: courseList[0]),
                        SizedBox(height: 20),
                        Courses(course: courseList[1]),
                        SizedBox(height: 20),
                        Courses(course: courseList[2]),
                        SizedBox(height: 20),
                        Courses(course: courseList[3]),
                      ],
                    ),
                  ),
                  /*
                  Container(
                    //height: _height * 0.43,
                    height: _height,
                    width: _width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /*
                        Text(
                          "Popular",
                          style: TopicStyle,
                        ),*/
                        
                      ],
                    ),
                  )*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Courses extends StatelessWidget {
  final Course course;
  Courses({this.course});
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        print('pushing course page');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => CourseDetails(
              course: course,
            ),
          ),
        );
      },
      child: Row(
        children: [
          Container(
            height: _height * 0.17,
            width: _height * 0.17,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                image: AssetImage(course.courseImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    course.authorImage,
                    width: 40,
                    height: 40,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Interview Questions",
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]),
              SizedBox(height: 10),
              Container(
                width: _width * 0.5,
                child: Text(
                  course.courseName,
                  maxLines: 2,
                  style: GoogleFonts.poppins(
                    color: blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Chips extends StatelessWidget {
  final String topic;
  final bool isSelected;

  Chips({this.topic, this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: isSelected
            ? Colors.purple.withOpacity(0.1)
            : Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(100),
      ),
      alignment: Alignment.center,
      child: Text(
        topic,
        style: GoogleFonts.poppins(
          color: isSelected
              ? Colors.purple.withOpacity(0.7)
              : Colors.black.withOpacity(0.5),
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
    );
  }
}
