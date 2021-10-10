// api file that handles all the interaction with backend
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:contact_list/core/models/contact.dart';

class Api {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // * Add contact
  void addContact({
    String firstName,
    String lastName,
    String phoneNumber,
    String emailAddress,
  }) {
    _firestore.collection('contacts').add({
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'emailAddress': emailAddress,
    });
  }

  // * Edit contact (update)
  void updateContact({
    String firstName,
    String lastName,
    String phoneNumber,
    String emailAddress,
  }) {
    _firestore.collection('contacts').doc().update({
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'emailAddress': emailAddress,
    });
  }

  // * Delete contact
  void deleteContact({
    String firstName,
    String lastName,
    String phoneNumber,
    String emailAddress,
  }) {
    _firestore.collection('contacts').doc().delete();
  }

  // * Get contact
  Future<List<Contact>> getContacts() async {
    List<Contact> contacts = [];
    await FirebaseFirestore.instance
        .collection('contacts')
        .get()
        .then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        contacts.add(Contact(
            firstName: doc["firstName"],
            lastName: doc["lastName"],
            phoneNumber: doc["phoneNumber"],
            emailAddress: doc["emailAddress"]));
      }
    });
    return contacts;
  }
}
