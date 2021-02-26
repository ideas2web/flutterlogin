import 'package:flutter/material.dart';
import 'auth.dart';
import 'loginPage.dart';
import 'home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(
        ChangeNotifierProvider<AuthService>(
          child: MyApp(),
          create: (BuildContext context) {
            return AuthService();
        },
      ),
    );
    

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
        future: Provider.of<AuthService>(context).getUser(),
        builder: (context, AsyncSnapshot snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            return snapshot.hasData ? HomePage() : LoginPage();
          }else{
            return Container(color: Colors.white);
          }
        },
      ),
    );
  }
}

