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
}
