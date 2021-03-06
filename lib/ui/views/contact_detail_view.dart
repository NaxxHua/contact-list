// * This is the page that displays detail of contact.

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:contact_list/core/viewmodels/contact_detail_view_model.dart';
import 'package:contact_list/ui/base_widget.dart';
import 'package:contact_list/ui/widgets/contact_detail_card.dart';
import 'package:contact_list/ui/views/contact_edit_view.dart';

class ContactDetailView extends StatefulWidget {
  static const routeName = '/contact-detail-view';

  const ContactDetailView({Key key, this.contact}) : super(key: key);

  final QueryDocumentSnapshot<Object> contact;

  @override
  State<ContactDetailView> createState() => _ContactDetailViewState();
}

class _ContactDetailViewState extends State<ContactDetailView> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<ContactDetailViewModel>(
        model: ContactDetailViewModel(api: Provider.of(context)),
        builder: (context, model, _) => model.busy
            ? const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : StreamBuilder(
                stream: model.getContactStream(widget.contact.id),
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
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
                      extendBodyBehindAppBar: true,
                      // This prevents exception "Bad state: cannot get a field on a DocumentSnapshotPlatform which does not exist"
                      // This step won't affect user experience at all
                      body: (snapshot.data.exists)
                          ? Stack(children: <Widget>[
                              ContactDetailCard(
                                contact: snapshot.data,
                              ),
                              Positioned(
                                top: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: AppBar(
                                  leading: IconButton(
                                    icon: const Icon(Icons.arrow_back_ios),
                                    color: Colors.white,
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ContactEditView(
                                                      contact: snapshot.data,
                                                    ))),
                                        child: Text("Edit",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2))
                                  ],
                                  backgroundColor: Colors.transparent,
                                  bottomOpacity: 0.0,
                                  elevation: 0.0,
                                ),
                              )
                            ])
                          : const Scaffold(
                              body: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ));
                }));
  }
}
