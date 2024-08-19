import 'dart:developer';

import 'package:expensemanager/authentication/signup_screen.dart';
import 'package:expensemanager/navigation/app_navigation.dart';
import 'package:expensemanager/navigation/splash_screen.dart';
import 'package:expensemanager/providers/auth_provider.dart';
import 'package:expensemanager/providers/categories_provider.dart';
import 'package:expensemanager/server_alive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
  startPeriodicServerCall();
}

//This app flows feature wise development architecture
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ 
        //auth
        ChangeNotifierProvider(create:(_) => AuthProvider(),),
        ChangeNotifierProvider(create:(_) => CategoriesProvider(),)
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Consumer<AuthProvider>(
        builder: (context, authProvider, _) {
          //log("${authProvider.isAuthenticated} here is the token problem in main file" );
          return authProvider.isAuthenticated ?const AppNavigation() :const SplashScreen();
        },
      ),
      ),
    );
  }
}

