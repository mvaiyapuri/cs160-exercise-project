import 'package:flutter/material.dart';
import 'Profile.dart';
import 'home.dart';
import 'WorkoutPlan.dart';
import 'Stats.dart';
import '../provider/user_provider.dart';
import 'package:provider/provider.dart';

//import 'package:google_fonts/google_fonts.dart';

class FindNewPlan extends StatefulWidget {
  const FindNewPlan({Key? key}) : super(key: key);

  @override
  State<FindNewPlan> createState() => _FindNewPlanState();
}

class _FindNewPlanState extends State<FindNewPlan> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF9D6DC),
      appBar: AppBar(
        backgroundColor: Color(0xFFFF0005),
        automaticallyImplyLeading: false,
        leading: IconButton(
          color: Colors.transparent,
          iconSize: 60,
          icon: Icon(
            Icons.person,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile()));
          },
        ),
        title: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Text(
            'Find a New Plan',
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.red,
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xFFF9D6DC),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'New Plan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_run_rounded),
            label: 'Workout Plan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Stats',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          switch(index){
            case 0:
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
              break;
            case 1:
              _FindNewPlanState();
              break;
            case 2:
              Navigator.push(context, MaterialPageRoute(builder: (context) => const WorkoutPlan()));
              break;
            case 3:
              Navigator.push(context, MaterialPageRoute(builder: (context) => const StatsPage()));
              break;
          }
          setState(
                  (){
                _selectedIndex = index;
              }
          );
        },

      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  height: 100,
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red, minimumSize: const Size.fromHeight(50)),
                    child: const Text('Beginner', style: TextStyle(fontSize: 25)),
                    onPressed: () async {
                      await Provider.of<UserProvider>(context, listen: false).editLevel("Beginner");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const WorkoutPlan()));
                    },
                  )
              ),
              Container(
                  height: 100,
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red, minimumSize: const Size.fromHeight(50)),
                    child: const Text('Intermediate', style: TextStyle(fontSize: 25)),
                    onPressed: () async {
                      await Provider.of<UserProvider>(context, listen: false).editLevel("Intermediate");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const WorkoutPlan()));

                    },
                  )
              ),
              Container(
                  height: 100,
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red, minimumSize: const Size.fromHeight(50)),
                    child: const Text('Advanced', style: TextStyle(fontSize: 25)),
                    onPressed: () {
                    },
                  )
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 120, 0, 0),
                  child: Image.asset(
                    'assets/waterbottle.png',
                    width: 110,
                    height: 100,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
