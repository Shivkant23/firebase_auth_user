class UserModel{
  int _userId;
  String _userName;
  String _email;
  String _role;
  bool _userStatus;
  bool _lockedUser;
  String _mobile;
  String _name;

  int get getUserId => _userId;
  String get getUserName => _userName;
  String get getEmail => _email;
  String get getRole => _role;
  bool get getUserStatus => _userStatus;
  bool get getLockedUser => _lockedUser;
  String get getMobile => _mobile;
  String get getName => _name;

  void setUserId(int pUserId){
    _userId = pUserId;
  }
  void setUserName(String pUserName){
    _userName = pUserName;
  }
  void setEmail(String pEmail){
    _email = pEmail;
  }
  void setRole(String pUserId){
    _role = pUserId;
  }
  void setUserStatus(bool pUserStatus){
    _userStatus = pUserStatus;
  }
  void setLockedUser(bool pLockedUser){
    _lockedUser = pLockedUser;
  }
  void setMobile(String pMobile){
    _mobile = pMobile;
  }
  void setName(String pName){
    _name = pName;
  }
}