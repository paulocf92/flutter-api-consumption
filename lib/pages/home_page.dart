import 'package:flutter/material.dart';
import 'package:flutter_list/models/user_model.dart';
import 'package:flutter_list/pages/widgets/user_tile.dart';
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
        primarySwatch: Colors.deepPurple,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                    visible: loading, child: const CircularProgressIndicator()),
                Visibility(
                  visible: usersModel != null,
                  child: Expanded(
                    child: ListView.separated(
                      itemCount: usersModel?.length ?? 0,
                      itemBuilder: (context, index) {
                        return UserTile(
                          user: usersModel![index],
                          callback: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'User: ${usersModel![index].first_name}'),
                              ),
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, _) =>
                          const SizedBox(height: 10),
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
