class ApiUserModel {
  ApiUserModel({
    required this.name,
    required this.surname,
    required this.age,
    required this.password,
    required this.mail,
    required this.phoneNumber,
    required this.address,
  });
  final String name;
  final String surname;
  final int age;
  final String password;
  final String mail;
  final int phoneNumber;
  final String address;

  factory ApiUserModel.fromJson(Map<String, dynamic> json) => ApiUserModel(
        name: json["name"],
        surname: json["surname"],
        age: json["age"],
        password: json["password"],
        mail: json["mail"],
        phoneNumber: json["phoneNumber"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "name": name,
        "surname": surname,
        "age": age,
        "password": password,
        "mail": mail,
        "phoneNumber": phoneNumber,
        "address": address,
      };
}
