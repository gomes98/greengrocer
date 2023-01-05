import 'package:greengrocer/src/models/item_model.dart';

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
