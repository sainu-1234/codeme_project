import 'package:codeme_project/features/homescreenpage/model/homescreen_modelclass.dart';
import 'package:flutter/material.dart';

class HomescreenController with ChangeNotifier {
  List<Product> ProductList = [
    Product(
      isfavorite: false,
      name: "Burger",
      image: "assets/images/burgers.png",
      price: 200,
      description:
          "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness",
      quantity: 0,
    ),
    Product(
      isfavorite: false,
      name: "Bag",
      image: "assets/images/bag .png",
      description:
          "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness ",
      price: 350,
      quantity: 0,
    ),
    Product(
      isfavorite: false,
      name: "Shoe",
      image: "assets/images/shoe.png",
      description:
          "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pai",
      price: 250,
      quantity: 0,
    ),
    Product(
      isfavorite: false,
      name: "Book",
      image: "assets/images/books.png",
      description:
          "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame",
      price: 270,
      quantity: 0,
    ),
    Product(
      isfavorite: false,
      name: "Pen",
      image: "assets/images/pens.png",
      description:
          "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame",
      price: 170,
      quantity: 0,
    ),
    Product(
      isfavorite: false,
      name: "Toys",
      image: "assets/images/toys.png",
      description:
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the",
      price: 480,
      quantity: 0,
    ),
    Product(
      isfavorite: false,
      name: "Medicine",
      image: "assets/images/medicine.png",
      description:
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the",
      price: 240,
      quantity: 0,
    ),
    Product(
      isfavorite: false,
      name: "School Bag",
      image: "assets/images/school bag.png",
      description:
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the",
      price: 590,
      quantity: 0,
    ),
    Product(
      isfavorite: false,
      name: "Chappals",
      image: "assets/images/chappals.png",
      description:
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the",
      price: 399,
      quantity: 0,
    ),
    Product(
      isfavorite: false,
      name: "Watch",
      image: "assets/images/watch.png",
      description:
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the",
      price: 1200,
      quantity: 0,
    ),
    Product(
      isfavorite: false,
      name: "Liquid",
      image: "assets/images/bottile.png",
      description:
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the",
      price: 1300,
      quantity: 0,
    ),
  ];
  void addQuandity(int index) {
    ProductList[index].quantity++;
    notifyListeners();
  }

  void removeQuandity(int index) {
    if (ProductList[index].quantity > 0) {
      ProductList[index].quantity--;
      notifyListeners();
    }
  }
}
