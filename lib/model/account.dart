class Account {
  final String id;
  final String phonenumber;
  final String password;

  Account({
    required this.id,
    required this.phonenumber,
    required this.password,
  });

  Map<String, dynamic> toMap() => {
        "phonenumber": phonenumber,
      };
}
