import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

void startPeriodicServerCall() {
  // Create a Timer that calls the server every 60 seconds (1 minute)
  Timer.periodic(Duration(minutes: 1), (Timer timer) async {
    await callServer();
  });
}

Future<void> callServer() async {

   try {
        var url = "https://expense-manager-xtsw.onrender.com/register";
        var data = {
              // "name": name,
              // "username": userName,
              // "password": password
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
        log("${res["message"]} message from server");

      } 
      else {
        log("something with server gone wrong");
       
      }
    } catch (e) {
      log(e.toString());
    
    }
}
