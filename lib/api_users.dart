import 'package:api_users/profil_page.dart';
import 'package:api_users/service/remote_service.dart';
import 'package:flutter/material.dart';

import 'models/user_model.dart';

class ApiUsers extends StatefulWidget {
  const ApiUsers({super.key});

  @override
  State<ApiUsers> createState() => _ApiUsersState();
}

class _ApiUsersState extends State<ApiUsers> {
  List<Users>? users;
  var isLoaded = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    users = await RemoteService().getUsers();
    if (users != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Center(
          child: Text(
            'Users',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: users?.length,
          itemBuilder: ((context, index) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[300],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const ProfilPage();
                        }));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            users![index].name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            users![index].username,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            users![index].email,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            users![index].phone,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            users![index].website,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

// class ApiUsers extends StatefulWidget {
//   const ApiUsers({super.key});

//   @override
//   State<ApiUsers> createState() => _ApiUsersState();
// }

// class _ApiUsersState extends State<ApiUsers> {
//   getUserData() async {
//     var response =
//         await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));
//     var jsonData = jsonDecode(response.body);
//     List<User> users = [];

//     for (var u in jsonData) {
//       User user = User(u["name"], u["email"], u["username"]);
//       users.add(user);
//     }
//     print(users.length);
//     return users;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('User Data'),
//       ),
//       body: Card(
//         child: FutureBuilder(
//             future: getUserData(),
//             builder: (context, snapshot) {
//               if (snapshot.data == null) {
//                 return const Center(
//                   child: Text('Loading...'),
//                 );
//               } else {
//                 return ListView.builder(
//                   itemCount: snapshot.data.length,
//                   itemBuilder: (context, i) {
//                     return ListTile(
//                       title: Text(snapshot.data[i].name),
//                       subtitle: Text(snapshot.data[i].userName),
//                       trailing: Text(snapshot.data[i].email),
//                     );
//                   },
//                 );
//               }
//             }),
//       ),
//     );
//   }
// }

// class User {
//   final String name, email, userName;
//   User(this.name, this.email, this.userName);
// }
