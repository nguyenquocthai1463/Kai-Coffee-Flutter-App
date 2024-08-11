class Account {
  int? id;
  String phonenumber;
  String password;

  Account({
    this.id,
    required this.phonenumber,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'phonenumber': phonenumber,
      'password': password,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  static Account fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id'],
      phonenumber: map['phonenumber'],
      password: map['password'],
    );
  }
}
