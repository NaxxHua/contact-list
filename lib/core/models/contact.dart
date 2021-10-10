// Model for contacts, null safe by using "late" keyword

class Contact {
  late String firstName;
  late String lastName;
  late String? phoneNumber;
  late String? emailAddress;

  // Firstname and lastname are required
  Contact({
    required this.firstName,
    required this.lastName,
    this.phoneNumber,
    this.emailAddress,
  });
}
