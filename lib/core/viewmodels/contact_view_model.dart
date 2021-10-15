// * This is the contact view model. View model handles all the business logic and connects view and model.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_list/core/models/contact.dart';
import 'package:contact_list/core/services/api.dart';
import 'package:contact_list/core/viewmodels/base_model.dart';

class ContactViewModel extends BaseModel {
  final Api _api;

  ContactViewModel({Api api}) : _api = api;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // * ViewModel State
  String id = '';
  String firstName;
  String lastName = '';
  String phoneNumber = '';
  String emailAddress = '';
  List<Contact> contacts;
  bool valid = false;

  // * Email Validation
  String validateEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);

    if (email.isNotEmpty && !regex.hasMatch(email)) {
      return 'A valid email address is required for adding new contact.';
    }

    return null;
  }

  // * Get contacts;
  void getContacts() async {
    setBusy(true);
    contacts = await _api.getContacts();
    setBusy(false);
  }

  // * Get contacts stream
  Stream<QuerySnapshot<Map<String, dynamic>>> getContactsStream() {
    return _firestore.collection('contacts').snapshots();
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
