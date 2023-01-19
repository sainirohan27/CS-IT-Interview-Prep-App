import 'package:OnlineCourseAppUI/HomePage.dart';
import 'package:OnlineCourseAppUI/coursemodel.dart';
import 'package:OnlineCourseAppUI/question_screens/dsa.dart';
import 'package:OnlineCourseAppUI/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:OnlineCourseAppUI/question_screens/dsa.dart';
import 'package:OnlineCourseAppUI/question_screens/os.dart';
import 'package:OnlineCourseAppUI/question_screens/dbms.dart';
import 'package:OnlineCourseAppUI/question_screens/oops.dart';
import 'package:OnlineCourseAppUI/question_screens/dsa progress.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CourseDetails extends StatefulWidget {
  final Course course;
  dsa dsa_ob;
  double ans;

  CourseDetails({this.course, this.dsa_ob});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  double ans;
  String line;

  @override
  void initState() {
    setState(() {
      ans = getprogress();
      print('state set');
    });

    if (widget.course.courseTag == 'DSA') ans = getprogress();
    if (widget.course.courseTag == 'OS') ans = getprogress2();
    if (widget.course.courseTag == 'DBMS') ans = getprogress3();
    if (widget.course.courseTag == 'OOPS') ans = getprogress4();
  }

  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return new Scaffold(
      body: Container(
        height: _height,
        width: _width,
        child: Stack(
          children: [
            Container(
              height: _height * 0.4,
              width: _width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    widget.course.courseImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: _height * 0.7,
                width: _width,
                padding: EdgeInsets.only(
                  left: 20,
                  top: 20,
                  right: 20,
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Chips(
                          topic: widget.course.courseTag,
                          isSelected: true,
                        ),
                        SizedBox(width: 20),
                        Chips(
                          topic: "Coding",
                          isSelected: true,
                        ),
                        Spacer(),
                      ],
                    ),
                    Text(
                      widget.course.courseName,
                      style: UserStyle,
                    ),
                    //SizedBox(height: _height * 0.05),
                    Text(
                      widget.course.courseDetails,
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                    /*
                      LinearPercentIndicator(
                        animation: true,
                        animateFromLastPercent: true,
                        lineHeight: 15.0,
                        animationDuration: 500,
                        percent: ans,
                        //linearGradient: LinearGradient(),
                        //percent: getDoubleValuesSF(),
                        //percent: returndouble(),
                        center: Text(
                          (ans * 100).toString() + '%',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        backgroundColor: Colors.grey.withOpacity(0.5),
                        progressColor: widget.course.pageColor,
                      ),
                      Center(
                        child: Text(
                          'My ' + widget.course.courseTag + ' Progress',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                      */
                    SizedBox(height: _height * 0.03),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(10),
                      height: _height * 0.2,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(
                            color: widget.course
                                .pageColor, //Color.fromRGBO(0, 160, 227, 1),
                          ),
                        ),
                        onPressed: () {
                          print('button pressed');
                          print(widget.course.pageColor);
                          if (widget.course.courseName ==
                              'Data Structures and Algorithms')
                            Navigator.pushReplacement(
                              //changed
                              context,
                              MaterialPageRoute(builder: (context) => dsa()),
                            );
                          if (widget.course.courseName ==
                              "Operating Systems (OS)")
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => os()),
                            );
                          if (widget.course.courseName ==
                              'Database Management Systems')
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => dbms()),
                            );
                          if (widget.course.courseName ==
                              'Object Oriented Progamming')
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => oops()),
                            );
                        },
                        padding: EdgeInsets.all(10.0),
                        color: widget
                            .course.pageColor, //Color.fromRGBO(0, 160, 227, 1),
                        textColor: Colors.white,
                        /*
                          child: Text("See Questions",
                              style: TextStyle(fontSize: 20)),
                             */
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              //color: Colors.pink,
                              //padding: EdgeInsets.fromLTRB(10, 4, 4, 4),
                              child: Text(
                                'Learn Questions',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                              child: Icon(
                                Icons.forward,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
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
}

class CourseDescription extends StatelessWidget {
  final String title, subtitle;
  CourseDescription({this.title, this.subtitle});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.poppins(
          color: Colors.grey,
          fontSize: 22,
        ),
      ),
      trailing: Text(
        subtitle,
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 22,
        ),
      ),
    );
  }
}
/*
class ProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Container(
      height: _height * 0.3,
      width: _width,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: partColor0,
      ),
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: Container(
          height: _height * 0.1,
          width: _width,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: partColor1,
          ),
          child: FractionallySizedBox(
            widthFactor: 0.7,
            child: Container(
              height: _height * 0.1,
              width: _width,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: partColor2,
              ),
              child: FractionallySizedBox(
                widthFactor: 0.7,
                child: Container(
                  height: _height * 0.1,
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