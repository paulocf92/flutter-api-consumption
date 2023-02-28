import 'package:flutter/material.dart';
import 'package:flutter_list/models/user_model.dart';
import 'package:flutter_list/repositories/users_repository.dart';
import 'package:flutter_list/repositories/users_repository_impl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UsersRepository usersRepository = UsersRepositoryImpl();
  List<UserModel>? usersModel;
  bool loading = true;
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  void requestData() async {
    try {
      setState(() {
        loading = true;
      });
      final users = await usersRepository.getAllUsers();
      setState(() {
        loading = false;
        usersModel = users;
      });
    } catch (e) {
      setState(() {
        loading = false;
        usersModel = null;
      });
      _messengerKey.currentState?.showSnackBar(
        const SnackBar(content: Text('Error when requesting data!')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    requestData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      scaffoldMessengerKey: _messengerKey,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Users List'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Visibility(
                    visible: loading, child: const CircularProgressIndicator()),
                Visibility(
                  visible: usersModel != null,
                  child: Expanded(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          alignment: Alignment.center,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.orange[300],
                              borderRadius: BorderRadius.circular(14)),
                          child: const Text(
                            'Names',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: usersModel?.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Center(
                                  child: Text(
                                    usersModel![index].first_name,
                                  ),
                                ),
                                onTap: () {},
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
