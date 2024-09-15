const tableContact = 'tbl_contact';
const tblContactColId = 'id';
const tblContactColName = 'name';
const tblContactColMobile = 'mobile';
const tblContactColEmail = 'email';
const tblContactColAddress = 'address';
const tblContactColGroup = 'contact_group';
const tblContactColGender = 'gender';
const tblContactColWebsite = 'website';
const tblContactColImage = 'image';
const tblContactColFavourite = 'favourite';
const tblContactColDob = 'dob';



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
    this.id ,
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
  Map<String ,dynamic>toMap(){
    final map = <String,dynamic>{
      tblContactColName : name ,
      tblContactColGroup : group,
      tblContactColFavourite : favourite?1:0 ,
      tblContactColWebsite : website,
      tblContactColImage : image,
      tblContactColGender : gender,
      tblContactColDob : dob ,
      tblContactColAddress : address ,
      tblContactColMobile : mobile,
      tblContactColEmail : email
    };
    return map ;
  }

  factory ContactModel.fromMap(Map<String , dynamic>map)=>ContactModel(
      name: map[tblContactColId],
      mobile: map[tblContactColMobile],
      email:map[tblContactColEmail],
      address: map[tblContactColAddress],
      group: map[tblContactColGroup],
      gender: map[tblContactColGender],
      website: map[tblContactColWebsite],
      image: map[tblContactColImage],
      dob: map[tblContactColDob],
      favourite: map[tblContactColFavourite]== 0? false:true,
  );
}