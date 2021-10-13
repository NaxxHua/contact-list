// * This is the main page of the app. It consists a list of contact cards.

import 'package:contact_list/ui/views/contact_create_view.dart';
import 'package:contact_list/ui/views/contact_detail_view.dart';
import 'package:contact_list/ui/views/empty_content_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:contact_list/ui/widgets/contact_card.dart';
import 'package:contact_list/core/viewmodels/contact_view_model.dart';
import 'package:contact_list/ui/base_widget.dart';

// ignore: use_key_in_widget_constructors
class ContactView extends StatelessWidget {
  static const routeName = '/contact-view';

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
              appBar:
                  AppBar(title: const Text("Contact List"), actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add),
                  tooltip: 'Add new contact',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return const ContactCreateView();
                    }));
                  },
                ),
              ]),
              body: (model.contacts.isNotEmpty)
                  ? ListView.builder(
                      itemCount: model.contacts.length,
                      itemBuilder: (context, index) {
                        final contact = model.contacts[index];
                        return GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ContactDetailView(
                                        contact: contact,
                                      ))),
                          child: ContactCard(
                            contact: contact,
                          ),
                        );
                      })
                  : const EmptyContentView()),
    );
  }
}
