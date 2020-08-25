class RegisterModel{
  String _name;
  String _password;
  String _email;
  String _userIdType;
  String _age;
  String _address;
  String _role;
  String _contactNo;
  bool _privacyFlag;
  bool _agreeToTerms;
  String _emailverified;
  String _contactnoverified;
  String _city;
  String _occupation;
  

  RegisterModel();
  String get getName => _name;
  String get getPassword => _password;
  String get getEmail => _email;
  String get getUseIdType => _userIdType;
  String get getAge => _age;
  String get getAddress => _address;
  String get getRole => _role;
  String get getContactNo => _contactNo;
  bool get getPrivacyFlag => _privacyFlag;
  bool get getAgreeToTerms => _agreeToTerms;
  String get getEmailVerified => _emailverified;
  String get getContactNoVerified => _contactnoverified;
  String get getCity => _city;
  String get getOccupation => _occupation;

  void setName(String pName){
    _name = pName;
  }
  void setPassword(String pPassword){
    _password = pPassword;
  }
  void setEmail(String pEmail){
    _email = pEmail;
  }
  void setUserIdType(String pUserIdType){
    _userIdType = pUserIdType;
  }
  void setAge(String pAge){
    _age = pAge;
  }
  void setAddress(String pAddress){
    _address = pAddress;
  }
  void setRole(String pRole){
    _role = pRole;
  }
  void setContactNo(String pContactNo){
    _contactNo = pContactNo;
  }
  void setPrivacyFlag(bool pPrivacyFlag){
    _agreeToTerms = pPrivacyFlag;
  }
  void setAgreeToTerms(bool pAgreeToTerms){
    _agreeToTerms = pAgreeToTerms;
  }
  void setEmailverified(String pEmailverified){
    _emailverified = pEmailverified;
  }
  void setContactnoverified(String pContactnoverified){
    _contactnoverified = pContactnoverified;
  }
  void setCity(String pCity){
    _city = pCity;
  }
  void setOccupation(String pOccupation){
    _occupation = pOccupation;
  }



  RegisterModel.fromjson(Map<String, dynamic> json){
    _name = json['name'];
    _password = json['password'];
    _email = json['email'];
    _userIdType = json['userIdType'];
    _age = json['age'];
    _address = json['address'];
    _role = json['role'];
    _contactNo = json['contactNo'];
    _privacyFlag = json['privacy'];
    _agreeToTerms = json['agreeToTerms'];
    _emailverified = json['emailverified'];
    _contactnoverified = json['contactnoverified'];
    _city = json['city'];
    _occupation = json['occupation'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"]= this._name;
    data["password"]= this._password;
    data["email"]= this._email;
    data["userIdType"]= this._userIdType;
    data["age"]= this._age;
    data["address"]= this._address;
    data["role"]= this._role ;
    data["contactNo"]= this._contactNo;
    data['privacy'] = this._privacyFlag;
    data["agreeTOTerms"]= this._agreeToTerms;
    data["emailverified"]= this._emailverified;
    data["contactnoverified"]= this._contactnoverified;
    data["city"]= this._city;
    data["occupation"]= this._occupation;
    return data;
  }
}