import 'package:fit_you/LearnWorkout.dart';
import 'package:fit_you/models/Workout.dart';
import 'package:flutter/material.dart';
import 'Profile.dart';
import 'home.dart';
import 'FindNewPlan.dart';
import 'Stats.dart';
import 'LearnWorkout.dart';
import 'package:provider/provider.dart';

import '../provider/workout_provider.dart';

//import 'package:google_fonts/google_fonts.dart';

class WorkoutPlan extends StatefulWidget {
  const WorkoutPlan({Key? key}) : super(key: key);

  @override
  State<WorkoutPlan> createState() => _WorkoutPlanState();
}

class _WorkoutPlanState extends State<WorkoutPlan> {
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
            'Workout Plan',
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
              _WorkoutPlanState();
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

      body: SingleChildScrollView(
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisSize: MainAxisSize.max,
              children:[
                const SizedBox(height: 10),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                        '   Warmup',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 30
                        )
                    )
                ),
                const SizedBox(height: 10),
                FutureBuilder(
                    future: Provider.of<WorkoutProvider>(context, listen: false).getWarmups,
                    builder: (ctx, snapshot) =>
                    snapshot.connectionState == ConnectionState.waiting
                ? Center(child: CircularProgressIndicator())
                  :
                    Consumer<WorkoutProvider>(
                      child: Center(
                        heightFactor: MediaQuery.of(context).size.height * 0.03,
                        child: const Text('You have no tasks.', style: TextStyle(fontSize: 18),),
                      ),
                      builder: (ctx, workoutProvider, child) => workoutProvider.warmups.isEmpty
                        ?  child as Widget
                          : Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: ListView.builder(
                                itemCount: workoutProvider.warmups.length,
                                itemBuilder: (ctx, i) => Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child:Container(
                                      height: 50,
                                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(primary: Colors.red, minimumSize: const Size.fromHeight(50)),
                                        child: Text(workoutProvider.warmups[i].workoutname + "     (" + workoutProvider.warmups[i].duration.toString() + " sec)", style: TextStyle(fontSize: 20)),
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LearnWorkout()));

                                        },
                                      )
                                  ),
                                )
                            ),
                          ),
                          ),
                    ),
                ),
                //const SizedBox(height: 10),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                        '   Main Exercises',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 30
                        )
                    )
                ),
                FutureBuilder(
                  future: Provider.of<WorkoutProvider>(context, listen: false).getMainWorkouts,
                  builder: (ctx, snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? Center(child: CircularProgressIndicator())
                      :
                  Consumer<WorkoutProvider>(
                    child: Center(
                      heightFactor: MediaQuery.of(context).size.height * 0.05,
                      child: const Text('You have no tasks.', style: TextStyle(fontSize: 18),),
                    ),
                    builder: (ctx, workoutProvider, child) => workoutProvider.mainworkouts.isEmpty
                        ?  child as Widget
                        : Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ListView.builder(
                            itemCount: workoutProvider.mainworkouts.length,
                            itemBuilder: (ctx, i) => Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child:Container(
                                  height: 50,
                                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(primary: Colors.red, minimumSize: const Size.fromHeight(50)),
                                    child: Text(workoutProvider.mainworkouts[i].workoutname + "     (" + workoutProvider.mainworkouts[i].duration.toString() + " sec)", style: TextStyle(fontSize: 20)),
                                    onPressed: () {
                                    },
                                  )
                              ),
                            )
                        ),
                      ),
                    ),
                  ),
                ),
                //const SizedBox(height: 10),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                        '   Cool Down',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 30
                        )
                    )
                ),
                FutureBuilder(
                  future: Provider.of<WorkoutProvider>(context, listen: false).getCooldowns,
                  builder: (ctx, snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? Center(child: CircularProgressIndicator())
                      :
                  Consumer<WorkoutProvider>(
                    child: Center(
                      heightFactor: MediaQuery.of(context).size.height * 0.03,
                      child: const Text('You have no tasks.', style: TextStyle(fontSize: 18),),
                    ),
                    builder: (ctx, workoutProvider, child) => workoutProvider.cooldowns.isEmpty
                        ?  child as Widget
                        : Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ListView.builder(
                            itemCount: workoutProvider.cooldowns.length,
                            itemBuilder: (ctx, i) => Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child:Container(
                                  height: 50,
                                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(primary: Colors.red, minimumSize: const Size.fromHeight(50)),
                                    child: Text(workoutProvider.cooldowns[i].workoutname + "     (" + workoutProvider.cooldowns[i].duration.toString() + " sec)", style: TextStyle(fontSize: 20)),
                                    onPressed: () {
                                    },
                                  )
                              ),
                            )
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "OR",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                const SizedBox(height: 20),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                        '   Recreation & Sports',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 30
                        )
                    )
                ),
                FutureBuilder(
                  future: Provider.of<WorkoutProvider>(context, listen: false).getRecreations,
                  builder: (ctx, snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? Center(child: CircularProgressIndicator())
                      :
                  Consumer<WorkoutProvider>(
                    child: Center(
                      heightFactor: MediaQuery.of(context).size.height * 0.03,
                      child: const Text('You have no tasks.', style: TextStyle(fontSize: 18),),
                    ),
                    builder: (ctx, workoutProvider, child) => workoutProvider.recreationals.isEmpty
                        ?  child as Widget
                        : Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ListView.builder(
                            itemCount: workoutProvider.recreationals.length,
                            itemBuilder: (ctx, i) => Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child:Container(
                                  height: 50,
                                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(primary: Colors.red, minimumSize: const Size.fromHeight(50)),
                                    child: Text(workoutProvider.recreationals[i].workoutname + "     (" + workoutProvider.recreationals[i].duration.toString() + " hr)", style: TextStyle(fontSize: 20)),
                                    onPressed: () {
                                    },
                                  )
                              ),
                            )
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
