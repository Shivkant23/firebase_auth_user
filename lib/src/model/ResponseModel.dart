class ResponseModel{
  bool _success;
  String _message;
  Map<String, dynamic> _data;

  ResponseModel();

  ResponseModel.fromJson(Map<String, dynamic> json) {
    _data = json['data'] ;
    _success = json['success'];
    _message = json['message'];
  }

  String get getMessage => _message;
  bool get getSuccess => _success;
  Map<String, dynamic> get getData => _data;

  void setMessage(String msg){
    _message = msg;
  }
  void setSuccess(bool pSuccess){
    _success = pSuccess;
  }
  void setData(Map pData){
    _data = pData;
  }
}