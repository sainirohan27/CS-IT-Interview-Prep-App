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
];
var progress = 0.5;

double getprogress3() {
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

class dbms extends StatefulWidget {
  @override
  State<dbms> createState() => _dbmsState();
}

class _dbmsState extends State<dbms> {
  //bool check_box = false;
  double percent;

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
      inter_check[i] = (prefs.getBool('counter_dbms$i') ?? 0);
    });
  }

  void _savenswitchValue(i) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool('counter_dbms$i', inter_check[i]);
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
                          'DBMS Most Asked Interview Questions',
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
                          progressColor: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Topic Coverage: ' +
                            (getprogress3() * 100).toString() +
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
                          'Q1. What is DBMS?',
                          """DBMS is a collection of programs that facilitates users to create and maintain a database. In other words, DBMS provides us an interface or tool for performing different operations such as the creation of a database, inserting data into it, deleting data from it, updating the data, etc. DBMS is a software in which data is stored in a more secure way as compared to the file-based system. Using DBMS, we can overcome many problems such as- data redundancy, data inconsistency, easy access, more organized and understandable, and so on.""",
                          'none'),
                      theory(
                          2,
                          'Q2. What is a database?',
                          """A Database is a logical, consistent and organized collection of data that it can easily be accessed, managed and updated. Databases, also known as electronic databases are structured to provide the facility of creation, insertion, updating of the data efficiently and are stored in the form of a file or set of files, on the magnetic disk, tapes and another sort of secondary devices. """,
                          'none'),
                      theory(
                          3,
                          'Q3. What is a database system?',
                          """The collection of database and DBMS software together is known as a database system. Through the database system, we can perform many activities such as-

The data can be stored in the database with ease, and there are no issues of data redundancy and data inconsistency.

The data will be extracted from the database using DBMS software whenever required. So, the combination of database and DBMS software enables one to store, retrieve and access data with considerate accuracy and security.""",
                          'none'),
                      theory(
                          4,
                          'Q4. What are the advantages of DBMS?',
                          """➼ Redundancy control
➼ Restriction for unauthorized access
➼ Provides multiple user interfaces
➼ Provides backup and recovery
➼ Enforces integrity constraints
➼ Ensure data consistency
➼ Easy accessibility
➼ Easy data extraction and data processing due to the use of queries""",
                          'none'),
                      theory(
                          5,
                          'Q5. What is a checkpoint in DBMS?',
                          """The Checkpoint is a type of mechanism where all the previous logs are removed from the system and permanently stored in the storage disk.

There are two ways which can help the DBMS in recovering and maintaining the ACID properties, and they are- maintaining the log of each transaction and maintaining shadow pages. So, when it comes to log based recovery system, checkpoints come into existence. Checkpoints are those points to which the database engine can recover after a crash as a specified minimal point from where the transaction log record can be used to recover all the committed data up to the point of the crash.""",
                          'none'),
                      theory(
                          6,
                          'Q6. What are the unary operations in Relational Algebra?',
                          """PROJECTION and SELECTION are the unary operations in relational algebra. Unary operations are those operations which use single operands. Unary operations are SELECTION, PROJECTION, and RENAME.

As in SELECTION relational operators are used for example - =,<=,>=, etc.""",
                          'none'),
                      theory(
                          7,
                          'Q7. What is RDBMS?',
                          """RDBMS stands for Relational Database Management Systems. It is used to maintain the data records and indices in tables. RDBMS is the form of DBMS which uses the structure to identify and access data concerning the other piece of data in the database. RDBMS is the system that enables you to perform different operations such as- update, insert, delete, manipulate and administer a relational database with minimal difficulties. Most of the time RDBMS use SQL language because it is easily understandable and is used for often.""",
                          'none'),
                      theory(
                          8,
                          'Q8. How many types of database languages are?',
                          """There are four types of database languages:

➼ Data Definition Language (DDL) e.g., CREATE, ALTER, DROP, TRUNCATE, RENAME, etc. All these commands are used for updating the data that?s why they are known as Data Definition Language.

➼ Data Manipulation Language (DML) e.g., SELECT, UPDATE, INSERT, DELETE, etc. These commands are used for the manipulation of already updated data that's why they are the part of Data Manipulation Language.

➼ DATA Control Language (DCL) e.g., GRANT and REVOKE. These commands are used for giving and removing the user access on the database. So, they are the part of Data Control Language.

➼ Transaction Control Language (TCL) e.g., COMMIT, ROLLBACK, and SAVEPOINT. These are the commands used for managing transactions in the database. TCL is used for managing the changes made by DML.""",
                          'none'),
                      theory(
                          9,
                          'Q9. What do you understand by Data Model?',
                          """The Data model is specified as a collection of conceptual tools for describing data, data relationships, data semantics and constraints. These models are used to describe the relationship between the entities and their attributes.""",
                          'none'),
                      theory(
                          10,
                          'Q10. Define a Relation Schema and a Relation.',
                          """A Relation Schema is specified as a set of attributes. It is also known as table schema. It defines what the name of the table is. Relation schema is known as the blueprint with the help of which we can explain that how the data is organized into tables. This blueprint contains no data.

A relation is specified as a set of tuples. A relation is the set of related attributes with identifying key attributes""",
                          'none'),
                      theory(
                          11,
                          'Q11. What is a degree of Relation?',
                          """The degree of relation is a number of attribute of its relation schema. A degree of relation is also known as Cardinality it is defined as the number of occurrence of one entity which is connected to the number of occurrence of other entity. There are three degree of relation they are one-to-one(1:1), one-to-many(1:M), many-to-one(M:M).""",
                          'none'),
                      theory(
                          12,
                          'Q12. What is the Relationship?',
                          """The Relationship is defined as an association among two or more entities. There are three type of relationships in DBMS-

➼ One-To-One: Here one record of any object can be related to one record of another object.

➼ One-To-Many (many-to-one): Here one record of any object can be related to many records of other object and vice versa.

➼ Many-to-many: Here more than one records of an object can be related to n number of records of another object.""",
                          'none'),
                      theory(
                          13,
                          'Q13. What are the disadvantages of file processing systems?',
                          """➼ Inconsistent
➼ Not secure
➼ Data redundancy
➼ Difficult in accessing data
➼ Data isolation
➼ Data integrity
➼ Concurrent access is not possible
➼ Limited data sharing
➼Atomicity problem""",
                          'none'),
                      theory(
                          14,
                          'Q14. What is data abstraction in DBMS?',
                          """Data abstraction in DBMS is a process of hiding irrelevant details from users. Because database systems are made of complex data structures so, it makes accessible the user interaction with the database.

For example: We know that most of the users prefer those systems which have a simple GUI that means no complex processing. So, to keep the user tuned and for making the access to the data easy, it is necessary to do data abstraction. In addition to it, data abstraction divides the system in different layers to make the work specified and well defined.""",
                          'none'),
                      theory(
                          15,
                          'Q15. What are the three levels of data abstraction?',
                          """Following are three levels of data abstraction:

➼ Physical level: It is the lowest level of abstraction. It describes how data are stored.

➼ Logical level: It is the next higher level of abstraction. It describes what data are stored in the database and what the relationship among those data is.

➼ View level: It is the highest level of data abstraction. It describes only part of the entire database.""",
                          'none'),
                      theory(
                          16,
                          'Q16. What is DDL (Data Definition Language)?',
                          """Data Definition Language (DDL) is a standard for commands which defines the different structures in a database. Most commonly DDL statements are CREATE, ALTER, and DROP. These commands are used for updating data into the database.""",
                          'none'),
                      theory(
                          17,
                          'Q17. What is DML (Data Manipulation Language)?',
                          """Data Manipulation Language (DML) is a language that enables the user to access or manipulate data as organized by the appropriate data model. For example- SELECT, UPDATE, INSERT, DELETE.

There is two type of DML:

➼ Procedural DML or Low level DML: It requires a user to specify what data are needed and how to get those data.

➼ Non-Procedural DML or High level DML:It requires a user to specify what data are needed without specifying how to get those data.""",
                          'none'),
                      theory(
                          18,
                          'Q18. What is Relational Algebra?',
                          """Relational Algebra is a Procedural Query Language which contains a set of operations that take one or two relations as input and produce a new relationship. Relational algebra is the basic set of operations for the relational model. The decisive point of relational algebra is that it is similar to the algebra which operates on the number.

There are few fundamental operations of relational algebra:

➼ select
➼ project
➼ set difference
➼ union
➼ rename,etc.""",
                          'none'),
                      theory(
                          19,
                          'Q19. What is Relational Calculus?',
                          """Relational Calculus is a Non-procedural Query Language which uses mathematical predicate calculus instead of algebra. Relational calculus doesn't work on mathematics fundamentals such as algebra, differential, integration, etc. That's why it is also known as predicate calculus.

There is two type of relational calculus:

➼ Tuple relational calculus
➼ Domain relational calculus""",
                          'none'),
                      theory(
                          20,
                          'Q20. What do you understand by query optimization?',
                          """The term query optimization specifies an efficient execution plan for evaluating a query that has the least estimated cost. The concept of query optimization came into the frame when there were a number of methods, and algorithms existed for the same task then the question arose that which one is more efficient and the process of determining the efficient way is known as query optimization.

There are many benefits of query optimization:

➼ It reduces the time and space complexity.
➼ More queries can be performed as due to optimization every query comparatively takes less time.
➼ User satisfaction as it will provide output fast""",
                          'none'),
                      theory(
                          21,
                          'Q21. What do you mean by durability in DBMS?',
                          """Once the DBMS informs the user that a transaction has completed successfully, its effect should persist even if the system crashes before all its changes are reflected on disk. This property is called durability. Durability ensures that once the transaction is committed into the database, it will be stored in the non-volatile memory and after that system failure cannot affect that data anymore.""",
                          'none'),
                      theory(
                          22,
                          'Q22. What is normalization?',
                          """Normalization is a process of analysing the given relation schemas according to their functional dependencies. It is used to minimize redundancy and also used to minimize insertion, deletion and update distractions. Normalization is considered as an essential process as it is used to avoid data redundancy, insertion anomaly, updation anomaly, deletion anomaly.

There most commonly used normal forms are:

➼ First Normal Form(1NF)
➼ Second Normal Form(2NF)
➼ Third Normal Form(3NF)
➼ Boyce & Codd Normal Form(BCNF)""",
                          'none'),
                      theory(
                          23,
                          'Q23. What is Denormalization?',
                          """Denormalization is the process of boosting up database performance and adding of redundant data which helps to get rid of complex data. Denormalization is a part of database optimization technique. This process is used to avoid the use of complex and costly joins. Denormalization doesn't refer to the thought of not to normalize instead of that denormalization takes place after normalization.""",
                          'none'),
                      theory(
                          24,
                          'Q24. What is functional Dependency?',
                          """Functional Dependency is the starting point of normalization. It exists when a relation between two attributes allow you to determine the corresponding attribute's value uniquely. The functional dependency is also known as database dependency and defines as the relationship which occurs when one attribute in a relation uniquely determines another attribute. It is written as A->B which means B is functionally dependent on A.""",
                          'none'),
                      theory(
                          25,
                          'Q25. What is the E-R model?',
                          """E-R model is a short name for the Entity-Relationship model. This model is based on the real world. It contains necessary objects (known as entities) and the relationship among these objects. Here the primary objects are the entity, attribute of that entity, relationship set, an attribute of that relationship set can be mapped in the form of E-R diagram.""",
                          'none'),
                      theory(
                          26,
                          'Q26. What is an entity?',
                          """The Entity is a set of attributes in a database. An entity can be a real-world object which physically exists in this world. All the entities have their attribute which in the real world considered as the characteristics of the object.""",
                          'none'),
                      theory(
                          27,
                          'Q27. What is an Entity type?',
                          """An entity type is specified as a collection of entities, having the same attributes. Entity type typically corresponds to one or several related tables in the database. A characteristic or trait which defines or uniquely identifies the entity is called entity type.

For example, a student has student_id, department, and course as its characteristics.""",
                          'none'),
                      theory(
                          28,
                          'Q28. What is an Entity set?',
                          """The entity set specifies the collection of all entities of a particular entity type in the database. An entity set is known as the set of all the entities which share the same properties.

For example, a set of people, a set of students, a set of companies, etc.""",
                          'none'),
                      theory(
                          29,
                          'Q29. What is Weak Entity set?',
                          """An entity set that doesn't have sufficient attributes to form a primary key is referred to as a weak entity set. The member of a weak entity set is known as a subordinate entity. Weak entity set does not have a primary key, but we need a mean to differentiate among all those entries in the entity set that depend on one particular strong entity set.""",
                          'none'),
                      theory(
                          30,
                          'Q30. What is an attribute?',
                          """An attribute refers to a database component. It is used to describe the property of an entity. An attribute can be defined as the characteristics of the entity. Entities can be uniquely identified using the attributes. Attributes represent the instances in the row of the database.

For example: If a student is an entity in the table then age will be the attribute of that student.""",
                          'none'),
                      theory(
                          31,
                          'Q31. What are the integrity rules in DBMS?',
                          """Data integrity is one significant aspect while maintaining the database. So, data integrity is enforced in the database system by imposing a series of rules. Those set of integrity is known as the integrity rules.

There are two integrity rules in DBMS:

➼ Entity Integrity : It specifies that "Primary key cannot have a NULL value."

➼ Referential Integrity: It specifies that "Foreign Key can be either a NULL value or should be the Primary Key value of other relation""",
                          'none'),
                      theory(
                          32,
                          'Q32. What is Join?',
                          """The Join operation is one of the most useful activities in relational algebra. It is most commonly used way to combine information from two or more relations. A Join is always performed on the basis of the same or related column. Most complex queries of SQL involve JOIN command.

There are following types of join:

➼ Inner joins: Inner join is of 3 categories. They are:
 ‣ Theta join
 ‣ Natural join
 ‣ Equi join
➼ Outer joins: Outer join have three types. They are:
 ‣ Left outer join
 ‣ Right outer join
 ‣ Full outer join""",
                          'none'),
                      theory(
                          33,
                          'Q33. What is 1NF?',
                          """1NF is the First Normal Form. It is the simplest type of normalization that you can implement in a database. The primary objectives of 1NF are to:

➼ Every column must have atomic (single value)
➼ To Remove duplicate columns from the same table
➼ Create separate tables for each group of related data and identify each row with a unique column""",
                          'none'),
                      theory(
                          34,
                          'Q34. What is 2NF?',
                          """2NF is the Second Normal Form. A table is said to be 2NF if it follows the following conditions:

➼ The table is in 1NF, i.e., firstly it is necessary that the table should follow the rules of 1NF.
➼ Every non-prime attribute is fully functionally dependent on the primary key, i.e., every non-key attribute should be dependent on the primary key in such a way that if any key element is deleted, then even the non_key element will still be saved in the database.""",
                          'none'),
                      theory(
                          35,
                          'Q35. What is 3NF?',
                          """3NF stands for Third Normal Form. A database is called in 3NF if it satisfies the following conditions:

➼ It is in second normal form.
➼ There is no transitive functional dependency.
➼ For example: X->Z
Where:
    X->Y
    Y does not -> X
    Y->Z so, X->Z""",
                          'none'),
                      theory(
                          36,
                          'Q36. What is BCNF?',
                          """BCMF stands for Boyce-Codd Normal Form. It is an advanced version of 3NF, so it is also referred to as 3.5NF. BCNF is stricter than 3NF.

A table complies with BCNF if it satisfies the following conditions:

➼ It is in 3NF.
➼ For every functional dependency X->Y, X should be the super key of the table. It merely means that X cannot be a non-prime attribute if Y is a prime attribute.""",
                          'none'),
                      theory(
                          37,
                          'Q37. Explain ACID properties',
                          """ACID properties are some basic rules, which has to be satisfied by every transaction to preserve the integrity. These properties and rules are:

➼ ATOMICITY: Atomicity is more generally known as ?all or nothing rule.' Which implies all are considered as one unit, and they either run to completion or not executed at all.

➼ CONSISTENCY: This property refers to the uniformity of the data. Consistency implies that the database is consistent before and after the transaction.

➼ ISOLATION: This property states that the number of the transaction can be executed concurrently without leading to the inconsistency of the database state.

➼ DURABILITY: This property ensures that once the transaction is committed it will be stored in the non-volatile memory and system crash can also not affect it anymore.""",
                          'none'),
                      theory(
                          38,
                          """What is the difference between a DELETE command and TRUNCATE command?""",
                          """DELETE command: DELETE command is used to delete rows from a table based on the condition that we provide in a WHERE clause.

‣ DELETE command delete only those rows which are specified with the WHERE clause.
‣ DELETE command can be rolled back.
‣ DELETE command maintain a log, that's why it is slow.
‣ DELETE use row lock while performing DELETE function.

TRUNCATE command: TRUNCATE command is used to remove all rows (complete data) from a table. It is similar to the DELETE command with no WHERE clause.

‣ The TRUNCATE command removes all the rows from the table.
‣ The TRUNCATE command cannot be rolled back.
‣ The TRUNCATE command doesn't maintain a log. That's why it is fast.
‣ TRUNCATE use table log while performing the TRUNCATE function.""",
                          'none'),
                      theory(
                          39,
                          'Q39. What is the difference between a shared lock and exclusive lock?',
                          """➼ Shared lock: Shared lock is required for reading a data item. In the shared lock, many transactions may hold a lock on the same data item. When more than one transaction is allowed to read the data items then that is known as the shared lock.

➼ Exclusive lock: When any transaction is about to perform the write operation, then the lock on the data item is an exclusive lock. Because, if we allow more than one transaction then that will lead to the inconsistency in the database.""",
                          'none'),
                      theory(
                          40,
                          'Q40. Describe the types of keys?',
                          """There are following types of keys:

1) Primary key: The Primary key is an attribute in a table that can uniquely identify each record in a table. It is compulsory for every table.

2) Candidate key: The Candidate key is an attribute or set of an attribute which can uniquely identify a tuple. The Primary key can be selected from these attributes.

3) Super key: The Super key is a set of attributes which can uniquely identify a tuple. Super key is a superset of the candidate key.

4) Foreign key: The Foreign key is a primary key from one table, which has a relationship with another table. It acts as a cross-reference between tables.""",
                          'none'),
                      //Text('Current Progress is: $getprogress() %',style: ,),
                      Text(
                        (getprogress3() * 100).toString() + '%',
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
                height: 50,
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
              borderRadius: BorderRadius.circular(30),
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
                                          progress = getprogress3();
                                          //addDoubleToSF(getprogress3());

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



//waste below
/*
Container theory2(int ques_ind, String question, String answer, String image) {
  return Container(
    //margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    //padding: const EdgeInsets.all(15.0),
    child: GlassContainer(
      height: 300,
      width: 400,
      gradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.40),
          Colors.white.withOpacity(0.10)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderGradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.60),
          Colors.white.withOpacity(0.10),
          Colors.lightBlueAccent.withOpacity(0.05),
          Colors.lightBlueAccent.withOpacity(0.6)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.0, 0.39, 0.40, 1.0],
      ),
      blur: 20.0,
      borderWidth: 2,
      borderRadius: BorderRadius.circular(24.0),
      elevation: 3.0,
      isFrostedGlass: true,
      shadowColor: Colors.black.withOpacity(0.20),
      alignment: Alignment.center,
      frostedOpacity: 0.12,
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      child: new Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  '$question',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
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
                                '\n$answer\n',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            if (image != 'none') Text('\n'),
                            if (image != 'none')
                              Image.asset(
                                  'assets/image/interview_images/$image'),
                            Checkbox(
                              value: inter_check[ques_ind - 1],
                              onChanged: (value) {
                                inter_check[ques_ind - 1] = true;
                                /*
                            setState(() {
                              inter_check[ques_ind - 1] = value;
                            },);*/
                              },
                            ),
                          ],
                        ),
                      ),
                    )
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
    ),
  );
}

Container theory1(int ques_ind, String question, String answer, String image) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    padding: const EdgeInsets.all(15.0),
    decoration: new BoxDecoration(
      //you can get rid of below line also
      borderRadius: new BorderRadius.circular(10.0),
      //below line is for rectangular shape
      shape: BoxShape.rectangle,
      //you can change opacity with color here(I used black) for rect
      color: Colors.white.withOpacity(0.8),
      //I added some shadow, but you can remove boxShadow also.
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.white24,
          blurRadius: 5.0,
          offset: new Offset(5.0, 5.0),
        ),
      ],
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
                  color: Colors.black,
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
                              '\n$answer\n',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[700]),
                            ),
                          if (image != 'none') Text('\n'),
                          if (image != 'none')
                            Image.asset('assets/image/interview_images/$image'),
                          Checkbox(
                            value: inter_check[ques_ind - 1],
                            onChanged: (value) {
                              inter_check[ques_ind - 1] = true;
                              /*
                            setState(() {
                              inter_check[ques_ind - 1] = value;
                            },);*/
                            },
                          ),
                        ],
                      ),
                    ),
                  )
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
  );
}
*/