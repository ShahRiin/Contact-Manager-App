class ContactModel{
  int? id ;
  String name;
  String mobile ;
  String email;
  String address;
  String group ;
  String gender;
  String? website;
  String? image;
  bool favourite;
  String? dob;

  ContactModel({
    required this.name,
    required this.mobile,
    required this.email,
    required this.address,
    required this.group,
    required this.gender,
    this.website,
    this.image,
    this.favourite =  false,
    this.dob,
  });
}