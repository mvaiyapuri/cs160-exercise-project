import 'package:fit_you/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';

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
class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  static const String _title = 'Register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7D5DB),
      appBar: AppBar(
          centerTitle: true,
          title: const Text(_title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))
      ),
        body: const MySignUpWidget(),
    );
  }
}
class MySignUpWidget extends StatefulWidget {
  const MySignUpWidget({Key? key}) : super(key: key);

  @override
  State<MySignUpWidget> createState() => _MySignUpWidgetState();
}

class _MySignUpWidgetState extends State<MySignUpWidget> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  var _genders = ["Female", "Male", "Other"];
  var _levels = ["Beginner", "Intermediate", "Advanced"];
  String gendervalue = "Female";
  String levelvalue = "Beginner";
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                    )
                )
              ),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors.redAccent),
                            borderRadius: BorderRadius.circular(50.0)
                          ),
                          labelText: 'Username:',
                          labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)

                        )
                      )
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                      child: TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 3, color: Colors.redAccent),
                                  borderRadius: BorderRadius.circular(50.0)
                              ),
                              labelText: 'Password:',
                              labelStyle: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)
                          )
                      )
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                          controller: firstNameController,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 3, color: Colors.redAccent),
                                  borderRadius: BorderRadius.circular(50.0)
                              ),
                              labelText: 'First Name:',
                              labelStyle: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)
                          )
                      )
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                      child: TextField(
                          controller: lastNameController,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 3, color: Colors.redAccent),
                                  borderRadius: BorderRadius.circular(50.0)
                              ),
                              labelText: 'Last Name:',
                              labelStyle: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)
                          )
                      )
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                          controller: dobController,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 3, color: Colors.redAccent),
                                  borderRadius: BorderRadius.circular(50.0)
                              ),
                              labelText: 'Date of Birth:',
                              labelStyle: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)
                          ),
                          keyboardType: TextInputType.datetime,
                      )
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: DropdownButton<String>(
                      value: gendervalue,
                      iconEnabledColor: Colors.red,

                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.red
                      ),
                      onChanged: (String? value){
                        setState((){
                          gendervalue = value!;
                        });
                      },
                      items: _genders.map((String value){
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value)
                        );
                      }).toList(),

                    )
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                        controller: heightController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(width: 3, color: Colors.redAccent),
                                borderRadius: BorderRadius.circular(50.0)
                            ),
                            labelText: 'Height:',
                            labelStyle: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                            suffixText: 'cm',
                            suffixStyle: const TextStyle(color: Colors.red),
                        ),
                        keyboardType: TextInputType.datetime,
                      )
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                      child: DropdownButton<String>(
                        value: levelvalue,
                        iconEnabledColor: Colors.red,
                        style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                        underline: Container(
                            height: 2,
                            color: Colors.red
                        ),
                        onChanged: (String? value){
                          setState((){
                            levelvalue = value!;
                          });
                        },
                        items: _levels.map((String value){
                          return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value)
                          );
                        }).toList(),

                      )
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 20, 200, 40),
                child: TextField(
                  controller: weightController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.redAccent),
                        borderRadius: BorderRadius.circular(50.0)
                    ),
                    labelText: 'Weight: ',
                    labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    suffixText: 'lb',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                  width: double.infinity,
                  height: 80,
                  padding: const EdgeInsets.fromLTRB(90, 0, 90, 0),
                  child: ElevatedButton(

                    child: const Text('LOGIN', style: TextStyle(fontSize: 25)),
                    onPressed: () {
                      Provider.of<UserProvider>(context, listen: false).addUser(usernameController.text, firstNameController.text, lastNameController.text, passwordController.text, dobController.text, double.parse(heightController.text), double.parse(weightController.text), gendervalue, levelvalue);
                    },
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Have an account?', style: TextStyle(fontSize: 17)),
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
            ],
          ),


    );
  }
}
