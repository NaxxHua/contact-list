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

  // * Get contacts;
  void getContacts() async {
    setBusy(true);
    contacts = await _api.getContacts();
    setBusy(false);
  }

  // * Create Contact
  void createContact() async {
    setBusy(true);
    _api.addContact(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      emailAddress: emailAddress,
    );
    setBusy(false);
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
