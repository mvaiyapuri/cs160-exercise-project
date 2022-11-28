class User {
  dynamic id;
  String username;
  String firstname;
  String lastname;
  String password;
  String dob;
  double height;
  double weight;
  String gender;
  String level;

  User(
      {this.id,
      required this.username,
      required this.firstname,
      required this.lastname,
      required this.password,
      required this.dob,
      required this.height,
      required this.weight,
      required this.gender,
      required this.level});

  User.fromJson(Map<String, dynamic> json)
    : username = json['username'],
    firstname = json['firstname'],
    lastname = json['lastname'],
    password = json['password'],
    dob = json['dob'],
    height = json['height'],
    weight = json['weight'],
    gender = json['gender'],
    level = json['level'];

  Map<String, dynamic> toJson() => {
    'username' : username,
    'firstname' : firstname,
    'lastname' : lastname,
    'password' : password,
    'dob' : dob,
    'height' : height,
    'weight' : weight,
    'gender' : gender,
    'level' : level,

  };
}
