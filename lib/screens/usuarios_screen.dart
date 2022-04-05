import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:chat_app/models/user_model.dart';

class UsuariosScreen extends StatefulWidget {
  const UsuariosScreen({Key? key}) : super(key: key);
  @override
  State<UsuariosScreen> createState() => _UsuariosScreenState();
}

class _UsuariosScreenState extends State<UsuariosScreen> {
  List<UserModel> users = [
    UserModel(name: 'Pedrito', email: 'pedrito@gmail.com', status: true),
    UserModel(name: 'Juanita', email: 'juanita@gmail.com', status: false),
    UserModel(name: 'Sonia', email: 'sonia@gmail.com', status: true),
  ];

  ///////////////////////
  /// pull to refresh ///
  ///////////////////////

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///////////////////////
      /// appbar ///
      ///////////////////////
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: const Icon(Icons.input, color: Colors.black54),
        title: const Text('Mi nombre', style: TextStyle(color: Colors.black54)),
        actions: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(Icons.check_circle, color: Colors.green),
          )
        ],
      ),

      ///////////////////////
      /// body ///
      ///////////////////////
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        enablePullDown: true,
        enablePullUp: true,
        header: const WaterDropHeader(
          waterDropColor: Colors.blueAccent,
          complete: Icon(
            Icons.check_circle_outline,
            color: Colors.blueAccent,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: users.length,
            separatorBuilder: (BuildContext context, int index) => const Divider(),
            itemBuilder: (BuildContext context, int i) {
              return UserTile(user: users[i]);
            },
          ),
        ),
      ),
    );
  }
}

class UserTile extends StatelessWidget {
  const UserTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(
          user.name.substring(0, 2),
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[500],
      ),
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Icon(Icons.circle, size: 10, color: user.status == true ? Colors.green : Colors.red),
    );
  }
}
