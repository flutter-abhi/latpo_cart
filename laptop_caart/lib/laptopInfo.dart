import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



String? mainImage ;
String? subImage1 ;
String? subImage2 ;
String? subImage3 ;
String? nameOflaptop ;
String? specification ;


class Info extends StatelessWidget {

  Info(String main , String sub1 , String sub2 , String sub3 ,String name , String dis){
    mainImage = main ;
    subImage1 = sub1 ;
    subImage2 = sub2 ;
    subImage3 = sub3 ;
    nameOflaptop= name ;
    specification = dis ;

  }

  Widget build(BuildContext context){
    return LaptopInfo();
  }
  
}
class LaptopInfo extends StatefulWidget {
  const LaptopInfo({super.key});

  @override
  State<LaptopInfo> createState() => _LaptopInfoState();
}

class _LaptopInfoState extends State<LaptopInfo> {

 
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.white,
      body:
      
        Container(
           child: Column(
             children: [
              Expanded(
                flex: 3,
                child: Container( 
                
                  margin: EdgeInsets.only(top:50, left: 15,right: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(  
                    border: Border(bottom: BorderSide(color: Colors.black , width: 2))
                  ),
                 // color: Colors.grey.shade300,
                 child: 
                 Row(  
                  children: [
                 Container(
                  decoration: BoxDecoration(  
                    
                    border:Border(right: BorderSide(color: Colors.black , width: 2), )
           
                  ),
                  child: Image.network( "${ mainImage}",height: 300,width: 260,)),
                 SizedBox(width: 10,),
           
                 Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [  
                                          
                                      GestureDetector(
                                       
                                        child: Container(
                                         child: Image.network("${ subImage1}",height: 60,width: 60, )
                                          ),
                                      ),
                                         GestureDetector(
                                        
                                           child: Container(
                                                  child:Image.network("${subImage2}",height: 60,width: 60, )
                                           ),
                                         ),
                                         GestureDetector(
                                        
                                           child: Container(
                                                    child:Image.network("${subImage3}",height: 60,width: 60, )
                                                 ),
                                         ),
                                  
                                        ],
                                      ),
                                  
           
                  ],
                 )
           
                    
                ),
              ),
               Expanded(
                flex: 4,
                 child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                   child: Container( 
                      padding: EdgeInsets.all(25),
                       decoration: BoxDecoration(  
                     //   color: Colors.grey.shade100,
                      //  borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
                      //  border: Border(top: BorderSide(color: Colors.black , width: 2))
                       ),
                        
                             
                        child:  Column(
                          children: [
                            
                                  Container(
                              
                                    child:   Column(  
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [  
                                         SizedBox(
                                          width: 340,
                                          child: Text("${nameOflaptop}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                         ),  
                                        const  SizedBox(height: 6,),
                                        const  Row (
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [ 
                                          Text("Rs 17,999 - Rs 23,999", style: TextStyle(color: Colors.red ,fontSize: 22),),
                                          SizedBox(width: 5,),
                                          Text("(-45%)"),
                             
                                          ],
                                         ),
                                         const SizedBox(height: 20,),
                            
                                         Container(
                                          decoration: BoxDecoration( 
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.black,
                            
                                          ),
                                           child: TextButton(onPressed: (){
                                           
                                           },
                                           style:const  ButtonStyle(  
                                            fixedSize:MaterialStatePropertyAll(Size(350, 40)),
                                           ),
                                            child: const Text(" ADD TO CART ",style: TextStyle(color: Colors.white),)),
                                         ),
                                         const SizedBox(height: 10,),                
                                        // const  Row(  
                                        //   children: [  
                                        //     Icon(Icons.favorite_outline, color: Colors.red,),
                                        //     SizedBox(width: 5,),
                                        //  Text("ADD TO WISHLIST ",style: TextStyle(color: Colors.red),)                      
                            
                                        //   ],
                                        //  )
                                      ],
                                    )
                                  ),
                              
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text("Specification",style: TextStyle(fontSize: 30))),
                                    Text("${specification}" , style: TextStyle(fontSize: 17),),
                              ],
                                       
                            ),
                          //  Text("Description",style: TextStyle(fontSize: ),)
                          
                      ),
                 ),
               ),
             ],
           ),
         ),
       
     );
  }
}