import 'package:scoped_model/scoped_model.dart';


class CounterModel extends Model {
  String _shopName = '';
  List _shopList=['category'];
  // int get counter => _counter;

  void changeShopName(shopName) {
    _shopName=shopName;
    notifyListeners();
  }
}
