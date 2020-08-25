



import 'package:pictora/src/model/ResponseModel.dart';
import 'package:pictora/src/repository/api_provider.dart';

class Repository{
  final apiProvider =  ApiProvider();

  Future<ResponseModel> currentprice() => apiProvider.currentprice();

  Future<ResponseModel> currentpriceOfCurrency(String code) => apiProvider.currentpriceOfCurrency(code);

  Future<ResponseModel> historical(String sDate, String eDate) => apiProvider.historical(sDate, eDate);
}
