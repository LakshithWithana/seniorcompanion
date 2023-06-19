class SCUser {
  final String? uid;
  SCUser({this.uid});
}

class UserDetails {
  final String? uid;
  final String? email;
  final bool? isCR;
  final String? firstName;
  final String? lastName;
  final DateTime? birthday;
  final String? about;
  final String? gender;
  final List<String>? preferences;
  final String? profilePicUrl;

  UserDetails({
    this.uid,
    this.email,
    this.isCR,
    this.firstName,
    this.lastName,
    this.birthday,
    this.about,
    this.gender,
    this.preferences,
    this.profilePicUrl,
  });
}
