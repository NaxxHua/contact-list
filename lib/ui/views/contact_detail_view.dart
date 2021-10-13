// * This is the page that displays detail of contact.

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:contact_list/core/models/contact.dart';
import 'package:contact_list/core/viewmodels/contact_view_model.dart';
import 'package:contact_list/ui/base_widget.dart';
import 'package:contact_list/ui/shared/size_helper.dart';
import 'package:contact_list/ui/views/contact_edit_view.dart';

class ContactDetailView extends StatelessWidget {
  static const routeName = '/contact-detail-view';

  const ContactDetailView({Key key, this.contact}) : super(key: key);

  final Contact contact;

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
          : Scaffold(
              appBar: AppBar(
                title: const Text(''),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactEditView(
                                    contact: contact,
                                  ))),
                      child: Text("Edit",
                          style: Theme.of(context).textTheme.bodyText2))
                ],
                backgroundColor: Theme.of(context)
                    .primaryColor, //You can make this transparent
                elevation: 0.0, //No shadow
              ),
              body: Stack(children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: smallSpace(context) * 0.4,
                    vertical: smallSpace(context) * 0.15,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).shadowColor,
                        blurRadius: 20,
                        spreadRadius: 2,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: smallSpace(context) * 0.5,
                          vertical: smallSpace(context) * 0.5,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: <Widget>[
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            blurRadius: 40,
                                            color:
                                                Theme.of(context).shadowColor,
                                            offset: const Offset(1, 1),
                                          ),
                                        ],
                                      ),
                                      child: CircleAvatar(
                                        backgroundImage: const NetworkImage(
                                            'https://www.minervastrategies.com/wp-content/uploads/2016/03/default-avatar.jpg'),
                                        radius: smallSpace(context) * 2,
                                      ),
                                    ),
                                    Positioned(
                                      right: -displayWidth(context) * 0.035,
                                      bottom: -smallSpace(context) * 0.2,
                                      child: Container(
                                        padding: EdgeInsets.all(
                                          displayWidth(context) * 0.01,
                                        ),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Theme.of(context)
                                                .backgroundColor,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 20,
                                                color: Theme.of(context)
                                                    .shadowColor,
                                                offset: const Offset(1, 1),
                                              )
                                            ]),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: mediumSpace(context) * 0.4,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      contact.firstName +
                                          " " +
                                          contact.lastName,
                                      style:
                                          Theme.of(context).textTheme.headline1,
                                    ),
                                    SizedBox(
                                      height: smallSpace(context) * 0.1,
                                    ),
                                    Text(
                                      contact.phoneNumber,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ])),
    );
  }
}
