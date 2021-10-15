import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_app_ui/Tabs.dart';
import 'package:mask_app_ui/mask-details.dart';
import 'package:mask_app_ui/shoes-details.dart';
import 'package:mask_app_ui/shoes-model.dart';
import 'mask-model.dart';



void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: Home(),
    );
  }
}
class Home extends StatelessWidget {
  const Home({Key  key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24,

            ),
            Row(
              children: [
                SizedBox(width: 24,),
                SvgPicture.asset("assets/menu.svg",width:35,height:35,),
                Spacer(),
                SvgPicture.asset("assets/shopping-bag.svg",width:30,height:30,),
                SizedBox(width: 20,),
              ],
            ),
            SizedBox(height: 16,),
            Text("  Acessories",
              style: GoogleFonts.openSans(fontWeight: FontWeight.w300,fontSize: 30),
            ),
            Tabs(),
            Expanded(child:
            Container(
              padding: EdgeInsets.all(24),
              width: double.infinity,
              color: Colors.grey.withOpacity(0.3),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Professional ",
                       style: GoogleFonts.openSans(fontWeight: FontWeight.w300,fontSize: 24),
                              ),
                              Spacer(),
                              Text("More",
                                style: GoogleFonts.openSans(fontWeight: FontWeight.w300,fontSize: 15),
                              ),

                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  MaskItem(maskData: profList[0],),
                                  MaskItem(maskData: profList[2],),
                                  ShoeItem(shoeData: profList1[0],),
                                  ShoeItem(shoeData: profList1[2],),
                                  
                                ],),
                              Spacer(),
                              Column(
                                children: [
                                  MaskItem(maskData: profList[1],),
                                  MaskItem(maskData: profList[3],),
                                  ShoeItem(shoeData: profList1[1],),
                                  ShoeItem(shoeData: profList1[3],),

                                  
                                ],),
                              SizedBox(height: 50,)

                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Designing ",
                                style: GoogleFonts.openSans(fontWeight: FontWeight.w300,fontSize: 24),
                              ),
                              Spacer(),
                              Text("More",
                                style: GoogleFonts.openSans(fontWeight: FontWeight.w300,fontSize: 15),
                              ),

                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  MaskItem(maskData: designerList[0],),
                                  MaskItem(maskData: designerList[2],),
                                  ShoeItem(shoeData: designerList1[0],),
                                  ShoeItem(shoeData: designerList1[2],),
                                ],),
                              Spacer(),
                              Column(
                                children: [
                                  MaskItem(maskData: designerList[1],),
                                  MaskItem(maskData: designerList[3],),
                                  ShoeItem(shoeData: designerList1[0],),
                                  ShoeItem(shoeData: designerList1[2],),
                                ],),
                              SizedBox(height: 50,)

                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            )
          ],
        ),
      ),
    );
  }
}


class MaskItem extends StatelessWidget {
  final MaskModel maskData;

  MaskItem({this.maskData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.push(context, CupertinoPageRoute(builder: (ctx)=>MaskDetails(maskData: maskData,))),
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.5,
              width:  MediaQuery.of(context).size.width * 0.4,
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.1,left: 10,right: 10),
              decoration: BoxDecoration(
                color: maskData.color,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Image.asset(maskData.assetname),
            ),
            Positioned(
              bottom: 0,
                child:ClipPath(
                  clipper: ItemClipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.15,
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30),

                      )
                    ),
                    alignment: Alignment.bottomCenter,
                    child: Text(maskData.name,
                      style: GoogleFonts.openSans(fontWeight: FontWeight.w500,fontSize: 20),
                    ),
                  ),
                ) ),
            Positioned(top:10,right: 10,child: LikeButtons(),),
          ],

        ),
      ),
    );
  }
}

class ShoeItem extends StatelessWidget {
  final ShoeModel shoeData;

  ShoeItem({this.shoeData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.push(context, CupertinoPageRoute(builder: (ctx)=>ShoeDetails(shoeData: shoeData,))),
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.5,
              width:  MediaQuery.of(context).size.width * 0.4,
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.1,left: 10,right: 10),
              decoration: BoxDecoration(
                color: shoeData.color,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Image.asset(shoeData.assetname),
            ),
            Positioned(
              bottom: 0,
                child:ClipPath(
                  clipper: ItemClipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.15,
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30),

                      )
                    ),
                    alignment: Alignment.bottomCenter,
                    child: Text(shoeData.name,
                      style: GoogleFonts.openSans(fontWeight: FontWeight.w500,fontSize: 20),
                    ),
                  ),
                ) ),
            Positioned(top:10,right: 10,child: LikeButtons1(),),
          ],

        ),
      ),
    );
  }
}

class ItemClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    Path path=Path();
    path.moveTo(0,size.height*0.5 );
    path.quadraticBezierTo(5, -5, size.width*0.2, size.height*0.2);
    path.lineTo(size.width*0.9,size.height*0.4);
    path.quadraticBezierTo(size.width , size.height*0.45 , size.width , size.height*0.5 );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper)
  {
    return false;
  }
}
