import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routinix/hourinput.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 32, 31, 28),
      body: Stack(
        children: [Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    radius: 3,
                    center: AlignmentGeometry.topLeft,
                    colors: [Color.fromARGB(19, 223, 184, 43), Colors.black,Colors.black,Color.fromARGB(19, 223, 184, 43)],
                    stops: [0.0, 0.4,0.5,1],
                  ),
                ),
              ),
            ),
          ),
          
          Positioned.fill(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 60.0),
                child: Container(color: const Color.fromARGB(24, 49, 81, 110)),
              ),
            ),
          ),SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final contentWidth = constraints.maxWidth.clamp(0.0, 420.0);
              final isShort = constraints.maxHeight < 700;
        
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 32,
                      ),
                      child: SizedBox(
                        width: contentWidth,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: isShort ? 12 : 56),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/Group.png',
                                  width: isShort ? 96 : 120,
                                  height: isShort ? 98 : 122,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(height: isShort ? 28 : 50),
                                Text.rich(
                                  textAlign: TextAlign.center,
                                  TextSpan(
                                    text: 'Stop letting distractions decide your',
                                    style: GoogleFonts.oxanium(
                                      color: Colors.white,
                                      fontSize: isShort ? 23 : 25.39,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: ' Future',
                                        style: GoogleFonts.oxanium(
                                          color: Colors.amber,
                                          fontSize: isShort ? 23 : 25.39,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'Build routines. Stay focused. Avoid distractions.',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: isShort ? 56 : 140),
                            SmoothPageIndicator(
                              controller: _controller,
                              count: 3,
                              effect: const ColorTransitionEffect(
                                activeDotColor: Colors.yellowAccent,
                                dotColor: Color.fromARGB(226, 255, 255, 255),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Column(
                              children: [
                                Material(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(5),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(5),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Hourinput(),
                                        ),
                                      );
                                    },
                                    child: SizedBox(
                                      height: 50,
                                      width: double.infinity,
                                      child: Center(
                                        child: Text(
                                          'Get started',
                                          style: GoogleFonts.oxanium(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Material(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(5),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(5),
                                    onTap: () {},
                                    child: Container(
                                      height: 50,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          width: .8,
                                          color: const Color.fromARGB(
                                            255,
                                            223,
                                            220,
                                            213,
                                          ),
                                        ),
                                      ),
                                      child: Center(
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            'I ALREADY HAVE AN ACCOUNT',
                                            style: GoogleFonts.oxanium(
                                              color: Colors.amber,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),]
      ),
    );
  }
}
