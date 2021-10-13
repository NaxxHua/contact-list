// * This is the page that users can edit contact information.

import 'package:contact_list/ui/views/contact_detail_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:contact_list/core/models/contact.dart';
import 'package:contact_list/core/viewmodels/contact_edit_view_model.dart';

import 'package:contact_list/ui/base_widget.dart';
import 'package:contact_list/ui/widgets/contact_form_field.dart';
import 'package:contact_list/ui/shared/size_helper.dart';

class ContactEditView extends StatefulWidget {
  static const routeName = '/contact-edit-view';

  const ContactEditView({Key key, this.contact}) : super(key: key);

  final DocumentSnapshot<Object> contact;

  @override
  State<ContactEditView> createState() => _ContactEditViewState();
}

class _ContactEditViewState extends State<ContactEditView> {
  // Formkey for form submission
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ContactEditViewModel>(
        model: ContactEditViewModel(api: Provider.of(context)),
        builder: (context, model, _) => model.busy
            ? const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  elevation: 2.0,
                  title: Text(widget.contact['firstName']),
                  actions: <Widget>[
                    TextButton(
                      // The button that saves(submits) data
                      child: Text(
                        "Save",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      onPressed: () async {
                        // Save the user input from the form
                        _formKey.currentState.save();
                        // Update contact
                        model.updateContact();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                body: SafeArea(
                    child: Form(
                        key: _formKey,
                        child: Column(children: <Widget>[
                          SizedBox(
                            width: displayWidth(context),
                            child: ContactFormField(
                              hintText: 'id',
                              controller: TextEditingController(
                                  text: widget.contact.id),
                              onSaved: (id) => model.id = id,
                            ),
                          ),
                          SizedBox(
                            height: displayHeight(context) * 0.1,
                          ),
                          SizedBox(
                            width: displayWidth(context),
                            child: ContactFormField(
                              hintText: 'First Name',
                              controller: TextEditingController(
                                text: widget.contact['firstName'],
                              ),
                              onSaved: (firstName) =>
                                  model.firstName = firstName,
                            ),
                          ),
                          SizedBox(
                            height: smallSpace(context),
                          ),
                          SizedBox(
                            width: displayWidth(context),
                            child: ContactFormField(
                              hintText: 'Last Name',
                              controller: TextEditingController(
                                  text: widget.contact['lastName']),
                              onSaved: (lastName) => model.lastName = lastName,
                            ),
                          ),
                          SizedBox(
                            height: smallSpace(context),
                          ),
                          SizedBox(
                            width: displayWidth(context),
                            child: ContactFormField(
                              hintText: 'Phone Number',
                              controller: TextEditingController(
                                  text: widget.contact['phoneNumber']),
                              onSaved: (phoneNumber) =>
                                  model.phoneNumber = phoneNumber,
                            ),
                          ),
                          SizedBox(
                            height: smallSpace(context),
                          ),
                          SizedBox(
                            width: displayWidth(context),
                            child: ContactFormField(
                              hintText: 'Email Address',
                              controller: TextEditingController(
                                  text: widget.contact['emailAddress']),
                              onSaved: (email) => model.emailAddress = email,
                            ),
                          ),
                          SizedBox(
                            height: smallSpace(context),
                          ),
                          SizedBox(
                              child: TextButton(
                            onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text('Are you sure you want to delete ' +
                                    widget.contact['firstName'].toString() +
                                    ' ' +
                                    widget.contact['lastName'] +
                                    '?'),
                                content:
                                    const Text('This action cannot be undone'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () => [
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil('/',
                                              (Route<dynamic> route) => false),
                                      model.deleteContact(
                                          widget.contact.id.toString())
                                    ],
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            ),
                            child: Text(
                              'Delete Contact',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Colors.red),
                            ),
                          )),
                        ])))));
  }
}
