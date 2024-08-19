import 'dart:convert';
import 'dart:developer';
import 'package:expensemanager/authentication/login_screen.dart';
import 'package:expensemanager/authentication/signup_screen.dart';
import 'package:expensemanager/navigation/app_navigation.dart';
import 'package:expensemanager/utils/toaster.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier{
  bool _isLoading = false;
  late String _userName;
  String? _jwtToken ;
  DateTime? _expiryDate;
  bool get isAuthenticated {
    cheackToken();
    return _jwtToken != null && !JwtDecoder.isExpired(_jwtToken!);
  }
  bool get loading =>_isLoading;
  String? get token =>_jwtToken;
  String? get userName => _userName;

  void cheackToken()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    _jwtToken = pref.getString("token");
    //notifyListeners();
  } 

  void setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }
  void signUp(BuildContext context,String name, String userName, String password ) async {
    //checking and validating request 
      try {
        setLoading(true);
        var url = "https://expense-manager-xtsw.onrender.com/register";
        var data = {
              "name": name,
              "username": userName,
              "password": password
          };
        var headers = {"Content-Type": "application/json"};
        http.Response response = await http.post(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(data)
          );
      var res = jsonDecode(response.body);
      //if user is register then login to application 
      if (response.statusCode == 201) {
        Utils.message("${res["message"]}");
        Navigator.pushReplacement((context),MaterialPageRoute(builder:(context) => const LoginScreen(),) );
        setLoading(false);
      } 
      else {
        Utils.message("${res["message"]} Already registered");
        setLoading(false);
       
      }
    } catch (e) {
      Utils.message(e.toString());
      log(e.toString());
      setLoading(false);
    
    }
    }


  void signIn(BuildContext context, String userName, String password) async {
    setLoading(true);
    try {
      var url = "https://expense-manager-xtsw.onrender.com/login";
      var data = {
        "username": userName,
        "password": password,
      };
      var headers = {"Content-Type": "application/json"};
      http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(data),
      );
      var res = jsonDecode(response.body);
      if (response.statusCode == 200) {
        log("${res} this is response" );

        //Save username and jwt token for persestent storage
        _jwtToken = res["access_token"];
        _expiryDate = JwtDecoder.getExpirationDate(_jwtToken!);
        //_userName = res["username"];
        Utils.message("Successfully logged in");
        SharedPreferences prefs = await SharedPreferences.getInstance();
        //setting username and jwt token in shared pref
        await prefs.setString('token', _jwtToken!);
        await prefs.setString('expiryDate', _expiryDate!.toIso8601String());
        //await prefs.setString('username', _userName);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AppNavigation()));

      } else if (response.statusCode == 401) {
        Utils.message("Invalid credentials: ${res["message"]}");
      } else {
        log("${response.statusCode}");
        Utils.message("Unexpected error: ${res["message"]}");
      }
    } catch (e) {
      Utils.message(e.toString());
      log(e.toString()+ "here is log");
    } finally {
      setLoading(false);
    }
  }

   Future<void> signOut(BuildContext context) async {
    setLoading(true);
    try {
      _jwtToken = null;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
      await prefs.remove('expiryDate');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>const SignupScreen()),
      );
    } catch (e) {
      Utils.message(e.toString());
      log(e.toString());
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  Future<void> tryAutoLogin(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('token')) {
      return;
    }
    _jwtToken = prefs.getString('token');
     _expiryDate = DateTime.parse(prefs.getString('expiryDate')!);


    if (JwtDecoder.isExpired(_jwtToken!)) {
      signOut(context);
      return;
    }
   // _userName = prefs.getString("username")!;
    notifyListeners();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AppNavigation()),
    );
  }
  
}