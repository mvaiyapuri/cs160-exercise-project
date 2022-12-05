import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';
import 'main.dart';

class TasksWidget extends StatefulWidget {
  const TasksWidget({Key? key}) : super(key: key);

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  TextEditingController newTaskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      //padding: const EdgeInsets.all(20.0),
      children: <Widget>[
        Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(image: new AssetImage("assets/background.png"), fit: BoxFit.cover, opacity: 0.3),
          ),
        ),
        Column(
          children: [
            FutureBuilder(
              future: Provider.of<UserProvider>(context, listen: false).getUser,
              builder: (ctx, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Center(child: CircularProgressIndicator())
                  :
              Consumer<UserProvider>(
                child: Center(
                  heightFactor: MediaQuery.of(context).size.height * 0.03,
                  child: const Text('You have no tasks.', style: TextStyle(fontSize: 18),),
                ),
                builder: (ctx, userProvider, child) => !snapshot.hasData
                    ?  child as Widget
                    : Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Builder(
                        builder: (ctx) => Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Column(
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  snapshot.data!.username,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50),
                                ),
                                SizedBox(height: 50),
                                Text(
                                  snapshot.data!.firstname + " " + snapshot.data!.lastname,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  snapshot.data!.gender,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "Level:",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                                Text(
                                  snapshot.data!.level,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: const [
                                    SizedBox(width: 60, height: 30),
                                    Expanded(
                                      child: Text(
                                        "Height:",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Weight:",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const SizedBox(width: 60, height: 30),
                                    Expanded(
                                      child: Text(
                                        snapshot.data!.height.toString(),
                                        style: const TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        snapshot.data!.weight.toString(),
                                        style: const TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                RichText(
                                  text: TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: Icon(Icons.cake, size: 30, color: Colors.red),
                                        ),
                                        TextSpan(
                                            text: snapshot.data!.dob,
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30)
                                        ),
                                      ]
                                  )

                                  ,
                                ),
                                IconButton(
                                  color: Colors.transparent,
                                  iconSize: 60,
                                  icon: Icon(
                                    Icons.logout,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                                  },
                                ),
                              ]
                          ),
                        )
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ]
    );
    }
}


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF9D6DC),
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xFFFF0005),
        automaticallyImplyLeading: false,
        leading: IconButton(
          color: Colors.transparent,
          iconSize: 60,
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Text(
            'Profile',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
        actions: [
          IconButton(
            color: Colors.transparent,
            iconSize: 60,
            icon: Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
        ],
        centerTitle: true,
        elevation: 2,
      ),
      body: TasksWidget(),
    );
  }
}