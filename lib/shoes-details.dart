import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_app_ui/mask-model.dart';
import 'shoes-model.dart';
import 'mask-details.dart';

String RandomText="It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 ";
class ShoeDetails extends StatelessWidget {

  final ShoeModel shoeData;
  ShoeDetails({this.shoeData});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,

        ),
        actions: [
          SvgPicture.asset("assets/shopping-bag.svg",width: 30,height: 30,),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Container(
        height: height,
        width: width,
        child: Stack(
          children: [
            Container(
              width: width,
              height: height *0.2,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30)
                )
              ),
              alignment: Alignment.topRight,
              child: Icon(Icons.more_horiz_outlined,
                size: 30,
                color: Colors.white,

              ),
            ),
            ClipPath(
              clipper: BackgroundClipper(),
              child: Container(
                padding: EdgeInsets.only(
                    bottom: height *0.01,left: 20,right: 20),
                height: height *0.6,
                width: width,
                decoration: BoxDecoration(
                  color: shoeData.color,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                )
                ),
                child: Image.asset(shoeData.assetname),

              ),
            ),
            Positioned(top:20,bottom: 20,child: LikeButtons(),),
            Positioned(bottom: 0,
            child: ClipPath(
              clipper: BackgroundClipper(),
              child: Container(
                padding: EdgeInsets.only(
                    left: 20,right: 20),
                height: height *0.5,
                width: width,
                decoration: BoxDecoration(
                    color: Color(0xfff1e9e9),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                                          )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.07,),
                    Text(shoeData.name,
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(height: height * 0.02,),
                    Text(RandomText,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.openSans(
                        height: 1.5,
                        letterSpacing: 1.5,
                      ),
                    ),
                    Spacer(),
                    Expanded(

                      child: Row(
                        children: [
                          Text("Similar Products",
                            style: GoogleFonts.openSans(fontWeight: FontWeight.w300,fontSize: 24),
                          ),
                          Spacer(),
                          Text("Show All",
                            style: GoogleFonts.openSans(fontWeight: FontWeight.w300,fontSize: 15),
                          ),

                        ],
                      ),
                    ),
                   SizedBox(height: 12,),
                    Container(
                      height: height *0.12,
                      width: width,
                      child: ListView.builder(
                        itemCount: masks.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx,i){
                          return Container(
                          margin: EdgeInsets.only(right:20 ),
    width: height *0.12,
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    ),
                            child: Image.asset(shoes[i]),

                          );

                        },
                      ),
                    ),
                    Spacer(),
                    Row(

                      children: [
                        Text("\$  ${shoeData.price}",
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 40,

                        ),


                          ),

                      Spacer(),
                      Container(

                        height: height *0.1,
                        width: width * 0.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        alignment: Alignment.center,
                        child:
                        Text("Shop Now",
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            color: Colors.black,

                          ),


                        ),

                      ),
                ],
                    ),
                    SizedBox(
                      height: 6,
                    )
                  ],
                ),

              ),
            ),),
          ],
        ),
      ),

    );
  }
}

class LikeButtons1 extends StatefulWidget {
  const LikeButtons1({Key key}) : super(key: key);

  @override
  _LikeButtons1State createState() => _LikeButtons1State();
}

class _LikeButtons1State extends State<LikeButtons1> {
  bool isLiked=false;
  Color bgColor=Colors.white;
  Color heartColor=Colors.grey;

  void like(){
    setState(() {
      bgColor=bgColor==Colors.white ? Colors.red :Colors.white;
      heartColor=heartColor==Colors.grey ? Colors.white :Colors.grey;

    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: like,
      child: CircleAvatar(
        backgroundColor: bgColor,
        radius: 18,
        child: Icon(Icons.favorite_outline,
          color: heartColor,
          size: 18,
        ),
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    Path path=Path();
    path.moveTo(40,0 );
    // path.quadraticBezierTo(5, -5, size.width*0.2, size.height*0.2);
    path.lineTo(size.width*0.9,size.height*0.18);
    path.quadraticBezierTo(size.width , size.height*0.2 , size.width , size.height*0.3 );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper)
  {
    return false;
  }
}
