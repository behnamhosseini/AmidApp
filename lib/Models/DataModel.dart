import 'package:scoped_model/scoped_model.dart';

class DataModel extends Model {
  List _shopCategories=[];
  List _shoppingCart = [];
  List _shoppingCartId = [];
  String _shopName ='';

  List get shopCategories => _shopCategories;
  List get shoppingCart => _shoppingCart; 
  List get shoppingCartId => _shoppingCartId; 
  String get shopName => _shopName; 

  emptyShopName(){
    _shopName = '';
  }
  emptyShoppingCart(){
    _shoppingCart=[];
  }
  emptyShopinId(){
    _shoppingCartId=[];
  }


  addshopCategories(shopCategories){
    _shopCategories = shopCategories;
    notifyListeners();
  }

  addToShoppingCart(Map item){
    // print(item);
    
    if(_shoppingCartId.isNotEmpty){
      
      if(_shoppingCartId.contains(item['id'])){
        int index = _shoppingCartId.indexOf(item['id']);
         if(_shoppingCart[index]['amount'] < 20){
            _shoppingCart[index].update('amount', (value){
              return value + 1;
            });
            _shoppingCart[index].update('unit', (value){
              return item['unit'];
            });
        }
      } else {
        _shoppingCart.add(item);
        _shoppingCartId.add(item['id']);

      }
    } else {
      _shoppingCart.add(item);
      _shoppingCartId.add(item['id']);
      _shopName = item['shopName'];

    }
    notifyListeners();
  }

  removefromShoppingCart(Map item){
      
      if(_shoppingCartId.contains(item['id'])){
        int index = _shoppingCartId.indexOf(item['id']);
        if(_shoppingCart[index]['amount'] == 1){
          _shoppingCart.removeAt(index);
          _shoppingCartId.removeAt(index);
        }else{
          _shoppingCart[index].update('amount', (value){
            return value - 1;
          });
        }
        
      }  
    notifyListeners();
  }
}