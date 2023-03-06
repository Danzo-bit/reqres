import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../dio_data_source.dart';

List<User> users = [];

Future<List<User>> getUsers() async {
  var response = await Source().getUsers();

  var userList = response.data['data'] as List;

  for(var x =0; x < userList.length; x++){
    users.add(User.fromJson(userList[x]));
  }
  return users;
}

createUser(String name, String jobAppliedFor) async {
  var url = Uri.https('reqres.in', '/api/users');
  var response =
      await http.post(url, body: {"name": name, "job": jobAppliedFor});
  if (response.statusCode <= 300) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    print(jsonResponse);
    return 'User ${jsonResponse['name']} created';
  }

  return 'Creating user failed';
}

class User {
  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;

  User(this.id, this.email, this.first_name, this.last_name, this.avatar);

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        email = json["email"],
        first_name = json["first_name"],
        last_name = json["last_name"],
        avatar = json["avatar"];
}
