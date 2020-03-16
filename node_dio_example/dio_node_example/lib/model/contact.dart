class ContactModel {
  String fullName;
  String cellphone;
  String email;
  String github;

  ContactModel({
    this.fullName,
    this.cellphone,
    this.email,
    this.github,
  });

  static ContactModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ContactModel(
      fullName: map['full_name'],
      cellphone: map['cellphone'],
      email: map['email'],
      github: map['github'],
    );
  }
}
