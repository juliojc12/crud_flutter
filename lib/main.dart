import 'package:crud_cod3r/provider/users.dart';
import 'package:crud_cod3r/routes/app_routes.dart';
import 'package:crud_cod3r/views/user_form.dart';
import 'package:crud_cod3r/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Users(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter CRUD',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.USER_FORM: (_) => UserForm(),
        },
      ),
    );
  }
}
