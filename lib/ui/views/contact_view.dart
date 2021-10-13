// * This is the main page of the app. It consists a list of contact cards.

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:contact_list/ui/widgets/contact_card.dart';
import 'package:contact_list/core/viewmodels/contact_view_model.dart';
import 'package:contact_list/ui/base_widget.dart';
import 'package:contact_list/ui/views/contact_create_view.dart';
import 'package:contact_list/ui/views/contact_detail_view.dart';
import 'package:contact_list/ui/views/empty_content_view.dart';

class ContactView extends StatefulWidget {
  static const routeName = '/contact-view';

  const ContactView({Key key}) : super(key: key);

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<ContactViewModel>(
        model: ContactViewModel(api: Provider.of(context)),
        builder: (context, model, _) => model.busy
            ? const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : StreamBuilder<QuerySnapshot>(
                stream: model.getContactsStream(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Scaffold(
                      body: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return Scaffold(
                      appBar: AppBar(
                          title: const Text("Contact List"),
                          actions: <Widget>[
                            IconButton(
                              icon: const Icon(Icons.add),
                              tooltip: 'Add new contact',
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) {
                                  return const ContactCreateView();
                                }));
                              },
                            ),
                          ]),
                      //       body: (model.contacts.isNotEmpty)
                      //           ? ListView.builder(
                      //               itemCount: model.contacts.length,
                      //               itemBuilder: (context, index) {
                      //                 final contact = model.contacts[index];
                      //                 return GestureDetector(
                      //                   onTap: () => Navigator.push(
                      //                       context,
                      //                       MaterialPageRoute(
                      //                           builder: (context) =>
                      //                               ContactDetailView(
                      //                                 contact: contact,
                      //                               ))),
                      //                   child: ContactCard(
                      //                     contact: contact,
                      //                   ),
                      //                 );
                      //               })
                      //           : const EmptyContentView());
                      // }));
                      body: (snapshot.data.docs.isNotEmpty)
                          ? ListView.builder(
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ContactDetailView(
                                        contact: snapshot.data.docs[index],
                                      ),
                                    ),
                                  ),
                                  child: ContactCard(
                                    contact: snapshot.data.docs[index],
                                  ),
                                );
                              })
                          : const EmptyContentView());
                }));
  }
}
