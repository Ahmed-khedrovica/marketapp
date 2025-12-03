import 'package:ecommrce/models/cart.dart';
import 'package:ecommrce/models/product.dart';

class User{
  late String userName;
  late String email;
  late String password;
  late List<Product> favorites;
  late Cart cart;
   User({
    required this.cart,
    required this.password,
    required this.email,
    required this.favorites,
    required this.userName,
});
}