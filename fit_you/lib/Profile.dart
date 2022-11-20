import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';

class TasksWidget extends StatefulWidget {
  const TasksWidget({Key? key}) : super(key: key);

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  TextEditingController newTaskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: newTaskController,
                  decoration: InputDecoration(
                    labelText: 'New Task',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: 10,),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.amberAccent),
                  foregroundColor: MaterialStateProperty.all(Colors.purple)
                ),
               child: Text("Add"),
                onPressed: () {
                }
              )
            ],
          ),
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
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: ListView.builder(
                      itemBuilder: (ctx, i) => Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: ListTile(
                        tileColor: Colors.black12,
                        leading: Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 30,
                        ),
                      title: Text(snapshot.data!.username),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: ()  {
                        }
                      ) ,
                      onTap: () {},
    ),
    )
    ),
    ),
    ),
    ),
    )
    ],
    ),
    );
    }
}
class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: UserProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          home: const MyHomePage(title: 'Todo app'),
        )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: TasksWidget(),
    );
  }
}