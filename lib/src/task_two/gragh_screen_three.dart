import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pictora/src/model/ResponseModel.dart';
import 'package:pictora/src/repository/repository.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class BitCoinGraphThree extends StatefulWidget {
  BitCoinGraphThree({Key key}) : super(key: key);

  @override
  _BitCoinGraphState createState() => _BitCoinGraphState();
}

class _BitCoinGraphState extends State<BitCoinGraphThree> {
  Repository _repository = Repository();
  List<String> listOfKeys = [];
  List<double> listOfValues = [];
  bool isLoad = false;
  String key1;
  double value1;
  List<String> listOfKeys1 = [];
  List<double> listOfValues1 = [];
  
  @override
  void initState() {
    loadApi();
    super.initState();
  }

  loadApi()async{
    String sDate = "2013-09-01";
    String eDate = "2013-09-05";
    String code = "CNY";
    // ResponseModel response = await _repository.currentprice();
    // ResponseModel response = await _repository.currentpriceOfCurrency(code);
    ResponseModel response = await _repository.historical(sDate, eDate);
    if(response != null){
      List<String> listOfKeys = [];
      List<double> listOfValues = [];
      var mapKeys = response.getData['bpi'].keys;
      for(String name in mapKeys){
        listOfKeys.add(name.toString());
        listOfValues.add(response.getData['bpi'][name]);
      }
      setState(() {
        listOfKeys1 = listOfKeys;
        listOfValues1 = listOfValues;
        isLoad = true;
      });
    }else{
      Fluttertoast.showToast(msg: response.getMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Coindesk Historical'),
        ),
        body: isLoad ? _body() : Center(child: CircularProgressIndicator(),)
    );
  }

  Widget _body(){
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      title: ChartTitle(text: '5 Days of Data'),
      legend: Legend(isVisible: true),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <ChartSeries<SalesData, String>>[
        LineSeries<SalesData, String>(
            dataSource: <SalesData>[
              SalesData(listOfKeys1[0], listOfValues1[0]),
              SalesData(listOfKeys1[1], listOfValues1[1]),
              SalesData(listOfKeys1[2], listOfValues1[2]),
              SalesData(listOfKeys1[3], listOfValues1[3]),
              SalesData(listOfKeys1[4], listOfValues1[4]),
            ],
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
            dataLabelSettings: DataLabelSettings(isVisible: true))
      ]);
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  String year;
  double sales;
}
