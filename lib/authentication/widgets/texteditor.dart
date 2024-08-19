
import 'package:flutter/material.dart';

Widget textDailogBox(TextEditingController controller ,String hintText) {
  return Container(
    height: 49,
    width: 280,
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(9),
        ),
        color: Color.fromRGBO(255, 255, 255, 1),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              blurRadius: 10,
              spreadRadius: 3)
        ]),
    child: TextFormField(
      //controller: r,
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromRGBO(255, 255, 255, 1)),
            borderRadius: BorderRadius.circular(9),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromRGBO(255, 255, 255, 1)),
            borderRadius: BorderRadius.circular(9),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 1)),
          )),
       validator: (value) {
         if (controller.text.isEmpty) {
          return "Enter Valid ${controller.text}";
        } else {
          return null;
        }
       },
    ),
  );
}
