import 'package:flutter/material.dart';

class AuthFormField extends StatelessWidget {
  final Function validator;
  final hintText;
  final labelText;
  final suffixIcon;
  final errorText;
  final Function onSaved;
  final Function onChanged;
  final bool autofocus;
  final TextEditingController controller;

  AuthFormField({
    this.validator,
    this.hintText,
    this.suffixIcon,
    this.onSaved,
    this.labelText,
    this.autofocus,
    this.controller,
    this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: autofocus == null ? false : true,

      // Pass in validation function from parent widget.
      validator: validator,
      onChanged: onChanged,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
      ),
      // Save the value in textfield
      onSaved: onSaved,
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        errorMaxLines: 2,
        helperText: ' ',
        contentPadding: EdgeInsets.all(20),
        filled: true,
        fillColor: Colors.white,
        focusColor: Theme.of(context).primaryColor,
        hintText: hintText,
        errorText: errorText,
        errorStyle: Theme.of(context).textTheme.bodyText2.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.red[400],
            ),
        hintStyle: TextStyle(
          color: Theme.of(context).primaryColor.withOpacity(0.3),
        ),
        labelText: labelText,
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 0.0),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: suffixIcon,
        focusedErrorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 0.0),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 0.0),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
