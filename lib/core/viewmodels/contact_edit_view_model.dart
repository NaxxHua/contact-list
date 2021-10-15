// * This is the contact edit view model. View model handles all the business logic and connects view and model.
import 'package:contact_list/core/models/contact.dart';
import 'package:contact_list/core/services/api.dart';
import 'package:contact_list/core/viewmodels/base_model.dart';

class ContactEditViewModel extends BaseModel {
  final Api _api;

  ContactEditViewModel({Api api}) : _api = api;

  // * ViewModel State
  String id = '';
  String firstName;
  String lastName = '';
  String phoneNumber = '';
  String emailAddress = '';
  List<Contact> contacts;

  // * Update Contact
  void updateContact(id) async {
    setBusy(true);
    _api.updateContact(
      id: id,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      emailAddress: emailAddress,
    );
    setBusy(false);
  }

  // * Get contacts;
  void getContacts() async {
    setBusy(true);
    contacts = await _api.getContacts();
    setBusy(false);
  }

  // * Delete Contact
  void deleteContact(id) async {
    setBusy(true);
    _api.deleteContact(id: id);
    setBusy(false);
  }
}
