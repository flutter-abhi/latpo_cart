import 'package:flutter/material.dart';
import 'homePage.dart';
import 'data2.dart';

String  mainImage = ""  ;
String  subImage1 = " "  ;
String  subImage2 = " " ;
String subImage3 = " " ;
String nameOflaptop = " " ;
String specification =" " ;
String actualPrice = " ";
String offerPrice = " ";

class Info extends StatelessWidget {

  Info(  String main, String sub1, String sub2, String sub3, String name,String dis , String actual , String offer) {
     mainImage = main;
    subImage1 = sub1;
    subImage2 = sub2;
    subImage3 = sub3;
    nameOflaptop = name;
    specification = dis;
    actualPrice = actual ;
    offerPrice = offer ;
  }
  @override
  Widget build(BuildContext context) {
    return const LaptopInfo();
  }
}

class LaptopInfo extends StatefulWidget {
  const LaptopInfo({super.key});

  @override
  State<LaptopInfo> createState() => _LaptopInfoState();
}

class _LaptopInfoState extends State<LaptopInfo> {
  Image img = Image.network( "${mainImage}",
    height: 300,
    width: 250,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                  margin:const  EdgeInsets.only(top: 50, left: 15, right: 15),
                  width: double.infinity,
                  decoration:const  BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black, width: 2))),
                  // color: Colors.grey.shade300,
                  child: Row(
                    children: [
                      Container(
                          decoration:const  BoxDecoration(
                              border: Border(
                            right: BorderSide(color: Colors.black, width: 2),
                          )),
                          child: img),
                     const  SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                            GestureDetector(
                              onTap: () {
                                img = Image.network(
                                  "${subImage1}",
                                  height: 300,
                                  width: 250,
                                );
                                setState(() {});
                              },
                              child: 
                                Image.network(
                                "${subImage1}",
                                height: 60,
                                width: 60,
                              )),
                            
                            
                               GestureDetector(
                                onTap: () {
                                  img = Image.network(
                                    "${subImage2}",
                                    height: 300,
                                    width: 250,
                                  );
                                  setState(() {});
                                },
                                child: SizedBox(
                                    child: Image.network(
                                  "${subImage2}",
                                  height: 60,
                                  width: 60,
                                )),
                              ),
                          
                            GestureDetector(
                              onTap: () {
                                img = Image.network(
                                  "${mainImage}",
                                  height: 300,
                                  width: 250,
                                );
                                setState(() {});
                              },
                              child: 
                                  Image.network(
                                "${mainImage}",
                                height: 60,
                                width: 60,
                              )),
                            
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  padding:const  EdgeInsets.all(25),
                  decoration:const  BoxDecoration(
                      //   color: Colors.grey.shade100,
                      //  borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
                      //  border: Border(top: BorderSide(color: Colors.black , width: 2))
                      ),

                  child: Column(
                    children: [
                    
                         Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 340,
                            child: Text("$nameOflaptop",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Rs 17,999 ",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 22),
                              ),
                              Text(
                                "- Rs 23,999",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 22,decoration: TextDecoration.lineThrough),
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
                              color: Colors.black,
                            ),
                            child: TextButton(
                                onPressed: ()async {

                                    await  addToKart(LaptopData( mainImage:mainImage, subImage1 : subImage1, subImage2 : subImage2, subImage3 : subImage3, nameOflaptop : nameOflaptop ,specification :specification , actualPrice:actualPrice, offerPrice: offerPrice ));
                                          ScaffoldMessenger.of(context).showSnackBar(
                                         const SnackBar(
                                        content: Text('Added to Kart'),
                                      )
                                      );

                            //      await addToKart(LaptopData(mainImage: ma, subImage1: subImage1, subImage2: subImage2, subImage3: subImage3, nameOflaptop: nameOflaptop, specification: specification));
                                },
                                style: const ButtonStyle(
                                  fixedSize:
                                      MaterialStatePropertyAll(Size(350, 40)),
                                ),
                                child: const Text(
                                  " ADD TO CART ",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // const  Row(
                          //   children: [
                          //     Icon(Icons.favorite_outline, color: Colors.red,),
                          //     SizedBox(width: 5,),
                          //  Text("ADD TO WISHLIST ",style: TextStyle(color: Colors.red),)

                          //   ],
                          //  )
                        ],
                      ),
                      const SizedBox(
                          width: double.infinity,
                          child: Text("Specification",
                              style: TextStyle(fontSize: 30))),
                       Text(specification,
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                  //  Text("Description",style: TextStyle(fontSize: ),)
                ),
              ),
            ),
          ],
        ),
      );
    
  }
}
