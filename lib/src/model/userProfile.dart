class UserProfile{
  int _userId;
  String _donorName;
  String _email;
  String _addressLine1;
  String _addressLine2;
  String _city;
  String _state;
  String _country;
  String _pincode;
  String _contactNo1;
  String _mobile;
  bool _status;
  int _age;
  String _occupation;
  String _userIdType;
  String _emailOtp;
  String _phoneOtp;
  bool _agreeToTerms;
  
  UserProfile();

  UserProfile.fromJson(Map<String, dynamic> json){
    _userId = json['userId'];
    _donorName = json['donorName'];
    _email = json['email'];
    _addressLine1 = json['addressLine1'];
    _addressLine2 = json['addressLine2'];
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
    _pincode = json['pincode'];
    _contactNo1 = json['contactNo1'];
    _mobile = json['mobile'];
    _status = json['status'];
    _age = json['age'];
    _occupation = json['occupation'];
    _userIdType = json['userIdType'];
    _emailOtp = json['emailOtp'];
    _phoneOtp = json['phoneOtp'];
    _agreeToTerms = json['agreeToTerms'];
  }

  int get getUserId => _userId;
  int get getAge => _age;
  String get getDonorName => _donorName;
  String get getEmail => _email;
  String get getAddressLine1 => _addressLine1;
  String get getMobile => _mobile;
  bool get getStatus => _status;
  bool get getAgreeToTerms => _agreeToTerms;

  void setUserId(int pUserId){
    _userId = pUserId;
  }
  void setAge(int pAge){
    _age = pAge;
  }
  void setDonorName(String pDonorName){
    _donorName = pDonorName;
  }
  void setEmail(String pEmail){
    _email = pEmail;
  }
  void setAddressLine1(String pAddressLine1){
    _addressLine1 = pAddressLine1;
  }
  void setMobile(String pMobile){
    _mobile = pMobile;
  }
  void setStatus(bool pStatus){
    _status = pStatus;
  }
  void setAgreeToTerms(bool pAgreeToTerms){
    _agreeToTerms = pAgreeToTerms;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this._userId;
    data['donorName'] = this._donorName;
    data['email'] = this._email;
    data['addressLine1'] = this._addressLine1;
    data['addressLine2'] = this._addressLine2;
    data['city'] = this._city;
    data['state'] = this._state;
    data['country'] = this._country;
    data['pincode'] = this._pincode;
    data['contactNo1'] = this._contactNo1;
    data['mobile'] = this._mobile;
    data['status'] = this._status;
    data['age'] = this._age;
    data['occupation'] = this._occupation;
    data['userIdType'] = this._userIdType;
    data['emailOtp'] = this._emailOtp;
    data['phoneOtp'] = this._phoneOtp;
    data['agreeToTerms'] = this._agreeToTerms;
    return data;
  }
}