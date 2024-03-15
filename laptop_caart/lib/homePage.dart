import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:laptop_caart/data2.dart';
import 'package:laptop_caart/login.dart';

import 'laptopInfo.dart';

 List mainList = [];


class Laptops extends StatefulWidget {
  const Laptops({super.key});

  @override
  State<Laptops> createState() {
    return _LaptopState();
  }
}

class LaptopData {
final String mainImage  ;
final String subImage1  ;
final String subImage2 ;
final String subImage3 ;
final String nameOflaptop ;
final String specification ;


LaptopData({ required this.mainImage ,
             required this.subImage1 ,
             required this.subImage2 ,
             required this.subImage3 ,
             required this.nameOflaptop ,
             required this.specification
          });


Map<String , dynamic> laptopDataMap(){
  return {
    'mainImage':mainImage ,
    'subImage1':subImage1 ,
    'subImage2': subImage2 ,
    'subImage3': subImage3,
    'nameOflaptop':nameOflaptop ,
    'specification':specification 
  };
}

@override
   String toString() {
    // TODO: implement toString
    return '{mainImage:$mainImage,subImage1:$subImage1,subImage2:$subImage2,subImage3:$subImage3 , nameOflaptop:$nameOflaptop, specification:$specification }';
  }

}

class _LaptopState extends State<Laptops> {
  
 
   
  
  int wishListCount = 0;
 
  final TextEditingController _name = TextEditingController();
  final TextEditingController _mainImage= TextEditingController();
  final TextEditingController _subImage1 = TextEditingController();
  final TextEditingController _subImage2 = TextEditingController();
  final TextEditingController _subImage3 = TextEditingController();
  final TextEditingController _specification = TextEditingController();

  void  getLapData()async{

    mainList =await  getLaptopData();
    print(mainList);

    setState(() {

      
    });
   
   }


  
  void showBottomSheet()  {

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              //height: 600,

              color: Colors.grey.shade100,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                //  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: double.infinity,
                      margin:
                          const EdgeInsets.only(left: 50, right: 50, top:10),
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
                              borderSide: const BorderSide(color: Colors.red)),

                              
                        ),
                        onTap: (){
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
                              borderSide: const BorderSide(color: Colors.red)),

                              
                        ),
                        onTap: (){
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
                              borderSide: const BorderSide(color: Colors.red)),

                              
                        ),
                        onTap: (){
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
                          hintText: "Add SubImage2 Adress",
                        //  errorText: isError ? errorMsg(_Title.text) : null,
                          focusColor: Colors.black,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Colors.red)),

                              
                        ),
                        onTap: (){
                        //  isError = false ;

                        },
                      ),
                    ),
                   
                    Container(
                      width: double.infinity,
                      margin:
                          const EdgeInsets.only(left: 50, right: 50, top: 10,bottom: 2),
                      child: TextField(
                          controller: _specification,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Add specification",
                            focusColor: Colors.black,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            suffix: const Icon(Icons.calendar_month),
                          ),
                         
                          ),
                    ),
                    Container(
                      width: 300,
                      height: 50,
                      margin:
                          const EdgeInsets.only(left: 50, right: 50, top: 10),
                      child: ElevatedButton(
                        onPressed: ()async {
                          await  creatingLaptopDatabase();

                          await  insertLaptop(
                            LaptopData(  
                              nameOflaptop: _name.text,
                              mainImage: _mainImage.text ,
                              subImage1: _subImage1.text ,
                              subImage2: _subImage2.text ,
                              subImage3: _subImage3.text ,
                              specification: _specification.text ,

                            ) 
                          );

                           getLapData();

                          _name.clear();
                          _mainImage.clear();
                          _subImage1.clear();
                          _subImage2.clear();
                          _subImage3.clear();
                          _specification.clear();
                          
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
          );
        });
  }



  AppBar _appbarFunction() {
    return AppBar(
        leading:
            const Icon(Icons.laptop_mac_outlined, color: Colors.red, size: 34),
        backgroundColor: const Color.fromARGB(255, 24, 23, 23),
        foregroundColor: Colors.white,
        title: const Text("LaptopHub"),
        actions: [
          GestureDetector(
            onTap: (){
               Navigator.pushReplacement(context, MaterialPageRoute(builder:(context){
                     return const Login();
                   }));

            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.person_2_outlined,
                  size: 18,
                ),
                GestureDetector(
                 
                  child: const Text("Log Out"),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.favorite_border, size: 18),
                  Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: Text("$wishListCount",
                            style:
                                const TextStyle(fontSize: 10, color: Colors.white))),
                  ),
                ],
              ),
              const Text("WishList")
            ],
          ),
          const SizedBox(width: 15,),
          GestureDetector(
            onTap: (){
              showBottomSheet();
            },
            child: const Column(  
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                Icon(Icons.add),
                Text("add")
            
              ],
            ),
          ),
         
          SizedBox(width: 15,)
        ]);
  }

  
@override
  Widget build(BuildContext conetxt) {
    return 
    
    Scaffold(
       
        appBar: _appbarFunction(),
        body: ListView.builder(
            itemCount: mainList.length,
            itemBuilder: (context, index) {
              return 
                 Container(
                  margin: const EdgeInsets.only(top: 30),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  margin:const EdgeInsets.all(10),
                                  // decoration: BoxDecoration(
                                  //   border: Border.all(color: Colors.black)
                                  // ),
                                  child: Image.network(
                                    "${mainList[index].mainImage}",
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
                                onTap: (){
                                
            
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Info(
                        mainList[index].mainImage,
                        mainList[index].subImage1,
                        mainList[index].subImage2,
                        mainList[index].subImage3,
                        mainList[index].nameOflaptop,
                        mainList[index].specification);
                  }));
                                },
                                child: Container(
                                  width: 200,
                                  child: Text(
                                    "${mainList[index].nameOflaptop}",
                                    style:const  TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
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
                                style:
                                    TextStyle(color: Colors.grey,decoration: TextDecoration.lineThrough),
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
                                    onPressed: () {},
                                    style:const  ButtonStyle(
                                      fixedSize: MaterialStatePropertyAll(
                                          Size(170, 35)),
                                    ),
                                    child:const  Text(
                                      " ADD TO CART ",
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const  Row(
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
                              )
                            ],
                          ))
                        ],
                      ),
                      //  Text("Description",style: TextStyle(fontSize: ),)
                    ],
                  ),
              
              );
            }));
  }
}
