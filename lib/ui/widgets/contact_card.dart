import 'package:flutter/material.dart';

import 'package:contact_list/core/models/contact.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;

  ContactCard({
    this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(contact.firstName));
  }
}
