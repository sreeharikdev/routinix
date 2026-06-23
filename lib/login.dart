import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routinix/hourinput.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}
final _controller=PageController();
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 7, 12, 20),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 134, left: 48.81),
            child: Container(
              height: 317.37,
              width: 312.48,
              child: Column(spacing: 50,children: [Image.asset('assets/images/Group.png',width: 119.69,height: 121.48,),
              Container(width: 317.37,height: 112,child: Column(
                children: [
                  Text.rich(textAlign: TextAlign.center,(TextSpan(text:'Stop letting distractions decide your',style: GoogleFonts.oxanium(color: Colors.white,fontSize: 25.39,fontWeight: FontWeight(600)),children: <TextSpan>[TextSpan(text: ' Future',style: GoogleFonts.oxanium(color: Colors.amber,fontSize: 25.39,fontWeight: FontWeight(600)))]) )),
                  Text('Build routines. Stay focused. Avoid distractions.',textAlign: TextAlign.center,style: GoogleFonts.inter(fontSize: 14,color: Color.fromARGB(255, 255, 255, 255)),)
                ],
              ),),
              
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200,left: 46.96),
            child: SmoothPageIndicator(controller: _controller, count: 3,effect: ColorTransitionEffect(activeDotColor: Colors.yellowAccent,dotColor: Color.fromARGB(226, 255, 255, 255)),)
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 37),
            child: Container(height: 120,width: 335,child: Column(children: [
              Material(color: Colors.amber,borderRadius: BorderRadius.circular(5),child: InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Hourinput()));
              },child: Container(height: 50,width: 335,child: Align(alignment: AlignmentGeometry.center,child: Text('Get started',style: GoogleFonts.oxanium(fontSize: 20,fontWeight: FontWeight(600),),textAlign: TextAlign.center,)),)),),
              SizedBox(height: 20,),
              Material(color: const Color.fromARGB(0, 255, 193, 7),child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),border: Border.all(width: .8,color: const Color.fromARGB(255, 223, 220, 213))),height: 50,width: 335,child: Align(alignment: AlignmentGeometry.center,child: Text('I ALREADY HAVE AN ACCOUNT',style: GoogleFonts.oxanium(color: Colors.amber,fontSize: 20,fontWeight: FontWeight(600),),textAlign: TextAlign.center,)),),),
            ],),),
          )
        ],
      ),
    );
  }
}
