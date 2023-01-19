import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:OnlineCourseAppUI/question_screens/dsa progress.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:math';

import 'package:provider/provider.dart';
import 'package:OnlineCourseAppUI/AdState.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

double roundDouble(double value, int places) {
  double mod = pow(10.0, places);
  return ((value * mod).round().toDouble() / mod);
}

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
];
var progress = 0.5;

//Making changes below

double dsa_progress = 0.0;

//saving data
addDoubleToSF(double data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setDouble('dsa_progress', data);
  print('new value saved');
}

//reading data
getDoubleValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return double
  double doubleValue = await prefs.getDouble('dsa_progress') ?? 0.0;
  return doubleValue;
}

//Making changes above

double getprogress() {
  // _dsaState ob; //
  // ob.fun(); //

  int size = inter_check.length;
  double cnt = 0;
  for (int i = 0; i < size; i++) {
    //print('loop running');
    if (inter_check[i] == true) {
      cnt += 1;
    }
  }
  double progress = roundDouble((cnt / size), 2);
  progress = double.parse((progress).toStringAsFixed(3));
  //progress = double.parse((progress).toStringAsFixed(2));

  print('function is returning $progress');
  addDoubleToSF(progress);
  //percent = progress;
  return roundDouble(progress, 2);
}

class dsa extends StatefulWidget {
  @override
  State<dsa> createState() => _dsaState();
}

class _dsaState extends State<dsa> {
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
      inter_check[i] = (prefs.getBool('counter$i') ?? 0);
    });
  }

  void _savenswitchValue(i) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool('counter$i', inter_check[i]);
    });
  }

  void fun() {
    setState(() {});
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
                          'DSA Most Asked Interview Questions',
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
                          percent: roundDouble(getprogress(), 2), //0.8,
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
                          progressColor: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Topic Coverage: ' +
                            (getprogress() * 100).toString() +
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
                          'Q1. What is Data Structure? Explain.',
                          'The data structure is a way that specifies how to organize and manipulate the data. It also defines the relationship between them. Some examples of Data Structures are arrays, Linked List, Stack, Queue, etc. Data Structures are the central part of many computer science algorithms as they enable the programmers to handle the data in an efficient way.\n',
                          'none'),
                      theory(
                          2,
                          'Q2. Describe the types of Data Structures?',
                          """Data Structures are mainly classified into two types:

Linear Data Structure: A data structure is called linear if all of its elements are arranged in the sequential order. In linear data structures, the elements are stored in a non-hierarchical way where each item has the successors and predecessors except the first and last element.

Non-Linear Data Structure: The Non-linear data structure does not form a sequence i.e. each item or element is connected with two or more other items in a non-linear arrangement. The data elements are not arranged in the sequential structure.""",
                          'none'),
                      theory(
                          3,
                          'Q3. List the area of applications of Data Structure.',
                          """Data structures are applied extensively in the following areas of computer science:

-> Compiler Design,
-> Operating System,
-> Database Management System,
-> Statistical analysis package,
-> Numerical Analysis,
-> Graphics,
-> Artificial Intelligence,
-> Simulation""",
                          'none'),
                      theory(
                          4,
                          'Q4. Which data structure is used to perform recursion?',
                          'Stack data structure is used in recursion due to its last in first out nature. Operating system maintains the stack in order to save the iteration variables at each function call.',
                          'none'),
                      theory(
                          5,
                          'Q5. What is a Stack?',
                          """Stack is an ordered list in which, insertion and deletion can be performed only at one end that is called the top. It is a recursive data structure having pointer to its top element. The stack is sometimes called as Last-In-First-Out (LIFO) list i.e. the element which is inserted first in the stack will be deleted last from the stack.""",
                          'none'),
                      theory(
                          6,
                          'Q6. List the area of applications where stack data structure can be used?',
                          """-> Expression evaluation
-> Backtracking
-> Memory Management
-> Function calling and return""",
                          'none'),
                      theory(
                          7,
                          'Q7. Write the stack overflow condition.',
                          """Overflow occurs when top = Maxsize -1

""",
                          'none'),
                      theory(
                          8,
                          'Q8. Write the steps involved in the insertion and deletion of an element in the stack.',
                          """Push:
‣ Increment the variable top so that it can refer to the next memory allocation
‣ Copy the item to the at the array index value equal to the top
‣ Repeat step 1 and 2 until stack overflows

Pop:
‣ Store the topmost element into the an another variable
‣ Decrement the value of the top
‣ Return the topmost element""",
                          'none'),
                      theory(
                          9,
                          'Q9. What is an array?',
                          """Arrays are defined as the collection of similar types of data items stored at contiguous memory locations. It is the simplest data structure in which each data element can be randomly accessed by using its index number.""",
                          'none'),
                      theory(
                          10,
                          'Q10. How to reference all the elements in a one-dimension array?',
                          """It can be done by using an indexed loop such that the counter runs from 0 to the array size minus one. In this manner, you can reference all the elements in sequence by using the loop counter as the array subscript.""",
                          'none'),
                      theory(
                          11,
                          'Q11. How are the elements of a 2D array are stored in the memory?',
                          """There are two techniques by using which, the elements of a 2D array can be stored in the memory.

‣ Row-Major Order: In row-major ordering, all the rows of the 2D array are stored into the memory contiguously. First, the 1st row of the array is stored into the memory completely, then the 2nd row of the array is stored into the memory completely and so on till the last row.

‣ Column-Major Order: In column-major ordering, all the columns of the 2D array are stored into the memory contiguously. first, the 1st column of the array is stored into the memory completely, then the 2nd row of the array is stored into the memory completely and so on till the last column of the array.""",
                          'none'),
                      theory(
                          12,
                          'Q12. Define Linked List Data structure.',
                          """Linked List is the collection of randomly stored data objects called nodes. In Linked List, each node is linked to its adjacent node through a pointer. A node contains two fields, i.e. Data Field and Link Field.""",
                          'none'),
                      theory(
                          13,
                          'Q13. What are the advantages of Linked List over an array?',
                          """‣ The size of a linked list can be incremented at runtime which is impossible in the case of the array.
‣ The List is not required to be contiguously present in the main memory, if the contiguous space is not available, the nodes can be stored anywhere in the memory connected through the links.
‣ The List is dynamically stored in the main memory and grows as per the program demand while the array is statically stored in the main memory, size of which must be declared at compile time.
‣ The number of elements in the linked list are limited to the available memory space while the number of elements in the array is limited to the size of an array.""",
                          'none'),
                      theory(
                          14,
                          'Q14. What is doubly linked list?',
                          """The doubly linked list is a complex type of linked list in which a node contains a pointer to the previous as well as the next node in the sequence. In a doubly linked list, a node consists of three parts:

‣ node data
‣ pointer to the next node in sequence (next pointer)
‣ pointer to the previous node (previous pointer).""",
                          'none'),
                      theory(
                          15,
                          'Q15. Define the queue data structure.',
                          """The Applications of the queue is given as follows:

➼ Queues are widely used as waiting lists for a single shared resource like a printer, disk, CPU.
➼ Queues are used in the asynchronous transfer of data (where data is not being transferred at the same rate between two processes) for eg. pipes, file IO, sockets.
➼ Queues are used as buffers in most of the applications like MP3 media player, CD player, etc.
➼ Queues are used to maintain the playlist in media players to add and remove the songs from the play-list.
➼ Queues are used in operating systems for handling interrupts.""",
                          'none'),
                      theory(
                          16,
                          'Q16. What are the scenarios in which an element can be inserted into the circular queue?',
                          """➼ If (rear + 1)%maxsize = front, the queue is full. In that case, overflow occurs and therefore, insertion can not be performed in the queue.
➼ If rear != max - 1, the rear will be incremented to the mod(maxsize) and the new value will be inserted at the rear end of the queue.
➼ If front != 0 and rear = max - 1, it means that queue is not full therefore, set the value of rear to 0 and insert the new element there.""",
                          'none'),
                      theory(
                          17,
                          'Q17. What is a dequeue?',
                          """Dequeue (also known as double-ended queue) can be defined as an ordered set of elements in which the insertion and deletion can be performed at both the ends, i.e. front and rear.""",
                          'none'),
                      theory(
                          18,
                          'Q18. What is the minimum number of queues that can be used to implement a priority queue?',
                          """Two queues are needed. One queue is used to store the data elements, and another is used for storing priorities.""",
                          'none'),
                      theory(
                          19,
                          'Q19. Define the tree data structure.',
                          """The Tree is a recursive data structure containing the set of one or more data nodes where one node is designated as the root of the tree while the remaining nodes are called as the children of the root. The nodes other than the root node are partitioned into the nonempty sets where each one of them is to be called sub-tree.""",
                          'none'),
                      theory(
                          20,
                          'Q20. What are Binary trees?',
                          """A binary Tree is a special type of generic tree in which, each node can have at most two children. Binary tree is generally partitioned into three disjoint subsets, i.e. the root of the node, left sub-tree and Right binary sub-tree.""",
                          'none'),
                      theory(
                          21,
                          'Q21. How can AVL Tree be useful in all the operations as compared to Binary search tree?',
                          """AVL tree controls the height of the binary search tree by not letting it be skewed. The time taken for all operations in a binary search tree of height h is O(h). However, it can be extended to O(n) if the BST becomes skewed (i.e. worst case). By limiting this height to log n, AVL tree imposes an upper bound on each operation to be O(log n) where n is the number of nodes.
""",
                          'none'),

                      theory(
                          22,
                          'Q22. List some applications of Tree-data structure?',
                          """Applications of Tree- data structure:

‣ The manipulation of Arithmetic expression,
‣ Symbol Table construction,
‣ Syntax analysis
‣ Hierarchal data model""",
                          'none'),
                      theory(
                          23,
                          'Q23. Define the graph data structure?',
                          """A graph G can be defined as an ordered set G(V, E) where V(G) represents the set of vertices and E(G) represents the set of edges which are used to connect these vertices. A graph can be seen as a cyclic tree, where the vertices (Nodes) maintain any complex relationship among them instead of having parent-child relations.""",
                          'none'),
                      theory(
                          24,
                          'Q24. Differentiate among cycle, path, and circuit?',
                          """➼ Path: A Path is the sequence of adjacent vertices connected by the edges with no restrictions.
➼ Cycle: A Cycle can be defined as the closed path where the initial vertex is identical to the end vertex. Any vertex in the path can not be visited twice
➼ Circuit: A Circuit can be defined as the closed path where the intial vertex is identical to the end vertex. Any vertex may be repeated.""",
                          'none'),
                      theory(
                          25,
                          'Q25. Mention the data structures which are used in graph implementation',
                          """For the graph implementation, following data structures are used.
➼ In sequential representation, Adjacency matrix is used.
➼ In Linked representation, Adjacency list is used.""",
                          'none'),
                      theory(
                          26,
                          'Q26. Which data structures are used in BFS and DFS algorithm?',
                          """➼ In BFS algorithm, Queue data structure is used.
➼ In DFS algorithm, Stack data structure is used.""",
                          'none'),
                      theory(
                          27,
                          'Q27. What are the applications of Graph data structure?',
                          """The graph has the following applications:

➼ Graphs are used in circuit networks where points of connection are drawn as vertices and component wires become the edges of the graph.
➼ Graphs are used in transport networks where stations are drawn as vertices and routes become the edges of the graph.
➼ Graphs are used in maps that draw cities/states/regions as vertices and adjacency relations as edges.
➼ Graphs are used in program flow analysis where procedures or modules are treated as vertices and calls to these procedures are drawn as edges of the graph.""",
                          'none'),
                      theory(
                          28,
                          'Q28. What are the advantages of Binary search over linear search?',
                          """There are relatively less number of comparisons in binary search than that in linear search. In average case, linear search takes O(n) time to search a list of n elements while Binary search takes O(log n) time to search a list of n elements.""",
                          'none'),
                      theory(
                          29,
                          'Q29. What is the difference between NULL and VOID?',
                          """➼ Null is actually a value, whereas Void is a data type identifier.
➼ A null variable simply indicates an empty value, whereas void is used to identify pointers as having no initial size.
""",
                          'none'),
                      theory(
                          30,
                          'Q30. How do you know when to use DFS over BFS?',
                          """➼ The usage of DFS heavily depends on the structure of the search tree/graph and the number and location of solutions needed. Following are the best cases where we can use DFS:
➼ If it is known that the solution is not far from the root of the tree, a breadth first search (BFS) might be better.
➼ If the tree is very deep and solutions are rare, depth first search (DFS) might take an extremely long time, but BFS could be faster.
➼ If the tree is very wide, a BFS might need too much memory, so it might be completely impractical. We go for DFS in such cases.
➼ If solutions are frequent but located deep in the tree we opt for DFS.""",
                          'none'),
                      //Text('Current Progress is: $getprogress() %',style: ,),
                      Text(
                        (getprogress() * 100).toString() + '%',
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
                                          progress = getprogress();
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
