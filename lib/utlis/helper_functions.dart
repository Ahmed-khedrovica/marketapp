import 'package:ecommrce/data/users.dart';
import 'package:ecommrce/models/cart.dart';
import 'package:ecommrce/models/cart_item.dart';
import 'package:ecommrce/models/product.dart';
import 'package:ecommrce/models/user.dart';

import '../data/products.dart';
import 'constants.dart';

int login(String email, String password) {
  // 1
  // 0, -1
  for (User user in users) {
    if (email == user.email) {
      if (password == user.password) {
        currentUser = user;
        return 1;
      } else {
        return 0;
      }
    }
  }
  return -1;
}

bool register(String userName, String email, String password) {
  for (User user in users) {
    if (email == user.email) {
      return false;
    }
  }

  User newUser = User(
    cart: Cart(items: []),
    password: password,
    email: email,
    favorites: [],
    userName: userName,
  );

  currentUser = newUser;
  users.add(newUser);

  return true;
}

List<Product> filter(String categoryName) {
  // ListName.where ((ele) => bool
  // condition

  //[ Ahmed, Omar, Ali , Othman]
  // condition -> name[0] =='A'
  // Iterable -> (Ahmed, Ali)

  // products.where(product) => product.category.name == 'clothes')
  return products
      .where((product) => product.category.name == categoryName)
      .toList();
}

List<Product> search(String searchTag) {
  // ListName.where ((ele) => bool
  // condition

  //[ Ahmed, Omar, Ali , Othman]
  // condition -> name[0] =='A'
  // Iterable -> (Ahmed, Ali)

  // products.where(product) => product.category.name == 'clothes')
  return products
      .where(
        (product) =>
            product.title.toLowerCase().contains(searchTag.toLowerCase()) ||
            product.description.toLowerCase().contains(searchTag.toLowerCase()),
      )
      .toList();
}



bool isFav(Product p){
  // [p1, p2, p3 ]
  // p2

  for(Product product in currentUser.favorites){
    if(product.id == p.id){
      return true;
    }
  }
  return false;
}


void updateFavourite (Product product){
  // 0    1    2
  // [p1, p2, p3 ]
  // p2

  if(isFav(product)) {
    int index = 0;

    for (int i = 0; i < currentUser.favorites.length; ++i) {
      if (currentUser.favorites[i].id == product.id) {
        index = i;
      }
    }

    currentUser.favorites.removeAt(index);
  }else {
    currentUser.favorites.add(product);
  }
}



void addToCart(Product product, int quantity){
  currentUser.cart.items.add(
    CartItem(product: product , quantity: quantity)

  );
}

double calcPrice(){
  double totalPrice = 0;
  for (CartItem item in currentUser.cart.items){
    totalPrice += item.quantity * item.product.price;
  }
return totalPrice;
}