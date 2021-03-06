// * This is the page that users can add contact information.

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:contact_list/core/viewmodels/contact_create_view_model.dart';
import 'package:contact_list/ui/base_widget.dart';
import 'package:contact_list/ui/shared/size_helper.dart';
import 'package:contact_list/ui/widgets/contact_form_field.dart';

class ContactCreateView extends StatefulWidget {
  static const routeName = '/contact-create-view';

  const ContactCreateView({Key key}) : super(key: key);

  @override
  State<ContactCreateView> createState() => _ContactCreateViewState();
}

class _ContactCreateViewState extends State<ContactCreateView> {
  // Formkey for form submission
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ContactCreateViewModel>(
        model: ContactCreateViewModel(api: Provider.of(context)),
        builder: (context, model, _) => model.busy
            ? const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  elevation: 2.0,
                  title: const Text("Add a New Contact"),
                  actions: <Widget>[
                    TextButton(
                      // The button that saves(submits) data
                      child: const Text(
                        "Save",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          // Save the user input from the form
                          _formKey.currentState.save();
                          await model.createContact();
                          if (model.valid) {
                            // Create contact
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/contact-view', (route) => false,
                                arguments: {});
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'There is already a contact with the same contact information!'),
                              ),
                            );
                          }
                        }
                      },
                    ),
                  ],
                ),
                body: SafeArea(
                    child: Form(
                        key: _formKey,
                        child: Column(children: <Widget>[
                          SizedBox(
                            height: mediumSpace(context),
                          ),
                          SizedBox(
                            width: displayWidth(context),
                            child: ContactFormField(
                              hintText: 'First Name',
                              labelText: 'First Name',
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
                              labelText: 'Last Name',
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
                              labelText: 'Phone Number',
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
                              labelText: 'Email Address',
                              onSaved: (email) => model.emailAddress = email,
                              validator: (email) => model.validateEmail(email),
                            ),
                          ),
                          SizedBox(
                            height: smallSpace(context),
                          ),
                        ])))));
  }
}
