
import 'package:flutter/material.dart';
import 'package:laptop_store/addcart.dart';
import 'data2.dart';
import 'login.dart';

import 'laptopInfo.dart';

List mainList = [];
List cartList = [];

class Laptops extends StatefulWidget {
  const Laptops({super.key});

  @override
  State<Laptops> createState() {
    return _LaptopState();
  }
}

class LaptopData {
  final String mainImage;
  final String subImage1;
  final String subImage2;
  final String subImage3;
  final String nameOflaptop;
  final String specification;
  final String offerPrice;
  final String actualPrice;

  LaptopData({
    required this.mainImage,
    required this.subImage1,
    required this.subImage2,
    required this.subImage3,
    required this.nameOflaptop,
    required this.specification,
    required this.actualPrice,
    required this.offerPrice,
  });

  Map<String, dynamic> laptopDataMap() {
    return {
      'mainImage': mainImage,
      'subImage1': subImage1,
      'subImage2': subImage2,
      'subImage3': subImage3,
      'nameOflaptop': nameOflaptop,
      'specification': specification,
      'actualPrice': actualPrice,
      'offerPrice': offerPrice
    };
  }

  @override
  String toString() {
    return '{mainImage:$mainImage,subImage1:$subImage1,subImage2:$subImage2,subImage3:$subImage3 , nameOflaptop:$nameOflaptop, specification:$specification }';
  }
}

class _LaptopState extends State<Laptops> {
  @override
  void initState() {
    super.initState();
    getLapData();
    setState(() {});
  }

  int wishListCount = 0;
  bool isMainList = true;

  final TextEditingController _name = TextEditingController();
  final TextEditingController _mainImage = TextEditingController();
  final TextEditingController _subImage1 = TextEditingController();
  final TextEditingController _subImage2 = TextEditingController();
  final TextEditingController _subImage3 = TextEditingController();
  final TextEditingController _specification = TextEditingController();
  final TextEditingController _offerPrice = TextEditingController();
  final TextEditingController _actualPrice = TextEditingController();

  void getLapData() async {
    mainList = await getLaptopData();

    setState(() {});
  }

  void getKart() async {
    cartList = await getKartData();
    setState(() {});
  }

  void showBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              //height: 600,

              color: Colors.grey.shade100,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //  mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: double.infinity,
                        margin:
                            const EdgeInsets.only(left: 50, right: 50, top: 10),
                        child: TextField(
                          controller: _name,
                          autofocus: true,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: "Add Name of Laptop",
                            //  errorText: isError ? errorMsg(_Title.text) : null,
                            focusColor: Colors.black,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                          ),
                          onTap: () {
                            //  isError = false ;
                          },
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin:
                            const EdgeInsets.only(left: 50, right: 50, top: 10),
                        child: TextField(
                          controller: _mainImage,
                          autofocus: true,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: "Add MainImage Address",
                            //  errorText: isError ? errorMsg(_Title.text) : null,
                            focusColor: Colors.black,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                          ),
                          onTap: () {
                            //  isError = false ;
                          },
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin:
                            const EdgeInsets.only(left: 50, right: 50, top: 10),
                        child: TextField(
                          controller: _subImage1,
                          autofocus: true,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: "Add SubImage1 Adress",
                            //  errorText: isError ? errorMsg(_Title.text) : null,
                            focusColor: Colors.black,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                          ),
                          onTap: () {
                            //  isError = false ;
                          },
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin:
                            const EdgeInsets.only(left: 50, right: 50, top: 10),
                        child: TextField(
                          controller: _subImage2,
                          autofocus: true,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: "SubImage2",
                            //  errorText: isError ? errorMsg(_Title.text) : null,
                            focusColor: Colors.black,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                          ),
                          onTap: () {
                            //  isError = false ;
                          },
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(
                            left: 50, right: 50, top: 10, bottom: 2),
                        child: TextField(
                          controller: _specification,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "specification",
                            focusColor: Colors.black,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
<<<<<<< HEAD
                          children: [  
                             Expanded(
                               child: Container(
                                       width: double.infinity,
                                        margin: const EdgeInsets.only(
                                       left: 50 ,right: 5  ,top: 10, bottom: 2),
                                        child: TextField(
                                           controller: _offerPrice,
                                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Offer Price",
                                focusColor: Colors.black,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                                           ),
                                                         ),
                                                       ),
                             ),
                          Expanded(
                            child: Container(
                             width: double.infinity,
                            margin: const EdgeInsets.only(
                             right: 50, top: 10, bottom: 2),
                            child: TextField(
                              controller: _actualPrice,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Actuall Price",
                                focusColor: Colors.black,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),

                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(
                                    left: 50, right: 5, top: 10, bottom: 2),
                                child: TextField(
                                  controller: _offerPrice,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Offer Price",
                                    focusColor: Colors.black,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    suffix: const Icon(Icons.calendar_month),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(
                                    right: 50, top: 10, bottom: 2),
                                child: TextField(
                                  controller: _actualPrice,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Actuall Price",
                                    focusColor: Colors.black,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    suffix: const Icon(Icons.calendar_month),
                                  ),
                                ),
>>>>>>> 88fe2db32ff427d09f69486666632e13cd2dc8a4
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 300,
                        height: 50,
                        margin:
                            const EdgeInsets.only(left: 50, right: 50, top: 10),
                        child: ElevatedButton(
                          onPressed: () async {
                            await creatingLaptopDatabase();

                            await insertLaptop(LaptopData(
                              nameOflaptop: _name.text,
                              mainImage: _mainImage.text,
                              subImage1: _subImage1.text,
                              subImage2: _subImage2.text,
                              subImage3: _subImage3.text,
                              specification: _specification.text,
                              offerPrice: _offerPrice.text,
                              actualPrice: _actualPrice.text,
                            ));

                            getLapData();

                            _name.clear();
                            _mainImage.clear();
                            _subImage1.clear();
                            _subImage2.clear();
                            _subImage3.clear();
                            _specification.clear();
<<<<<<< HEAD
                            _actualPrice.clear();
                            _offerPrice.clear();
                
=======

>>>>>>> 88fe2db32ff427d09f69486666632e13cd2dc8a4
                            Navigator.pop(context);
                          },
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black),
                            shadowColor: MaterialStatePropertyAll(Colors.black),
                          ),
                          child: const Text(
                            "Submit",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          );
        });
  }

  AppBar _appbarFunction() {
    return AppBar(
<<<<<<< HEAD
        leading:
            const Icon(Icons.laptop_mac_outlined, color: Colors.white, size: 34),
        backgroundColor:const  Color.fromARGB(255, 153, 26, 182),
=======
        leading: const Icon(Icons.laptop_mac_outlined,
            color: Colors.white, size: 34),
        backgroundColor: const Color.fromARGB(255, 153, 26, 182),
>>>>>>> 88fe2db32ff427d09f69486666632e13cd2dc8a4
        foregroundColor: Colors.white,
        title: const Text("LaptopHub"),
        actions: [
          const SizedBox(
            width: 15,
          ),
          const SizedBox(
            width: 15,
          ),
          GestureDetector(
            onTap: () {
              isSetting = !isSetting;
              isMainList = true;
              setState(() {});
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person_outline,
                  size: 18,
                ),
                Text("Profile")
              ],
            ),
          ),
<<<<<<< HEAD
          const  SizedBox(
=======
          const SizedBox(
>>>>>>> 88fe2db32ff427d09f69486666632e13cd2dc8a4
            width: 15,
          )
        ]);
  }

  bool isSetting = false;

  @override
  Widget build(BuildContext conetxt) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
        appBar: _appbarFunction(),
        body: Column(children: [
          Container(
<<<<<<< HEAD
            child:
          isSetting
              ? Container(
                  padding:const  EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: Row(
                    children: [
                      const  SizedBox(width: 6,),
                       GestureDetector(
                        onTap: ()async {

                         cartList =   await  getKartData();   

                         isMainList = false ;

                         setState(() {
                           
                         });                      
                        },
                        child:   Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            
                          
                            Icon( Icons.shopping_bag_outlined, size: 24,
                             color:isMainList? Colors.purple:Colors.black,
                             ),

                             Text("Cart",style: TextStyle(
                              color:isMainList? Colors.purple:Colors.black,
                              fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),

                    
                       const  SizedBox(width: 20,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:(context){
                            return const AddToCart();
                          }));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.favorite_border, color: Colors.purple,size: 18),
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      color: Colors.purple,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                      child: Text("$wishListCount",
                                          style: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.white))),
                                ),
                              ],
                            ),
                          const   SizedBox(height: 3,),
                            const Text("WishList",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),


                      const SizedBox(width: 20,),

                       GestureDetector(
                        onTap: () {
                          
                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.discount  ,
                              size: 22,
                              color: Colors.purple,
                            ),
                             Text("Offers ",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),


                      const SizedBox(width: 20,),

                      // add laptop
                     
                       GestureDetector(
                        onTap: () {
                           showBottomSheet();
                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.laptop  ,
                              size: 24,
                              color: Colors.purple,
                            ),
                             Text("Sell your laptop",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),

                      const SizedBox(width: 20,),

                        GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const Login();
                          }));
                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person_2_outlined,
                              size: 24,
                              color: Color.fromARGB(255, 160, 8, 206),
                            ),
                             Text("Log Out" , style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
          ),
        
             Expanded(
               child: ListView.builder(
              
                  itemCount:isMainList? mainList.length:cartList.length ,
                  itemBuilder: (context, index) {
                    return Container(
                      
                      decoration: BoxDecoration(  
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(  
                            color: Colors.grey ,
                            offset: Offset(5,5),
                            blurRadius: 10,
                          )
                        ]
                      ),
                      margin: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(10),
                                   
                                      child: isMainList? Image.network("${mainList[index].mainImage}",
                                        height: 170,
                                        width: 200,
                                      ):Image.network(
                                        "${cartList[index].mainImage}",
                                        height: 170,
                                        width: 200,
                                      ),
                                    ),
                                  ],
                                ),
=======
            child: isSetting
                ? Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 6,
                        ),
                        GestureDetector(
                          onTap: () async {
                            cartList = await getKartData();

                            isMainList = false;

                            // mainList = cartList ;
                            setState(() {});
                          },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_bag_outlined,
                                size: 24,
                                color: Colors.purple,
>>>>>>> 88fe2db32ff427d09f69486666632e13cd2dc8a4
                              ),
                              Text("Cart",
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),

                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const AddToCart();
                            }));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
<<<<<<< HEAD
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return Info(
                                            mainList[index].mainImage,
                                            mainList[index].subImage1,
                                            mainList[index].subImage2,
                                            mainList[index].subImage3,
                                            mainList[index].nameOflaptop,
                                            mainList[index].specification ,
                                            mainList[index].actualPrice ,
                                            mainList[index].offerPrice 
                                            );
                                      }));
                                    },
                                    child: Container(
                                      width: 200,
                                      child:isMainList? Text(
                                        "${mainList[index].nameOflaptop}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ):Text(
                                        "${mainList[index].nameOflaptop}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                   Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        mainList[index].offerPrice ,
                                        style:const  TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                      Text(
                                        "- ${mainList[index].actualPrice}",
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough),
=======
                                  const Icon(Icons.favorite_border,
                                      color: Colors.purple, size: 18),
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        color: Colors.purple,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Center(
                                        child: Text("$wishListCount",
                                            style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.white))),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              const Text("WishList",
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),

                        const SizedBox(
                          width: 20,
                        ),

                        GestureDetector(
                          onTap: () {},
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.discount,
                                size: 22,
                                color: Colors.purple,
                              ),
                              Text("Offers ",
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),

                        const SizedBox(
                          width: 20,
                        ),

                        // add laptop

                        GestureDetector(
                          onTap: () {
                            showBottomSheet();
                          },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.laptop,
                                size: 24,
                                color: Colors.purple,
                              ),
                              Text("Insert laptop",
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),

                        const SizedBox(
                          width: 20,
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return const Login();
                            }));
                          },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person_2_outlined,
                                size: 24,
                                color: Color.fromARGB(255, 160, 8, 206),
                              ),
                              Text(
                                "Log Out",
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: isMainList ? mainList.length : cartList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(top: 30),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    // decoration: BoxDecoration(
                                    //   border: Border.all(color: Colors.black)
                                    // ),
                                    child: isMainList
                                        ? Image.network(
                                            "${mainList[index].mainImage}",
                                            height: 170,
                                            width: 200,
                                          )
                                        : Image.network(
                                            "${cartList[index].mainImage}",
                                            height: 170,
                                            width: 200,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Info(
                                          mainList[index].mainImage,
                                          mainList[index].subImage1,
                                          mainList[index].subImage2,
                                          mainList[index].subImage3,
                                          mainList[index].nameOflaptop,
                                          mainList[index].specification);
                                    }));
                                  },
                                  child: SizedBox(
                                      width: 200,
                                      child: isMainList
                                          ? Text(
                                              "${mainList[index].nameOflaptop}",
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          : Text(
                                              "${mainList[index].nameOflaptop}",
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                const Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Rs 17,999 ",
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                    Text(
                                      "- Rs 23,999",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("(-45%)"),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        const Color.fromARGB(255, 156, 11, 142),
                                  ),
                                  child: TextButton(
                                    onPressed: () async {
                                      await addToKart(mainList[index]);
                                    },
                                    style: const ButtonStyle(
                                      fixedSize: MaterialStatePropertyAll(
                                          Size(170, 35)),
                                    ),
                                    child: isMainList
                                        ? const Text(
                                            " ADD TO CART ",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255)),
                                          )
                                        : const Row(
                                            children: [
                                              Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 22,
                                              ),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              Text("Buy Now",
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 255, 255, 255),
                                                      fontSize: 18)),
                                            ],
                                          ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await insetToCart(
                                      CardsClass(
                                          imageLink: mainList[index].mainImage,
                                          actualPrice: 400,
                                          nameOflaptop:
                                              mainList[index].nameOflaptop,
                                          offerPrice: 200,
                                          quantity: 3),
                                    );
                                  },
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.favorite_outline,
                                        color: Colors.red,
>>>>>>> 88fe2db32ff427d09f69486666632e13cd2dc8a4
                                      ),
                                     const  SizedBox(
                                        width: 5,
                                      ),
<<<<<<< HEAD
                                     const  Text("(-45%)"),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromARGB(255, 156, 11, 142),
                                    ),
                                    child: TextButton(
                                        onPressed: ()async { 
               
                                         await  addToKart(mainList[index]);
                                          ScaffoldMessenger.of(context).showSnackBar(
                                         const SnackBar(
                                        content: Text('Added to Kart'),
                                        
                                      )
                                      );
                                        },
                                        style: const ButtonStyle(
                                          fixedSize: MaterialStatePropertyAll(
                                              Size(170, 35)),
                                        ),
                                        child: isMainList? const Text(
                                          " ADD TO CART ",
                                          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                                        ):const Row(
                                          children: [
                                            Icon(Icons.add , color: Colors.white,size: 22,),
                                            SizedBox(width: 3,),
                                            Text("Buy Now",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize: 18)),
                                          ],
                                        ),
                                        ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  GestureDetector(

                                    onTap: ()async{
                                      await  insetToCart(
                                        CardsClass(imageLink: mainList[index].mainImage, actualPrice: 400, nameOflaptop: mainList[index].nameOflaptop, offerPrice: 200, quantity: 3),
                                      );
                                    
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Added to Wishlist'),
                                        
                                      
                                      )

                                    );

                                    },
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.favorite_outline,
                                          color: Colors.red,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "ADD TO WISHLIST ",
                                          style: TextStyle(color: Colors.red),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ))
                            ],
                          ),
                          //  Text("Description",style: TextStyle(fontSize: ),)
                        ],
                      ),
                    );
                  }),
             ),
        
=======
                                      Text(
                                        "ADD TO WISHLIST ",
                                        style: TextStyle(color: Colors.red),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ))
                          ],
                        ),
                        //  Text("Description",style: TextStyle(fontSize: ),)
                      ],
                    ),
                  );
                }),
          ),
>>>>>>> 88fe2db32ff427d09f69486666632e13cd2dc8a4
        ]));
  }
}
