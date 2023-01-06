import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/models/user_model.dart';

ItemModel apple = ItemModel(
  itemName: 'Maçã',
  imgUrl: 'assets/fruits/apple.png',
  unit: 'kg',
  price: 2.99,
  description: 'Maçãs vermelhas',
);

ItemModel grape = ItemModel(
  itemName: 'Uva',
  imgUrl: 'assets/fruits/grape.png',
  unit: 'kg',
  price: 7.44,
  description: 'Uvas Roxas',
);

ItemModel guava = ItemModel(
  itemName: 'Goiaba',
  imgUrl: 'assets/fruits/guava.png',
  unit: 'kg',
  price: 11.55,
  description: 'Goibas Verdes',
);

ItemModel kiwi = ItemModel(
  itemName: 'Kiwi',
  imgUrl: 'assets/fruits/kiwi.png',
  unit: 'un',
  price: 2.5,
  description: 'Kiwi Peludo',
);

ItemModel mango = ItemModel(
  itemName: 'Manga',
  imgUrl: 'assets/fruits/mango.png',
  unit: 'un',
  price: 2.5,
  description: 'Mamão Papaia Amarelo',
);
ItemModel papaya = ItemModel(
  itemName: 'Mamão Papaia',
  imgUrl: 'assets/fruits/papaya.png',
  unit: 'kg',
  price: 8,
  description: 'Mamão Papaia Amarelo',
);

List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

List<String> categories = [
  'Frutas',
  'Verduras',
  'Legumes',
  'Carnes',
  'Cereais',
  'Laticionios',
  'Bebidas',
  'Higiene',
  'Limpeza',
  'Outros',
];

List<CartItemModel> cartItems = [
  CartItemModel(item: apple, quantity: 2),
  CartItemModel(item: mango, quantity: 1),
  CartItemModel(item: guava, quantity: 3),
];

UserModel user = UserModel(
    name: "Mauricio",
    email: "mauricio@email.com",
    phone: "123456789",
    cpf: "12345678910",
    password: "");

List<OrderModel> orders = [
  OrderModel(
    id: "dsfgbh",
    createdOrderTime: DateTime.parse("2022-01-06 10:00:10.458"),
    overdueDateTime: DateTime.parse("2022-01-06 11:03:10.458"),
    items: cartItems,
    status: "pending_payment",
    copyAndPaste: "d324rfsdfwrt534",
    total: 43.13,
  ),
  OrderModel(
    id: "5t46758697dsfgb",
    createdOrderTime: DateTime.parse("2022-01-06 10:00:10.458"),
    overdueDateTime: DateTime.parse("2022-01-06 11:03:10.458"),
    items: cartItems,
    status: "pending_payment",
    copyAndPaste: "d324rfsdfwrt534",
    total: 43.13,
  ),
];
