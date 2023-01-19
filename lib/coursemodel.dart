import 'package:flutter/cupertino.dart';

class Course {
  String courseName,
      courseAuthor,
      courseImage,
      authorImage,
      courseTag,
      courseDetails,
      noOfLectures,
      language,
      progress_line;
  Color pageColor;

  Course({
    this.courseName,
    this.courseAuthor,
    this.courseImage,
    this.authorImage,
    this.courseTag,
    this.courseDetails,
    this.language,
    this.noOfLectures,
    this.pageColor,
    this.progress_line,
  });
}

List<Course> courseList = [
  Course(
    courseName: "Data Structures and Algorithms",
    courseAuthor: "Michael Douglas",
    authorImage: "assets/profile_img/b4.png",
    courseTag: "DSA",
    courseImage: "assets/images/course1.png",
    courseDetails:
        "Data Structures and Algorithms are not only crucial to land your dream job, but it also helps in improving problem solving and analytical skills that can prompt you to think out of the box solutions.",
    noOfLectures: "20(6 hours 30 minutes)",
    language: "English,Spanish",
    pageColor: new Color(0xFFf37277),
    progress_line: "My DSA Progress",
  ),
  Course(
    courseName: "Operating Systems (OS)",
    courseAuthor: "Kenzie Madison",
    courseTag: "OS",
    authorImage: "assets/profile_img/g2.png",
    courseImage: "assets/images/course2.png",
    courseDetails:
        "OS is the most essential and vital part of a computer without which it is considered useless. It enables an interface or acts like a link for interaction between computer software that is installed on OS and users.",
    noOfLectures: "14(2 hours 14 minutes)",
    language: "English,French",
    pageColor: new Color(0xFF914DFF),
    progress_line: "My OS Progress",
  ),
  Course(
    courseName: "Database Management Systems",
    courseAuthor: "Rohan Saini",
    courseTag: "DBMS",
    authorImage: "assets/profile_img/b1.png",
    courseImage: "assets/images/dbms.png",
    courseDetails:
        "It’s one of the must-have skills for programmers, application developers, and IT professionals.Database Management Essentials provides the foundation you need for a career in database development.",
    noOfLectures: "14(2 hours 14 minutes)",
    language: "English,French",
    pageColor: new Color(0xFF66c2ff),
    progress_line: "DBMS",
  ),
  Course(
    courseName: "Object Oriented Progamming",
    courseAuthor: "Vaibhav Saini",
    courseTag: "OOPS",
    authorImage: "assets/profile_img/g1.png",
    courseImage: "assets/images/oops.png",
    courseDetails:
        "Object-Oriented Programming, also usually called OOPS, is a kind of programming that is more object-based and not just based on functions or procedures.",
    noOfLectures: "14(2 hours 14 minutes)",
    language: "English,French",
    pageColor: new Color(0xFF2B60DE),
    progress_line: "OOPs",
  ),
];
