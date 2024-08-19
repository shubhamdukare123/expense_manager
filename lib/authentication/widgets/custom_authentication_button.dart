
import 'package:flutter/material.dart';

Widget customAuthButtton(String buttonName){
  return Container(
    height: 49,
    width: 280,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(9),
      color: const Color.fromRGBO(14, 161, 125, 1),
    ),
    child:  Center(
      child: Text(buttonName,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white)),
    ),
  );
}
