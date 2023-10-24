class Users {
  String firstName, lastName, email, password;

  Users(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }
}

List<Users> listUsers = [
  Users(
      firstName: 'Santiago',
      lastName: 'Gomez',
      email: 'santiago',
      password: '123'),
  Users(
      firstName: 'Jeison', lastName: 'Perez', email: 'jeison', password: '123'),
  Users(firstName: 'Juan', lastName: 'Lopez', email: 'juan', password: '123'),
];
