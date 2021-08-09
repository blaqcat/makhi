class UserModel {
  String homeCountry;
  bool admin;

  UserModel(this.homeCountry);

  Map<String, dynamic> toJson() => {
    'homeCountry': homeCountry,
    'admin': admin,
  };
}