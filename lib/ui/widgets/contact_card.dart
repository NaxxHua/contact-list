// * This is the contact card widget which is used in contact view

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
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          border: Border(bottom: BorderSide(color: Colors.grey[300]))),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: smallSpace(context),
          vertical: mediumSpace(context) * 0.6,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // The avatar has Visa branding gold color
            CircleAvatar(
              backgroundColor: Colors.grey[100],
              foregroundImage: AssetImage('assets/user_icon.png'),
              radius: mediumSpace(context),
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
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(color: Colors.grey[500], fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
