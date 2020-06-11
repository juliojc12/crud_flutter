import 'package:crud_cod3r/components/user_tile.dart';
import 'package:crud_cod3r/models/user.dart';
import 'package:crud_cod3r/provider/users.dart';
import 'package:crud_cod3r/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("User List"),
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (context, index) => UserTile(users.byIndex(index)),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
        },
      ),
    );
  }
}
