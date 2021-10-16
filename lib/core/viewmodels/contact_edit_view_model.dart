// * This is the contact edit view model.

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

  // * Delete Contact
  void deleteContact(id) async {
    setBusy(true);
    _api.deleteContact(id: id);
    setBusy(false);
  }
}
