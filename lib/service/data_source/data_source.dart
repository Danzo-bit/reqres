import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


 getUsers() async {
  var url = Uri.https('reqres.in', '/api/users?page=2');
  var response = await http.get(url);

  if (response.statusCode <= 300) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    // List usersRes = jsonResponse['data'];

    // for (var x = 0; x < usersRes.length; x++) {
    //   users.add(User.fromJson(usersRes[x]));
    // }
    // print(jsonResponse);
  return jsonResponse;

  }

  return null;
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


