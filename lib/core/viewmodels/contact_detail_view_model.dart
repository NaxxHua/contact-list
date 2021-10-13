// * This is the contact detail view model. View model handles all the business logic and connects view and model.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_list/core/services/api.dart';
import 'package:contact_list/core/viewmodels/base_model.dart';
import 'package:contact_list/core/models/contact.dart';

class ContactDetailViewModel extends BaseModel {
  final Api _api;

  ContactDetailViewModel({Api api}) : _api = api;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // * ViewModel State
  String id = '';
  String firstName;
  String lastName = '';
  String phoneNumber = '';
  String emailAddress = '';
  List<Contact> contact;

  // * Get a contact
  Stream<DocumentSnapshot<Map<String, dynamic>>> getContactStream(String id) {
    return _firestore.collection('contacts').doc(id).snapshots();
  }
}
