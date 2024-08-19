import 'dart:convert';
import 'dart:developer';
import 'package:expensemanager/categories/category.dart';
import 'package:expensemanager/utils/toaster.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Category> _categories = [];
  bool _isLoading = false;
  String? _imageUrl;
  String? _categoriesName;

  bool get loading =>_isLoading;
  List<Category> get categories => _categories;

    void setLoading(bool value){
    _isLoading = value;
    notifyListeners();
    }

  Future<String> getAuthToken() async {
  // Retrieve your token from secure storage, a provider, or an API call
  // For example, you might get the token from SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token')!;
    }

void addCategory(String imageUrl, String categoriesName) async {
  _imageUrl = imageUrl;
  _categoriesName = categoriesName;

  try {
    setLoading(true);

    var url = "https://expense-manager-xtsw.onrender.com/categories";
    var data = {
      "name": categoriesName,
      "description": "",
      "image_url": imageUrl,
    };

    // Get the auth token
    String token = await getAuthToken();

    // Set headers with authorization
    var headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    // Make the POST request
    http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(data),
    );

    // Handle the response
    if (response.statusCode == 201) {
      Utils.message("Category created successfully", Colors.green);
    } else {
      Utils.message("Something went wrong, try again", Colors.red);
    }
  } catch (e) {
    Utils.message("Error: ${e.toString()}", Colors.red);
    log(e.toString());
  } finally {
    setLoading(false);
  }
}
void getCategories() async {
    setLoading(true);
    try {
      String? token = await getAuthToken();
      if (token == null) {
        throw Exception('No JWT token found');
      }
      const String url = "https://expense-manager-xtsw.onrender.com/categories";
      final headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      };
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        _categories = parseCategories(response.body);
      } else {
        Utils.message("Failed to load categories", Colors.red);
      }
    } catch (e) {
      Utils.message("Error: ${e.toString()}", Colors.red);
      log(e.toString());
    } finally {
      setLoading(false);
    }
  }

  
}