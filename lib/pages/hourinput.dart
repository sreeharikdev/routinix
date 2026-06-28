import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:routinix/pages/impact.dart';
import 'package:routinix/providers/usage_provider.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Hourinput extends StatefulWidget {
  const Hourinput({super.key});

  @override
  State<Hourinput> createState() => _HourinputState();
}

class _HourinputState extends State<Hourinput> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      if (_counter < 16) {
        _counter++;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  final PageController _pageController = PageController();

 

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    radius: 3,
                    center: AlignmentGeometry.topLeft,
                    colors: [Color.fromARGB(19, 223, 184, 43), Colors.black,Colors.black,Color.fromARGB(19, 223, 184, 43)],
                    stops: [0.0, 0.3,0.6,1],
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
          ),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final contentWidth = constraints.maxWidth.clamp(0.0, 420.0);
                final isShort = constraints.maxHeight < 700;

                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 24,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmoothPageIndicator(
                                controller: _pageController,
                                count: 5,
                                effect: const CustomizableEffect(
                                  dotDecoration: DotDecoration(
                                    width: 60.6,
                                    height: 4,
                                    color: Colors.grey,
                                  ),
                                  activeDotDecoration: DotDecoration(
                                    color: Colors.amber,
                                    width: 60.6,
                                    height: 4,
                                  ),
                                ),
                              ),
                              SizedBox(height: isShort ? 72 : 180),
                              Text(
                                'How many hours do you spend on your phone daily?',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.oxanium(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: isShort ? 36 : 60),
                              Column(
                                children: [
                                  Container(
                                    height: 74,
                                    constraints: const BoxConstraints(
                                      maxWidth: 260,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: const Color.fromARGB(
                                          255,
                                          52,
                                          53,
                                          53,
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                      gradient: const LinearGradient(
                                        begin: AlignmentGeometry.topCenter,
                                        end: AlignmentGeometry.bottomCenter,
                                        colors: [
                                          Color(0xff222222),
                                          Color(0xff121212),
                                        ],
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _CounterButton(
                                          label: '-',
                                          onTap: _decrementCounter,
                                        ),
                                        Container(
                                          height: 56,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1,
                                              color: Colors.grey,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '$_counter',
                                              style: GoogleFonts.oxanium(
                                                color: Colors.amber,
                                                fontSize: 40,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: .96,
                                              ),
                                            ),
                                          ),
                                        ),
                                        _CounterButton(
                                          label: '+',
                                          onTap: _incrementCounter,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'HOURS/DAY',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              LinearPercentIndicator(
                                padding: EdgeInsets.zero,

                                lineHeight: 8.0,
                                percent: (_counter / 16),
                                backgroundColor: const Color.fromARGB(
                                  57,
                                  158,
                                  158,
                                  158,
                                ),
                                progressColor: Colors.amber,
                                widgetIndicator: Container(
                                  width: 10.0,
                                  height: 17.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.amber,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                width: contentWidth,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '1hr',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      '14+hr',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: isShort ? 72 : 140),
                              InkWell(
                                borderRadius: BorderRadius.circular(8),
                                onTap: () async {
                                await context.read<UsageProvider>().updateEstimatedUsage(_counter);

                                if (!context.mounted) {
                                 return;
                                    }

                                  Navigator.push(
                                           context,
                                             MaterialPageRoute(
                                                  builder: (context) => const Impact(),
                                             ),
                                              );
                                                  },
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'CONTINUE',
                                      style: GoogleFonts.oxanium(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
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
          ),
        ],
      ),
    );
  }
}

class _CounterButton extends StatelessWidget {
  const _CounterButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xff2d2d2d),
          border: Border.all(width: 1),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
