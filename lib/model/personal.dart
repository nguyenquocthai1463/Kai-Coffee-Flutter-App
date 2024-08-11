class Personal {
  final int? id;
  final int? id_account;
  final String firstname;
  final String lastname;
  final String birthdate;
  final String address;
  final String city;
  final bool gender;
  Personal({
    this.id,
    this.id_account,
    required this.firstname,
    required this.lastname,
    required this.birthdate,
    required this.address,
    required this.city,
    required this.gender,
  });
  Map<String, dynamic> toMap() => {
        "id_account": id_account,
        "firstname": firstname,
        "lastname": lastname,
        "birthdate": birthdate,
        "address": address,
        "city": city,
        "gender": gender,
      };
}
