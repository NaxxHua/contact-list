// * This is the contact detail widget.

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:contact_list/ui/shared/size_helper.dart';

class ContactDetailCard extends StatelessWidget {
  final DocumentSnapshot<Object> contact;

  const ContactDetailCard({
    Key key,
    this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Column(children: [
                  SizedBox(
                    height: largeSpace(context) * 2.2,
                  ),
                  const CircleAvatar(
                    radius: 65.0,
                    backgroundImage: AssetImage('assets/user_icon.png'),
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                    height: mediumSpace(context) * 1.2,
                  ),
                  Text(contact['firstName'] + ' ' + contact['lastName'],
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .copyWith(color: Colors.white, fontSize: 36)),
                ]),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.grey[200],
                child: Center(
                    child: Card(
                        margin: EdgeInsets.fromLTRB(
                            mediumSpace(context),
                            smallSpace(context) * 1.5,
                            mediumSpace(context),
                            mediumSpace(context)),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.phone,
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    "123",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.grey[400],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.email,
                                    color: Colors.yellowAccent[400],
                                    size: 35,
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    "123",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.grey[400],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ))),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
