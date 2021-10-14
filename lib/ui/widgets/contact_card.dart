// * This is the contact card widget.

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:contact_list/ui/shared/size_helper.dart';

class ContactCard extends StatelessWidget {
  final DocumentSnapshot<Object> contact;

  const ContactCard({
    Key key,
    this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: smallSpace(context) * 0.4,
        vertical: smallSpace(context) * 0.7,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: smallSpace(context),
          vertical: smallSpace(context),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.grey[100],
              foregroundImage: AssetImage('assets/user_icon.png'),
              radius: smallSpace(context) * 2.5,
            ),
            SizedBox(
              width: mediumSpace(context) * 0.4,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  contact['firstName'] + " " + contact['lastName'],
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: smallSpace(context) * 0.1,
                ),
                Text(contact['phoneNumber'],
                    style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
