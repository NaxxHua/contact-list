// This is what is displayed when the contact list is empty

import 'package:flutter/material.dart';

class EmptyContentView extends StatelessWidget {
  const EmptyContentView({
    Key key,
    this.title = 'Nothing here',
    this.message = 'Add a new contact to get started',
  }) : super(key: key);
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontSize: 32.0, color: Theme.of(context).primaryColorLight),
          ),
          Text(
            message,
            style: TextStyle(
                fontSize: 16.0, color: Theme.of(context).primaryColorLight),
          ),
        ],
      ),
    );
  }
}
