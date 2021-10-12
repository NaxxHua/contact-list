// * This is the page that users can edit contact information.

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:contact_list/ui/widgets/contact_card.dart';
import 'package:contact_list/core/viewmodels/contact_view_model.dart';
import 'package:contact_list/ui/base_widget.dart';

class ContactEditView extends StatelessWidget {
  static const routeName = '/contact-edit-view';

  const ContactEditView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ContactViewModel>(
      model: ContactViewModel(api: Provider.of(context)),
      onModelReady: (model) {
        model.getContacts();
      },
      builder: (context, model, _) => model.busy
          ? const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Scaffold(
              appBar: AppBar(),
              body: ListView.builder(
                  itemCount: model.contacts.length,
                  itemBuilder: (context, index) {
                    final contact = model.contacts[index];
                    return ContactCard(
                      contact: contact,
                    );
                  })),
    );
  }
}
