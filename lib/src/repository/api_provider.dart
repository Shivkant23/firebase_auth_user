import 'dart:io';

// import 'package:http/http.dart' as client;
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'dart:async';
import 'dart:convert';

import 'package:pictora/src/model/ResponseModel.dart';
import 'package:pictora/src/model/registerModel.dart';
import 'package:pictora/src/repository/apis.dart';


class ApiProvider{
  APIs apis = APIs();
  String _baseUrl = "https://api.coindesk.com/v1/bpi/";

  Future<ResponseModel> getHttpResponse(String _url, String _body)async{
    bool mIsSuccess = false;
    String mErrorMsg = "";
    ResponseModel _responseModel = new ResponseModel();
    try{
      var _client = new HttpClient();
      _client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      IOClient ioClient = new IOClient(_client);
      Map<String,String> headers = {
        'Content-type' : 'application/json', 
        'Accept': 'application/json',
      };

      final response = (_body != null) ? await ioClient.post(_url, body: _body, headers: headers):
                                        await ioClient.get(_url, headers: headers);
      if(response == null){
        mIsSuccess = false;
        mErrorMsg = "Received null response from server."+response.statusCode.toString();
      }else{
        var parsedJson = json.decode(response.body);
        switch(response.statusCode){
          case 200:
            try{
              mIsSuccess = true;
              mErrorMsg = 'success';
              _responseModel.setData(parsedJson);
              // String parsedJson = json.decode(response.body);
              // _responseModel = ResponseModel.fromJson(parsedJson);
              // return response;
            } on FormatException catch(e){
              print(e);
              mIsSuccess = false;
              mErrorMsg = "Received wrong body contents. "+response.statusCode.toString();
            }
            break;
          case 201:
            try{
              mIsSuccess = parsedJson['success'];
              mErrorMsg = parsedJson['message'];
              _responseModel = ResponseModel.fromJson(parsedJson);
            } on FormatException catch(e){
              print(e);
              mIsSuccess = false;
              mErrorMsg = "Received wrong body contents."+response.statusCode.toString();
            }
            break;
          case 400:
            print(response.statusCode);
            mIsSuccess = parsedJson['success'];
            mErrorMsg = parsedJson['message'];
            break;
          case 401:
            print(response.statusCode);
            mIsSuccess = parsedJson['success'];
            mErrorMsg = parsedJson['message'];
            break;
          default:
            print(response.statusCode);
            mIsSuccess = parsedJson['success'];
            mErrorMsg = parsedJson['message'];
            // mIsSuccess = false;
            // mErrorMsg = "Invalid server response: " + response.statusCode.toString();
            break;
        }
      }
    }on SocketException catch(e){
      mIsSuccess = false;
      mErrorMsg = "Failed to connect to server. " + e.message;
    } on Exception catch(e){
      mIsSuccess = false;
      mErrorMsg = "Unknown error $e.";
    }
    if((!mIsSuccess) || (_responseModel == null)){
      _responseModel.setSuccess(mIsSuccess);
      _responseModel.setMessage(mErrorMsg);
      _responseModel.setData(null);
      return _responseModel;
    }
    _responseModel.setSuccess(mIsSuccess);
    _responseModel.setMessage(mErrorMsg);
    return _responseModel;
  }

  Future<ResponseModel> currentprice()async{
    String _url = _baseUrl + apis.currentprice;
    return await getHttpResponse(_url, null);
  }

  Future<ResponseModel> currentpriceOfCurrency(String code)async{
    String _url = _baseUrl + apis.currentpriceOfCurrency + code + ".json";
    return await getHttpResponse(_url, null);
  }

  Future<ResponseModel> historical(String sDate, String eDate)async{
    String _url = _baseUrl + apis.historical + "?start=" + sDate + "&end=" + eDate;
    return await getHttpResponse(_url, null);
  }
}