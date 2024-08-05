class Usermodel {
  String? uid;
  String? email;
  String? firstName;
  String? lastName;
  // List<Questions>? questions;

  Usermodel({this.uid, this.email, this.firstName, this.lastName});

  //receive data to server

  factory Usermodel.fromMap(map) {
    return Usermodel(
        uid: map['uid'],
        email: map['email'],
        firstName: map['firstName'],
        lastName: map['lastName']);
  }
  //sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName
    };
  }
}
