// * This is the contact create view model.

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:contact_list/core/services/api.dart';
import 'package:contact_list/core/viewmodels/base_model.dart';

class ContactCreateViewModel extends BaseModel {
  final Api _api;

  ContactCreateViewModel({Api api}) : _api = api;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // * ViewModel State
  String id = '';
  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  String emailAddress = '';
  bool valid = false;

  // * Email Validation
  String validateEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);

    if (email.isNotEmpty && !regex.hasMatch(email)) {
      return 'A valid email address is required for adding a new contact.';
    }

    return null;
  }

  // * Create Contact
  void createContact() async {
    setBusy(true);
    bool result = await _api.createContact(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      emailAddress: emailAddress,
    );
    setBusy(false);
    if (result == false) {
      valid = false;
    } else {
      valid = true;
    }
  }
}
