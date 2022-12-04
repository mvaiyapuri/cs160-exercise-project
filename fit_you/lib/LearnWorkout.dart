import 'package:fit_you/provider/workout_provider.dart';
import 'package:flutter/material.dart';
import 'Profile.dart';
import 'home.dart';
import 'FindNewPlan.dart';
import 'Stats.dart';
import 'WorkoutPlan.dart';
import 'package:provider/provider.dart';

//import 'package:google_fonts/google_fonts.dart';

class LearnWorkout extends StatefulWidget {
  const LearnWorkout({Key? key}) : super(key: key);

  @override
  State<LearnWorkout> createState() => _LearnWorkoutState();
}

class _LearnWorkoutState extends State<LearnWorkout> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 2;

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
            'Learn Workout',
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => const FindNewPlan()));
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
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisSize: MainAxisSize.max,
            children:[
              FutureBuilder(
                future: Provider.of<WorkoutProvider>(context, listen: false).getWorkout,
                builder: (ctx, snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? Center(child: CircularProgressIndicator())
                    :
                Consumer<WorkoutProvider>(
                  child: Center(
                    heightFactor: MediaQuery.of(context).size.height * 0.03,
                    child: const Text('You have no tasks.', style: TextStyle(fontSize: 18),),
                  ),
                  builder: (ctx, userProvider, child) => !snapshot.hasData
                      ?  child as Widget
                      : Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Builder(
                          builder: (ctx) => Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Column(
                                children: [
                                  //SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                                    child: Text(
                                      snapshot.data!.description,
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  )


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
        ),
      ),
    );
  }
}
