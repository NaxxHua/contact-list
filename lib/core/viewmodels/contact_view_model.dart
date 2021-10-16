// * This is the contact view model.

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:contact_list/core/services/api.dart';
import 'package:contact_list/core/viewmodels/base_model.dart';

class ContactViewModel extends BaseModel {
  final Api _api;

  ContactViewModel({Api api}) : _api = api;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // * Get contacts stream
  Stream<QuerySnapshot<Map<String, dynamic>>> getContactsStream() {
    return _firestore.collection('contacts').snapshots();
  }
}
