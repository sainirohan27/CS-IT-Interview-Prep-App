import 'dart:ffi';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:OnlineCourseAppUI/question_screens/dsa progress.dart';
import 'package:percent_indicator/percent_indicator.dart';
//ads
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
];
var progress = 0.5;

double getprogress2() {
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

class os extends StatefulWidget {
  @override
  State<os> createState() => _osState();
}

class _osState extends State<os> {
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
      inter_check[i] = (prefs.getBool('counter_os$i') ?? 0);
    });
  }

  void _savenswitchValue(i) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool('counter_os$i', inter_check[i]);
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
                          'OS Most Asked Interview Questions',
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
                          progressColor: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Topic Coverage: ' +
                            (getprogress2() * 100).toString() +
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
                      theory(
                          1,
                          'Q1. What is an operating system?',
                          """The operating system is a software program that facilitates computer hardware to communicate and operate with the computer software. It is the most important part of a computer system without it computer is just like a box.""",
                          'none'),
                      theory(
                          2,
                          'Q2. What is the main purpose of an operating system?',
                          """There are two main purposes of an operating system:

➼ It is designed to make sure that a computer system performs well by managing its computational activities.
➼ It provides an environment for the development and execution of programs.""",
                          'none'),
                      theory(
                          3,
                          'Q3. What are the different operating systems?',
                          """➼ Batched operating systems
➼ Distributed operating systems
➼ Timesharing operating systems
➼ Multi-programmed operating systems
➼ Real-time operating systems
""",
                          'none'),
                      theory(
                          4,
                          'Q4. What is a socket?',
                          """A socket is used to make connection between two applications. Endpoints of the connection are called socket.""",
                          'none'),
                      theory(
                          5,
                          'Q5. What is a real-time system?',
                          """Real-time system is used in the case when rigid-time requirements have been placed on the operation of a processor. It contains a well defined and fixed time constraints.""",
                          'none'),
                      theory(
                          6,
                          'Q6. What is kernel?',
                          """Kernel is the core and most important part of a computer operating system which provides basic services for all parts of the OS.""",
                          'none'),
                      theory(
                          7,
                          'Q7. What is monolithic kernel?',
                          """A monolithic kernel is a kernel which includes all operating system code is in single executable image.""",
                          'none'),
                      theory(
                          8,
                          'Q8. What do you mean by a process?',
                          """An executing program is known as process. There are two types of processes:
➼ Operating System Processes
➼ User Processes""",
                          'none'),
                      theory(
                          9,
                          'Q9. What are the different states of a process?',
                          """A list of different states of process:
➼ New Process
➼ Running Process
➼ Waiting Process
➼ Ready Process
➼ Terminated Process""",
                          'none'),
                      theory(
                          10,
                          'Q10. What is the difference between micro kernel and macro kernel?',
                          """➼ Micro kernel: micro kernel is the kernel which runs minimal performance affecting services for operating system. In micro kernel operating system all other operations are performed by processor.
➼ Macro Kernel: Macro Kernel is a combination of micro and monolithic kernel.""",
                          'none'),
                      theory(
                          11,
                          'Q11. What is the difference between process and program?',
                          """A program while running or executing is known as a process.""",
                          'none'),
                      theory(
                          12,
                          'Q12. What is the use of paging in operating system?',
                          """Paging is used to solve the external fragmentation problem in operating system. This technique ensures that the data you need is available as quickly as possible.

""",
                          'none'),
                      theory(
                          13,
                          'Q13. What is the concept of demand paging?',
                          """Demand paging specifies that if an area of memory is not currently being used, it is swapped to disk to make room for an application's need.""",
                          'none'),
                      theory(
                          14,
                          'Q14. What is the advantage of a multiprocessor system?',
                          """As many as processors are increased, you will get the considerable increment in throughput. It is cost effective also because they can share resources. So, the overall reliability increases.""",
                          'none'),
                      theory(
                          15,
                          'Q15. What is virtual memory?',
                          """Virtual memory is a very useful memory management technique which enables processes to execute outside of memory. This technique is especially used when an executing program cannot fit in the physical memory.""",
                          'none'),
                      theory(
                          16,
                          'Q16. What is thrashing?',
                          """Thrashing is a phenomenon in virtual memory scheme when the processor spends most of its time in swapping pages, rather than executing instructions.""",
                          'none'),
                      theory(
                          17,
                          'Q17. What are the four necessary and sufficient conditions behind the deadlock?',
                          """These are the 4 conditions:

1) Mutual Exclusion Condition: It specifies that the resources involved are non-sharable.

2) Hold and Wait Condition: It specifies that there must be a process that is holding a resource already allocated to it while waiting for additional resource that are currently being held by other processes.

3) No-Preemptive Condition: Resources cannot be taken away while they are being used by processes.

4) Circular Wait Condition: It is an explanation of the second condition. It specifies that the processes in the system form a circular list or a chain where each process in the chain is waiting for a resource held by next process in the chain.""",
                          'none'),
                      theory(
                          18,
                          'Q18. What is a thread?',
                          """A thread is a basic unit of CPU utilization. It consists of a thread ID, program counter, register set and a stack.""",
                          'none'),
                      theory(
                          19,
                          'Q19. What is FCFS?',
                          """FCFS stands for First Come, First Served. It is a type of scheduling algorithm. In this scheme, if a process requests the CPU first, it is allocated to the CPU first. Its implementation is managed by a FIFO queue.""",
                          'none'),
                      theory(
                          20,
                          'Q20. What is SMP?',
                          """SMP stands for Symmetric MultiProcessing. It is the most common type of multiple processor system. In SMP, each processor runs an identical copy of the operating system, and these copies communicate with one another when required.""",
                          'none'),
                      theory(
                          21,
                          'Q21. What is deadlock? Explain.',
                          """Deadlock is a specific situation or condition where two processes are waiting for each other to complete so that they can start. But this situation causes hang for both of them.""",
                          'none'),
                      theory(
                          22,
                          'Q22. What is Bankers algorithm?',
                          """Banker's algorithm is used to avoid deadlock. It is the one of deadlock-avoidance method. It is named as Banker's algorithm on the banking system where bank never allocates available cash in such a manner that it can no longer satisfy the requirements of all of its customers.
""",
                          'none'),
                      theory(
                          23,
                          'Q23. What is the difference between logical address space and physical address space?',
                          """Logical address space specifies the address that is generated by CPU. On the other hand physical address space specifies the address that is seen by the memory unit.""",
                          'none'),
                      theory(
                          24,
                          'Q24. What is fragmentation?',
                          """Fragmentation is a phenomenon of memory wastage. It reduces the capacity and performance because space is used inefficiently.""",
                          'none'),
                      theory(
                          25,
                          'Q25. How many types of fragmentation occur in Operating System?',
                          """There are two types of fragmentation:

➼ Internal fragmentation: It is occurred when we deal with the systems that have fixed size allocation units.

➼ External fragmentation: It is occurred when we deal with systems that have variable-size allocation units.""",
                          'none'),
                      theory(
                          26,
                          'Q26. What is the difference between internal commands and external commands?',
                          """Internal commands are the built-in part of the operating system while external commands are the separate file programs that are stored in a separate folder or directory.""",
                          'none'),
                      theory(
                          27,
                          'Q27. What is semaphore?',
                          """Semaphore is a protected variable or abstract data type that is used to lock the resource being used. The value of the semaphore indicates the status of a common resource.

There are two types of semaphore:
➼ Binary semaphores
➼ Counting semaphores""",
                          'none'),
                      theory(
                          28,
                          'Q28. What is a binary Semaphore?',
                          """Binary semaphore takes only 0 and 1 as value and used to implement mutual exclusion and synchronize concurrent processes.""",
                          'none'),
                      theory(
                          29,
                          'Q29. What is Beladys Anomaly?',
                          """Belady's Anomaly is also called FIFO anomaly. Usually, on increasing the number of frames allocated to a process virtual memory, the process execution is faster, because fewer page faults occur. Sometimes, the reverse happens, i.e., the execution time increases even when more frames are allocated to the process. This is Belady's Anomaly. This is true for certain page reference patterns.""",
                          'none'),
                      theory(
                          30,
                          'Q30. What is starvation in Operating System?',
                          """Starvation is Resource management problem. In this problem, a waiting process does not get the resources it needs for a long time because the resources are being allocated to other processes.""",
                          'none'),
                      theory(
                          31,
                          'Q31. What are the advantages of multithreaded programming?',
                          """A list of advantages of multithreaded programming:

➼ Enhance the responsiveness to the users.
➼ Resource sharing within the process.
➼ Economical
➼ Completely utilize the multiprocessing architecture.""",
                          'none'),

                      theory(
                          32,
                          'Q32. What are overlays?',
                          """Overlays makes a process to be larger than the amount of memory allocated to it. It ensures that only important instructions and data at any given time are kept in memory.""",
                          'none'),

                      //Text('Current Progress is: $getprogress() %',style: ,),
                      Text(
                        (getprogress2() * 100).toString() + '%',
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
            //ads

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

  Container theory(int ques_ind, String question, String answer, String image) {
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
                                          Image.asset(
                                              'assets/image/interview_images/$image'),
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
                                          progress = getprogress2();
                                          print(
                                              'new progress found is: $progress');
                                          //addDoubleToSF(progress);

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
