class Personal {
  final int? id;
  final String? phonenumber;
  final String firstname;
  final String lastname;
  final DateTime birthdate;
  final String address;
  final String city;
  final String gender;
  Personal({
    this.id,
    this.phonenumber,
    required this.firstname,
    required this.lastname,
    required this.birthdate,
    required this.address,
    required this.city,
    required this.gender,
  });
  Map<String, dynamic> toMap() => {
        "phonenumber": phonenumber,
        "firstname": firstname,
        "lastname": lastname,
        "birthdate": birthdate,
        "address": address,
        "city": city,
        "gender": gender,
      };
}
