import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

Future<void> saveUserDataToServer({
  required TextEditingController firstNameController,
  required TextEditingController lastNameController,
  required TextEditingController emailController,
  required TextEditingController addressController,
  required TextEditingController phoneNumberController,
}) async {
  try {
    final url = 'https://hassanhamdan.000webhostapp.com/SignUp.php';
    final response = await http.post(
      Uri.parse(url),
      body: json.encode({
        'firstName': firstNameController.text,
        'lastName': lastNameController.text,
        'email': emailController.text,
        'address': addressController.text,
        'phoneNumber': phoneNumberController.text,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('User data saved successfully');
    } else {
      print('Error saving user data: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (error) {
    print('Error saving user data: $error');
  }
}
