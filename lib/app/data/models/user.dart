import 'identifier_model.dart';

class User extends IdentifierModel<String> {
  final String email, firstName, lastName;

  User(super.id, this.email, this.firstName, this.lastName);

  String get name => '$firstName $lastName';
}
