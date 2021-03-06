import 'package:flutter/material.dart';
import 'package:panik_musik/constants/validators.dart';

Container textFormField(
  TextEditingController textEditingController,
  String hintText,
  bool obscureText,
  BuildContext context
  ){
  return Container(
    margin: const EdgeInsets.only(bottom: 20),
    child: TextFormField(
      controller: textEditingController,
      obscureText: obscureText,
      decoration: InputDecoration(  
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyText1,
        enabledBorder: OutlineInputBorder(  
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 3.0,
            color: Theme.of(context).primaryColor
          )
        ),
        focusedBorder: OutlineInputBorder(  
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 4.0
          )
        ),
        errorBorder: OutlineInputBorder(  
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 3.0
          )
        ),
        focusedErrorBorder : OutlineInputBorder(  
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 4.0
          )
        ),
      ),
      validator: (hintText=='email')?emailValidator:passwordValidator
    )
  );
}