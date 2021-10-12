// * This is the contact view model. View model handles all the business logic and connects view and model.
import 'package:contact_list/core/models/contact.dart';
import 'package:contact_list/core/services/api.dart';
import 'package:contact_list/core/viewmodels/base_model.dart';

class ContactViewModel extends BaseModel {
  final Api _api;

  ContactViewModel({Api api}) : _api = api;

  // * ViewModel State
  String id = '';
  String firstName = '';
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
      print("Invalid contact info");
      valid = false;
    } else {
      print("Valid contact info");
      valid = true;
    }
  }

  // * Update Contact
  void updateContact() async {
    setBusy(true);
    _api.updateContact(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      emailAddress: emailAddress,
    );
    setBusy(false);
  }

  // * Delete Contact
  void deleteContact() async {
    setBusy(true);
    _api.deleteContact(id: id);
    setBusy(false);
  }
}
