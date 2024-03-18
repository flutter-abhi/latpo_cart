import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'data2.dart';

class CardsClass {
  String imageLink;
  String nameOflaptop;
  int offerPrice;
  int actualPrice;
  int quantity;

  CardsClass(
      {required this.imageLink,
      required this.actualPrice,
      required this.nameOflaptop,
      required this.offerPrice,
      required this.quantity});

  Map<String, dynamic> CardTomap() {
    return {
      "nameoflaptop": nameOflaptop,
      "offerPrice": offerPrice,
      "actualPrice": actualPrice,
      "quantity": quantity,
      "imageLink": imageLink
    };
  }
}

Future<void> insetToCart(CardsClass obj) async {
  dynamic localDB = await database2;
  await localDB.insert("cardDataTable", obj.CardTomap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}

Future<List<CardsClass>> getdata() async {
  dynamic localDb = await database2;

  List<Map<String, dynamic>> data = await localDb.query("cardDataTable");

  return List.generate(
      data.length,
      (index) => CardsClass(
          nameOflaptop: data[index]["nameOflaptop"],
          offerPrice: data[index]["offerPrice"],
          actualPrice: data[index]["actualPrice"],
          quantity: data[index]["quantity"],
          imageLink: data[index]["imageLink"]));
}

Future<void> removeCart(CardsClass obj) async {
  dynamic localDB = database2;
  localDB.delete("cardDataTable",
      where: "nameOflaptop = ?", whereArgs: [obj.nameOflaptop]);
}

List _cardList = [];

class AddToCart extends StatefulWidget {
  const AddToCart({super.key});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  void _getDataList() async {
    insetToCart(CardsClass(
        imageLink:
            "https://media.istockphoto.com/id/479520746/photo/laptop-with-blank-screen-on-white.jpg?s=612x612&w=0&k=20&c=V5dj0ayS8He0BP4x15WR5t5NKYzWTKv7VdWvD2SAVAM=",
        actualPrice: 200,
        nameOflaptop:
            "HP pacscmdscds kmksdlkcsd kmsclsd bbbbbbbbbbbbbbbbbbkclkm l lk sd ",
        offerPrice: 100,
        quantity: 2));
    _cardList = await getdata();
    setState(() {});
  }

  @override
  void initState() {
    _getDataList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My WishList"),
      ),
      body: Container(
        color: Colors.grey.shade50,
        child: ListView.builder(
            itemCount: _cardList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.amber.shade100, blurRadius: 20)
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        "${_cardList[index].imageLink}",
                        height: 150,
                        width: 150,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${_cardList[index].nameOflaptop}",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),

                              // const Spacer(),
                              Row(
                                children: [
                                  Text(
                                    " ₹ ${_cardList[index].offerPrice}   ",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "₹ ${_cardList[index].actualPrice}",
                                    style: const TextStyle(
                                        decoration: TextDecoration.lineThrough),
                                  )
                                ],
                              ),

                              Row(
                                children: [
                                  Text(
                                      " Total ₹ ${_cardList[index].offerPrice * _cardList[index].quantity} "),
                                  GestureDetector(
                                    onTap: () {
                                      removeCart(_cardList[index]);
                                      _getDataList();
                                    },
                                    child: Container(
                                        height: 30,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: const Center(
                                            child: Text(
                                          " Remove",
                                          style: TextStyle(fontSize: 16),
                                        ))),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
