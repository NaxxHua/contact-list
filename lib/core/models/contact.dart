// Model for contacts, null safe by using "" keyword

class Contact {
  String firstName;
  String lastName;
  String phoneNumber;
  String emailAddress;

  // Firstname and lastname are
  Contact({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.emailAddress,
  });
}
