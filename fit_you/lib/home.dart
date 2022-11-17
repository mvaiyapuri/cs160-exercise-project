import 'package:flutter/material.dart';
import 'Profile.dart';

//import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
            'Home',
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
            ]
        ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  height: 100,
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red, minimumSize: const Size.fromHeight(50)),
                    child: const Text('Current Workout Plan', style: TextStyle(fontSize: 18)),
                    onPressed: () {
                    },
                  )
              ),
              Container(
                  height: 100,
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red, minimumSize: const Size.fromHeight(50)),
                    child: const Text('Current Stats & Goals', style: TextStyle(fontSize: 18)),
                    onPressed: () {
                    },
                  )
              ),
              Container(
                  height: 100,
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red, minimumSize: const Size.fromHeight(50)),
                    child: const Text('Find a New Plan', style: TextStyle(fontSize: 18)),
                    onPressed: () {
                    },
                  )
              ),
              Align(
                alignment: AlignmentDirectional(0.95, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 240, 0, 0),
                  child: Image.asset(
                    'assets/FitYouLogo.png',
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
