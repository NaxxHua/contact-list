import 'package:contact_list/core/models/contact.dart';
import 'package:contact_list/core/services/api.dart';
import 'package:contact_list/core/viewmodels/base_model.dart';

class ContactViewModel extends BaseModel {
  final Api _api;

  ContactViewModel({Api api}) : _api = api;

  // * View Model State Variables
  List<Contact> contacts;

  // * Get contacts;
  void getContacts() async {
    setBusy(true);
    contacts = await _api.getContacts();
    setBusy(false);
  }
}
