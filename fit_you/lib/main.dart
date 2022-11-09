import 'package:fit_you/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SignUp.dart';
import '../provider/user_provider.dart';

void main() => runApp(const Login());

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  static const String _title = 'Welcome';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: UserProvider(),
      child:  MaterialApp(
        title: _title,
        theme: ThemeData(
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: const Color(0xFFF7D5DB),
        ),
        home: Scaffold(
          appBar: AppBar(centerTitle: true, title: const Text(_title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))),
          body: const MyStatefulWidget(),
        ),
      )
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
                const Text('Don\'t have an account?', style: TextStyle(fontSize: 17)),
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

