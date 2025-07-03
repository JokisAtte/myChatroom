import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class UserController extends ChangeNotifier {
  String _userName;

  String get userName => _userName;

  UserController() : _userName = Faker().person.name();

  void setUsername(String newName) {
    _userName = newName;
    notifyListeners();
  }
}
