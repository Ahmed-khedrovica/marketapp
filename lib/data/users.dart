import '../models/cart.dart';
import '../models/user.dart';

List<User> users = [
  User(
      userName: "john_doe",
      email: "john@example.com",
      password: "password123",
      cart: Cart(items: []),
      favorites: []),
  User(
    userName: "jane_smith",
    email: "jane@example.com",
    password: "mySecureP@ssw0rd",
    cart: Cart(items: []),
    favorites: [],
  ),
  User(
    userName: "asser",
    email: "asser@gmail.com",
    password: "123",
    cart: Cart(items: []),
    favorites: [],
  ),
  User(
    userName: "johnny",
    email: "johnny@gmail.com",
    password: "123",
    cart: Cart(items: []),
    favorites: [],
  ),
];
