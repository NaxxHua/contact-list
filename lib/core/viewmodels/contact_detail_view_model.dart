// * This is the contact detail view model.

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:contact_list/core/services/api.dart';
import 'package:contact_list/core/viewmodels/base_model.dart';

class ContactDetailViewModel extends BaseModel {
  final Api _api;

  ContactDetailViewModel({Api api}) : _api = api;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // * Get the contact based on id
  Stream<DocumentSnapshot<Map<String, dynamic>>> getContactStream(String id) {
    return _firestore.collection('contacts').doc(id).snapshots();
  }
}
