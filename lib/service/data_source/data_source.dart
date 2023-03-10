
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
  var response =
      await Source().createUser(name, jobAppliedFor);
  
  return response.data;
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
