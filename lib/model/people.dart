class Person {
  dynamic id;
  String name;
  String address;
  String number;
  String status;
  Person({this.id, this.name, this.address, this.number, this.status});
}

class EditPerson {
  String name;
  String address;
  String number;
  String status;
  static final EditPerson _editPerson = EditPerson.internal();
  EditPerson.internal();
  factory EditPerson() {
    return _editPerson;
  }
}
