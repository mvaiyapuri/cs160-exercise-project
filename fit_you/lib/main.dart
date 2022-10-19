import 'package:flutter/material.dart';

void main() => runApp(const Login());

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  static const String _title = 'Welcome';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: const Color(0xFFF7D5DB),
      ),
      home: Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text(_title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(70),
                child: const Text(
                  'FITYOU',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 70),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.redAccent),
                      borderRadius: BorderRadius.circular(50.0)
                  ),
                  labelText: 'Username: ',
                  labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)

                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(50.0)
                  ),
                  labelText: 'Password: ',
                  labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text('Forgot Password?',),
            ),
            Container(
                height: 80,
                padding: const EdgeInsets.fromLTRB(90, 0, 90, 0),
                child: ElevatedButton(
                  child: const Text('LOGIN', style: TextStyle(fontSize: 30)),
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
                  },
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Don\'t have an account?'),
                TextButton(
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignIn()),
                    );//signup screen
                  },
                )
              ],
            ),
          ],
        ));
  }
}
class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  static const String _title = 'Register';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: const Color(0xFFF7D5DB),
      ),
      home: Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text(_title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))),
        body: const MySignUpWidget(),
      ),
    );
  }
}
class MySignUpWidget extends StatefulWidget {
  const MySignUpWidget({Key? key}) : super(key: key);

  @override
  State<MySignUpWidget> createState() => _MySignUpWidgetState();
}

class _MySignUpWidgetState extends State<MySignUpWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 30),
            child: const Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 30
              )
            )
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 200, 10),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.redAccent),
                      borderRadius: BorderRadius.circular(50.0)
                  ),
                  labelText: 'Username: ',
                  labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)

              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 200, 10),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.redAccent),
                      borderRadius: BorderRadius.circular(50.0)
                  ),
                  labelText: 'First Name: ',
                  labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)

              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 200, 10),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.redAccent),
                      borderRadius: BorderRadius.circular(50.0)
                  ),
                  labelText: 'Date of Birth: ',
                  labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)

              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 200, 10),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.redAccent),
                      borderRadius: BorderRadius.circular(50.0)
                  ),
                  labelText: 'Height: ',
                  labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)

              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 200, 40),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.redAccent),
                      borderRadius: BorderRadius.circular(50.0)
                  ),
                  labelText: 'Weight: ',
                  labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)

              ),
            ),
          ),
          Container(
              height: 80,
              padding: const EdgeInsets.fromLTRB(90, 0, 90, 0),
              child: ElevatedButton(
                child: const Text('LOGIN', style: TextStyle(fontSize: 30)),
                onPressed: () {
                  print(nameController.text);
                  print(passwordController.text);
                },
              )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Have an account?'),
              TextButton(
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pop(context); //LogIn
                },
              )
            ],
          ),
        ]
      )
    );
  }
}
