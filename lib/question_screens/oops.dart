import 'dart:ffi';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:OnlineCourseAppUI/question_screens/dsa progress.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:provider/provider.dart';
import 'package:OnlineCourseAppUI/AdState.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

var inter_check = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
];
var progress = 0.5;

double getprogress4() {
  int size = inter_check.length;
  double cnt = 0;
  for (int i = 0; i < size; i++) {
    if (inter_check[i] == true) {
      cnt += 1;
    }
  }
  double progress = (cnt / size);
  print('function is returning $progress');
  //addDoubleToSF(progress);
  //percent = progress;
  return progress;
}

class oops extends StatefulWidget {
  @override
  State<oops> createState() => _oopsState();
}

class _oopsState extends State<oops> {
  //bool check_box = false;
  double percent;
//ads

  BannerAd banner;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      setState(() {
        banner = BannerAd(
          adUnitId: adState.bannerAdUnitId,
          size: AdSize.banner,
          request: AdRequest(),
          listener: adState.adListener,
        )..load();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    int size = inter_check.length;
    for (int i = 0; i < size; i++) _loadvalue(i);
  }

  void _loadvalue(int i) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      inter_check[i] = (prefs.getBool('counter_oops$i') ?? 0);
    });
  }

  void _savenswitchValue(i) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool('counter_oops$i', inter_check[i]);
    });
  }

/*
  void checkvalue() async {
    final prefs = await SharedPreferences.getInstance();
    bool temp;
    double cnt = 0;

    for (int i = 0; i < inter_check.length; i++) {
      temp = prefs.getBool('counter$i');
      if (temp) cnt += 1;
    }
    print('value is:$cnt');
  }
  */

/*
  double getprogress2() {
    int size = inter_check.length;
    double cnt = 0;
    for (int i = 0; i < size; i++) {
      if (checkvalue(i)) {
        cnt += 1;
      }
    }
    double progress = (cnt / size) * 100;
    print('function is returning $progress');
    //percent = progress;
    return progress;
  }
*/
/*
  void showToast() {
    Fluttertoast.showToast(
        msg: 'This is toast notification',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black);
  }*/

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg01.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 35,
                      ),
                      Center(
                        child: Text(
                          'OOPS Most Asked Interview Questions',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Container(
                        margin: new EdgeInsets.symmetric(horizontal: 10.0),
                        child: new LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width - 20,
                          animation: true,
                          animateFromLastPercent: true,
                          lineHeight: 17.0,
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
                          progressColor: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Topic Coverage: ' +
                            (getprogress4() * 100).toString() +
                            '%',
                        //textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      productListing(
                          1,
                          'Q1. What is Object Oriented Programming?',
                          'Object-Oriented Programming(OOPs) is a type of programming that is based on objects rather than just functions and procedures. Individual objects are grouped into classes. OOPs implements real-world entities like inheritance, polymorphism, hiding, etc into programming. It also allows binding data and code together.\n',
                          'none'),
                      productListing(
                          2,
                          'Q2. Why use OOPs?',
                          '•	OOPs allows clarity in programming there by allowing simplicity in solving complex problems\n•	Code can be reused through inheritance thereby reducing redundancy\n•	Data and code are bound together by encapsulation\n•	OOPs allows data hiding, therefore, private data is kept confidential\n•	Problems can be divided into different parts making it simple to solve\n•	The concept of polymorphism gives flexibility to the program by allowing the entities to have multiple forms',
                          'none'),
                      productListing(
                          3,
                          'Q3. What is the difference between OOP and SOP?',
                          '',
                          'ans3.png'),
                      productListing(
                          4,
                          'Q4. What are the main features of OOPs?',
                          '•	Inheritance\n•	Encapsulation\n•	Polymorphism\n•	Data Abstraction',
                          'none'),
                      productListing(
                          5,
                          'Q5. What is an object?',
                          'An object is a real-world entity which is the basic unit of OOPs for example chair, cat, dog, etc. Different objects have different states or attributes, and behaviors.',
                          'none'),
                      productListing(
                          6,
                          'Q6. What is a class?',
                          'A class is a prototype that consists of objects in different states and with different behaviors. It has a number of methods that are common the objects present within that class.',
                          'none'),
                      productListing(
                          7,
                          'Q7. What is the difference between a class and a structure?',
                          'Class: User-defined blueprint from which objects are created. It consists of methods or set of instructions that are to be performed on the objects.\nStructure: A structure is basically a user-defined collection of variables which are of different data types.',
                          'none'),
                      productListing(
                          8,
                          'Q8. Can you call the base class method without creating an instance?',
                          'Yes, you can call the base class without instantiating it if:\n•	It is a static method\n•	The base class is inherited by some other subclass',
                          'none'),
                      productListing(
                          9,
                          'Q9. What is the difference between a class and an object?',
                          '',
                          'ans9.png'),
                      productListing(
                          10,
                          'Q10. What is inheritance?',
                          'Inheritance is a feature of OOPs which allows classes inherit common properties from other classes. For example, if there is a class such as ‘vehicle’, other classes like ‘car’, ‘bike’, etc can inherit common properties from the vehicle class. This property helps you get rid of redundant code thereby reducing the overall size of the code.',
                          'none'),
                      productListing(
                          11,
                          'Q11. What are the different types of inheritance?',
                          '•	Single inheritance\n•	Multiple inheritance\n•	Multilevel inheritance\n•	Hierarchical inheritance\n•	Hybrid inheritance\n',
                          'none'),
                      productListing(
                          12,
                          'Q12. What is the difference between multiple and multilevel inheritance?',
                          '',
                          'ans12.png'),
                      productListing(
                          13,
                          'Q13. What is hybrid inheritance?',
                          'Hybrid inheritance is a combination of multiple and multi-level inheritance.',
                          'none'),
                      productListing(
                          14,
                          'Q14. What is hierarchical inheritance?',
                          'Hierarchical inheritance refers to inheritance where one base class has more than one subclasses. For example, the vehicle class can have ‘car’, ‘bike’, etc as its subclasses.',
                          'none'),
                      productListing(
                          15,
                          'Q15. What are the limitations of inheritance?',
                          '•	Increases the time and effort required to execute a program as it requires jumping back and forth between different classes\n•	The parent class and the child class get tightly coupled\n•	Any modifications to the program would require changes both in the parent as well as the child class\n•	Needs careful implementation else would lead to incorrect results\n',
                          'none'),
                      productListing(
                          16,
                          'Q16. What is a superclass?',
                          'A superclass or base class is a class that acts as a parent to some other class or classes. For example, the Vehicle class is a superclass of class Car.',
                          'none'),
                      productListing(
                          17,
                          'Q17. What is a subclass?',
                          'A class that inherits from another class is called the subclass. For example, the class Car is a subclass or a derived of Vehicle class.',
                          'none'),
                      productListing(
                          18,
                          'Q18. What is polymorphism?',
                          'Polymorphism refers to the ability to exist in multiple forms. Multiple definitions can be given to a single interface. For example, if you have a class named Vehicle, it can have a method named speed but you cannot define it because different vehicles have different speed. This method will be defined in the subclasses with different definitions for different vehicles.',
                          'none'),
                      productListing(
                          19,
                          'Q19. What is static polymorphism?',
                          'Static polymorphism (static binding) is a kind of polymorphism that occurs at compile time. An example of compile-time polymorphism is method overloading.',
                          'none'),
                      productListing(
                          20,
                          'Q20. What is dynamic polymorphism?',
                          'Runtime polymorphism or dynamic polymorphism (dynamic binding) is a type of polymorphism which is resolved during runtime. An example of runtime polymorphism is method overriding.',
                          'none'),
                      productListing(
                          21,
                          'Q21. What is method overloading?',
                          'Method overloading is a feature of OOPs which makes it possible to give the same name to more than one methods within a class if the arguments passed differ.',
                          'none'),
                      productListing(
                          22,
                          'Q22. What is method overriding?',
                          'Method overriding is a feature of OOPs by which the child class or the subclass can redefine methods present in the base class or parent class. Here, the method that is overridden has the same name as well as the signature meaning the arguments passed and the return type.',
                          'none'),
                      productListing(
                          23,
                          'Q23. What is operator overloading?',
                          'Operator overloading refers to implementing operators using user-defined types based on the arguments passed along with it.',
                          'none'),
                      productListing(
                          24,
                          'Q24. Differentiate between overloading and overriding.',
                          '',
                          'ans24.png'),
                      productListing(
                          25,
                          'Q25. What is encapsulation?',
                          'Encapsulation refers to binding the data and the code that works on that together in a single unit. For example, a class. Encapsulation also allows data-hiding as the data specified in one class is hidden from other classes.',
                          'none'),
                      productListing(
                          26,
                          'Q26. What are ‘access specifiers’?',
                          'Access specifiers or access modifiers are keywords that determine the accessibility of methods, classes, etc in OOPs. These access specifiers allow the implementation of encapsulation. The most common access specifiers are public, private and protected. However, there are a few more which are specific to the programming languages.',
                          'none'),
                      productListing(
                          27,
                          'Q27. What is the difference between public, private and protected access modifiers?',
                          '',
                          'ans27.png'),
                      productListing(
                          28,
                          'Q28. What is data abstraction?',
                          'Data abstraction is a very important feature of OOPs that allows displaying only the important information and hiding the implementation details. For example, while riding a bike, you know that if you raise the accelerator, the speed will increase, but you don’t know how it actually happens. This is data abstraction as the implementation details are hidden from the rider.',
                          'none'),
                      productListing(
                          29,
                          'Q29. How to achieve data abstraction?',
                          'Data abstraction can be achieved through:\n•	Abstract class\n•	Abstract method',
                          'none'),
                      productListing(
                          30,
                          'Q30. What is an abstract class?',
                          'An abstract class is a class that consists of abstract methods. These methods are basically declared but not defined. If these methods are to be used in some subclass, they need to be exclusively defined in the subclass.',
                          'none'),
                      productListing(
                          31,
                          'Q31. Can you create an instance of an abstract class?',
                          'No. Instances of an abstract class cannot be created because it does not have a complete implementation. However, instances of subclass inheriting the abstract class can be created.',
                          'none'),
                      productListing(
                          32,
                          'Q32. What is an interface?',
                          'It is a concept of OOPs that allows you to declare methods without defining them. Interfaces, unlike classes, are not blueprints because they do not contain detailed instructions or actions to be performed. Any class that implements an interface defines the methods of the interface.',
                          'none'),
                      productListing(
                          33,
                          'Q33. Differentiate between data abstraction and encapsulation.',
                          '',
                          'ans33.png'),
                      productListing(
                          34,
                          'Q34. What are virtual functions?',
                          'Virtual functions are functions that are present in the parent class and are overridden by the subclass. These functions are used to achieve runtime polymorphism.',
                          'none'),
                      productListing(
                          35,
                          'Q35. What are pure virtual functions?',
                          'Pure virtual functions or abstract functions are functions that are only declared in the base class. This means that they do not contain any definition in the base class and need to be redefined in the subclass.',
                          'none'),
                      productListing(
                          36,
                          'Q36. What is a constructor?',
                          'A constructor is a special type of method that has the same name as the class and is used to initialize objects of that class.',
                          'none'),
                      productListing(
                          37,
                          'Q37. What is a destructor?',
                          'A destructor is a method that is automatically invoked when an object is destroyed. The destructor also recovers the heap space that was allocated to the destroyed object, closes the files and database connections of the object, etc.',
                          'none'),
                      productListing(
                          38,
                          'Q38. Types of constructors',
                          'Types of constructors differ from language to language. However, all the possible constructors are:\n•	Default constructor\n•	Parameterized constructor\n•	Copy constructor\n•	Static constructor\n•	Private constructor',
                          'none'),
                      productListing(
                          39,
                          'Q39. What is a copy constructor?',
                          'A copy constructor creates objects by copying variables from another object of the same class. The main aim of a copy constructor is to create a new object from an existing one.',
                          'none'),
                      productListing(
                          40,
                          'Q40. What is the use of ‘finalize’?',
                          'Finalize as an object method used to free up unmanaged resources and cleanup before Garbage Collection(GC). It performs memory management tasks.',
                          'none'),
                      productListing(
                          41,
                          'Q41. What is Garbage Collection(GC)?',
                          'GC is an implementation of automatic memory management. The Garbage collector frees up space occupied by objects that are no longer in existence.',
                          'none'),
                      productListing(
                          42,
                          'Q42. Differentiate between a class and a method.',
                          '',
                          'ans42.png'),
                      productListing(
                          43,
                          'Q43. Differentiate between an abstract class and an interface?',
                          '',
                          'ans43.png'),
                      productListing(
                          44,
                          'Q44. What is a final variable?',
                          'A variable whose value does not change. It always refers to the same object by the property of non-transversity.',
                          'none'),
                      productListing(
                          45,
                          'Q45. What is an exception?',
                          'An exception is a kind of notification that interrupts the normal execution of a program. Exceptions provide a pattern to the error and transfer the error to the exception handler to resolve it. The state of the program is saved as soon as an exception is raised.',
                          'none'),
                      productListing(
                          46,
                          'Q46. What is exception handling?',
                          'Exception handling in Object-Oriented Programming is a very important concept that is used to manage errors. An exception handler allows errors to be thrown and caught and implements a centralized mechanism to resolve them.',
                          'none'),
                      productListing(
                          47,
                          'Q47. What is the difference between an error and an exception?',
                          '',
                          'ans47.png'),
                      productListing(
                          48,
                          'Q48. What is a try/ catch block?',
                          'A try/ catch block is used to handle exceptions. The try block defines a set of statements that may lead to an error. The catch block basically catches the exception.',
                          'none'),
                      productListing(
                          49,
                          'Q49. What is a finally block?',
                          'A finally block consists of code that is used to execute important code such as closing a connection, etc. This block executes when the try block exits. It also makes sure that finally block executes even in case some unexpected exception is encountered.',
                          'none'),
                      productListing(
                          50,
                          'Q50. What are the limitations of OOPs?',
                          '•	Usually not suitable for small problems\n•	Requires intensive testing\n•	Takes more time to solve the problem\n•	Requires proper planning\n•	The programmer should think of solving a problem in terms of objects',
                          'none'),
                      //Text('Current Progress is: $getprogress() %',style: ,),
                      Text(
                        (getprogress4() * 100).toString() + '%',
                        //textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (banner == null)
              SizedBox(
                height: 0,
              )
            else
              Container(
                height: 50,
                child: AdWidget(ad: banner),
              ),
          ],
        ),
      ),
    );
  }

  Container productListing(
      int ques_ind, String question, String answer, String image) {
    print("The function had been called");
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(10.0),
        //
      ),
      child: Stack(
        children: <Widget>[
          /*
        new ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: new FlutterLogo()),*/
          new Center(
            child: new ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                child: new Container(
                  padding: const EdgeInsets.all(14.0),
                  decoration: new BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    //color: Colors.grey.shade200.withOpacity(0.5),
                    //you can get rid of below line also
                    borderRadius: new BorderRadius.circular(20.0),

                    //below line is for rectangular shape
                    //shape: BoxShape.rectangle,
                    //you can change opacity with color here(I used black) for rect
                    //color: Colors.white.withOpacity(0.1),
                    //I added some shadow, but you can remove boxShadow also.

                    /*
                  boxShadow: <BoxShadow>[
                    new BoxShadow(
                      color: Colors.white24,
                      blurRadius: 10.0,
                      offset: new Offset(0.0, 0.0),
                    ),
                  ],*/
                  ),
                  child: new Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              '$question',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            child: Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    child: Column(
                                      children: <Widget>[
                                        if (image == 'none')
                                          Text(
                                            '\n$answer',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                          ),
                                        if (image != 'none') Text('\n'),
                                        if (image != 'none')
                                          Image.asset('assets/images/$image'),

                                        /*
                                        Checkbox(
                                          value: inter_check[ques_ind - 1],
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                inter_check[ques_ind - 1] =
                                                    value;
                                              },
                                            );
                                          },
                                        ),
                                        */
                                      ],
                                    ),
                                  ),
                                ),
                                Checkbox(
                                  value: inter_check[ques_ind - 1],
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        inter_check[ques_ind - 1] = value;
                                        if (inter_check[ques_ind - 1]) {
                                          print('marked on');
                                          progress = getprogress4();
                                          //addDoubleToSF(getprogress4());

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              backgroundColor: Colors.white,
                                              content: Text(
                                                "✓  Marked as Learned",
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                textAlign: TextAlign.center,
                                              ),
                                              duration: Duration(seconds: 2),
                                              elevation: 2,
                                              width: 300,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15))),
                                              behavior:
                                                  SnackBarBehavior.floating,
                                            ),
                                          );
                                        }
                                        _savenswitchValue(ques_ind - 1);
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                  /*decoration: new BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(0.5)),
                child: new Center(
                  child: new Text(
                    'Frosted',
                    //style: Theme.of(context).textTheme.display3
                  ),
                ),*/
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
