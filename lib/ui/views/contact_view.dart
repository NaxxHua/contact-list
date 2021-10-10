import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:contact_list/ui/widgets/contact_card.dart';
import 'package:contact_list/core/viewmodels/contact_view_model.dart';
import 'package:contact_list/core/models/contact.dart';
import 'package:contact_list/ui/base_widget.dart';

class ContactView extends StatelessWidget {
  static const routeName = '/contact-view';
  final Contact contact;

  ContactView({this.contact});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ContactViewModel>(
      model: ContactViewModel(api: Provider.of(context)),
      onModelReady: (model) {
        model.getContacts();
      },
      builder: (context, model, _) => model.busy
          ? Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Scaffold(
              //TODO: styling
              appBar: AppBar(),
              body: SafeArea(
                child: Expanded(
                  child: ListView.builder(itemBuilder: (context, index) {
                    return ContactCard();
                  }),
                ),
              )),
    );
  }
}
