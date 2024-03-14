

import 'package:flutter/material.dart';
import 'package:laptop/laptopInfo.dart';
class Laptops extends StatefulWidget {

  State<Laptops> createState(){
    return _LaptopState() ;
  }
}


class _LaptopState extends State<Laptops>{


  String specification = "Categories: 2 year warranty, 256GB SSD, Budget Laptop, Deals of Today, HP, I5-6th Gen, Intel Processor, Laptop, Laptop Under 20000, Laptop Under 25000, Laptop Under 30000, Laptop Under 39999, Laptops with SSD, Mini HP, Mini Laptop, New Arrival, Ram 4 GB, Refurbished HP, Refurbished Laptops, Stock Clearance Deal Brand: HP";


  List images = [
    {
      'nameOflaptop': "Refurbished HP ProBook 650G1 I5-4th Gen 8GB Ram 500GB HDD 2 Years Warranty",
      'mainImage':"https://retechie.com/wp-content/uploads/2020/02/9480m.png",
      'subImage1':"https://retechie.com/wp-content/uploads/2020/02/9480m.1-1.jpg",
      'subImage2':"https://retechie.com/wp-content/uploads/2020/02/9480m-1.jpg",
      'subImage3':"https://retechie.com/wp-content/uploads/2020/02/9480m.2-1-1.jpg",

     
    },
    {
     'nameOflaptop': "Certified Refurbished Hp Compaq 6510b",
      'mainImage':"https://retechie.com/wp-content/uploads/2021/04/oie_OtLBOJB52g0p.jpg",
      'subImage1':"https://retechie.com/wp-content/uploads/2021/04/compaq.jpg",
      'subImage2':"https://retechie.com/wp-content/uploads/2021/04/compaq.2.jpg",
      'subImage3':"https://retechie.com/wp-content/uploads/2021/04/compaq.jpg",

     
    },
     {
     'nameOflaptop': "Refurbished HP EliteBook 1030 G2(I7-7th)",
      'mainImage':"https://retechie.com/wp-content/uploads/2020/02/1030-g2-1.png  ",
      'subImage1':"https://retechie.com/wp-content/uploads/2020/02/1030-g2-1.png",
      'subImage2':"https://retechie.com/wp-content/uploads/2020/02/1030-g21-1024x674.jpg",
      'subImage3':"https://retechie.com/wp-content/uploads/2020/02/1030-g2-1.png",

     
    },
     {
      'nameOflaptop': "Refurbished Dell Latitude E4310( Core I5 4GB Ram 500GB HDD 13.3 Inch Windows 10 Pro)",
      'mainImage':"https://retechie.com/wp-content/uploads/2022/03/4310.jpg",
      'subImage1':"https://retechie.com/wp-content/uploads/2022/03/4310-2.jpg",
      'subImage2':"https://retechie.com/wp-content/uploads/2020/02/9480m-1.jpg",
      'subImage3':"https://retechie.com/wp-content/uploads/2022/03/4310-1.jpg" ,

   
    },
     {
     'nameOflaptop': " Refurbished HP EliteBook 830 G5 I7-8th Gen 8GB Ram 256GB SSD 2 Years Warranty",
      'mainImage':"https://retechie.com/wp-content/uploads/2022/05/HP-830G3-2.jpg",
      'subImage1':"https://retechie.com/wp-content/uploads/2021/09/830g5.jpg",
      'subImage2':"https://retechie.com/wp-content/uploads/2022/05/HP-830G3-2.jpg",
      'subImage3':"https://retechie.com/wp-content/uploads/2022/05/HP-830G3-2.jpg",
    },
     { 
     'nameOflaptop': "Refurbished Apple MacBook Air A1466 I5-5th Gen 4GB Ram 128GB SSD 2015 Model",
      'mainImage':"https://retechie.com/wp-content/uploads/2020/02/9480m.png",
      'subImage1':"https://retechie.com/wp-content/uploads/2020/02/9480m.1-1.jpg",
      'subImage2':"https://retechie.com/wp-content/uploads/2020/02/9480m-1.jpg",
      'subImage3':"https://retechie.com/wp-content/uploads/2020/02/9480m.2-1-1.jpg",
    },
     {
     'nameOflaptop': "Refurbished HP EliteBook 820 G3(I5-6th 4GB 256GB SSD 2 Year Warranty",
      'mainImage':"https://retechie.com/wp-content/uploads/2022/06/820g3.png",
      'subImage1':"https://retechie.com/wp-content/uploads/2020/08/820-G3.1.jpg",
      'subImage2':"https://retechie.com/wp-content/uploads/2020/08/820-G3.2.jpg",
      'subImage3':"https://retechie.com/wp-content/uploads/2020/02/9480m.2-1-1.jpg",
    }

  ];



  AppBar  _appbarFunction(){
    return AppBar(
        leading: Icon(Icons.laptop_mac_outlined, color: Colors.red, size:34) ,
        backgroundColor: const Color.fromARGB(255, 24, 23, 23),
        foregroundColor: Colors.white,
        title:Text("LaptopHub"),
        actions: [
            Column(  
            mainAxisAlignment: MainAxisAlignment.center,
            children: [  
              Icon(Icons.person_2_outlined,size: 18,),
              Text("login"),
            ],
           ),
           SizedBox(width: 25,),
           Column(  
            mainAxisAlignment: MainAxisAlignment.center,
            children: [  
              Row( 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ 
                  Icon(Icons.favorite_border, size:18 ),
                  Container( 
                    height: 15,
                    width: 15,
                     decoration: BoxDecoration( 
                      color: Colors.black, 
                       borderRadius : BorderRadius.circular(15)
                     ),
                      child: Center(child: Text("$wishListCount" , style: TextStyle(fontSize: 10 , color: Colors.white))),
                   ),

                ],
              ),
              
              Text("WishList")
            ],
           ) ,
           SizedBox(width: 20,),
         
        ]
      );
  }

  int wishListCount = 0 ;


  Widget build(BuildContext conetxt){
    return Scaffold(
      
    //  backgroundColor: Colors.grey.shade100,
      appBar : _appbarFunction(),

      body: 
      ListView.builder(
        itemCount : images.length ,
        itemBuilder: (context , index){
          return GestureDetector(

            onTap: (){
              Navigator.push(context , MaterialPageRoute(builder: (context){
                return Info(images[index]["mainImage"],images[index]["subImage1"],images[index]["subImage2"],images[index]["subImage3"],images[index]["nameOflaptop"],specification);

              }));
            },
            child: Container( 
              margin: EdgeInsets.only(top: 30),
              color: Colors.white,
              
              child:  Column(
                children: [
                  
                  Row(  
                    crossAxisAlignment: CrossAxisAlignment.center,
                  
                    children: [  
                    
                        Expanded(
                          child: Column(  
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [  
                          
                              Container(  
                                margin: EdgeInsets.all(10),
                                // decoration: BoxDecoration(  
                                //   border: Border.all(color: Colors.black)
                                // ),
                                child: Image.network( "${images[index]["mainImage"]}",height: 170,width: 200,),
                          
                              ),
                          
                              // Row(
                              //   children: [  
                                  
                              // Container(
                              //   child:Image.network("${images[index]["subImage1"]}",height: 60,width: 60, )
                              //   ),
                              //    Container(
                              //   child:Image.network("${images[index]["subImage2"]}",height: 60,width: 60, )
                              //   ),
                              //    Container(
                              //   child:Image.network("${images[index]["subImage3"]}",height: 60,width: 60, )
                              //   ),
                          
                              //   ],
                              // ),
                          
                            ],
                          ),
                        ),
                  
                        Expanded(
                          child:   Column(  
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [  
                              Container(
                                width: 200,
                                child: Text("${images[index]["nameOflaptop"]}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                               ),
                               SizedBox(height: 6,),
                              const  Row (
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [ 
                                Text("Rs 17,999 - Rs 23,999", style: TextStyle(color: Colors.red ,),),
                                SizedBox(width: 5,),
                                Text("(-45%)"),
                   
                                ],
                               ),
                               SizedBox(height: 20,),
                  
                               Container(
                                decoration: BoxDecoration( 
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black,
                  
                                ),
                                 child: TextButton(onPressed: (){
                                 
                                 },
                                 style: ButtonStyle(  
                                  fixedSize:MaterialStatePropertyAll(Size(170, 35)),
                                 ),
                                  child: Text(" ADD TO CART ",style: TextStyle(color: Colors.white),)),
                               ),
                               SizedBox(height: 5,),
                  
                               Row(  
                                children: [  
                                  Icon(Icons.favorite_outline, color: Colors.red,),
                                  SizedBox(width: 5,),
                               Text("ADD TO WISHLIST ",style: TextStyle(color: Colors.red),)                      
                  
                                ],
                               )
                            ],
                          )
                        )
                    ],
                             
                  ),
                //  Text("Description",style: TextStyle(fontSize: ),)
                ],
              ),
            ),
          );
        }
        )
      
    );



    
  }

}