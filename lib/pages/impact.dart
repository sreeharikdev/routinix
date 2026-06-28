import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:routinix/providers/usage_provider.dart';
import 'package:routinix/utils/screentimesresults.dart';



import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Impact extends StatefulWidget {
  const Impact({super.key});

  @override
  State<Impact> createState() => _ImpactState();
}

class _ImpactState extends State<Impact> {

@override
void initState(){
  super.initState();

  WidgetsBinding.instance.addPostFrameCallback((_){
    _startImpactFlow();
  });
}


  final PageController _pageController = PageController(initialPage: 1);

  
  
Future<void> _startImpactFlow() async {
  
  final shouldFetchUsage = await showPermissionDialog(context);

  if (!shouldFetchUsage) {
    return;
  }

  openUsageAccessSettings();

  

  if (!mounted) {
    return;
  }

  await context.read<UsageProvider>().fetchAndUpdateScreenTime();
}
 
 
 

 

  void openUsageAccessSettings() async {
    final intent = AndroidIntent(
      action: 'android.settings.USAGE_ACCESS_SETTINGS',
    );
    await intent.launch();
  }

  Future<bool> showPermissionDialog(BuildContext context) async {
    final shouldOpenSettings = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Usage Access Required"),
          content: const Text(
            "To calculate your screen time accurately, we need Usage Access permission. "
            "On the next screen, find this app and toggle 'Allow usage tracking' ON.",
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            ElevatedButton(
              child: const Text("Open Settings"),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );

    return shouldOpenSettings ?? false;
  }





  @override
  Widget build(BuildContext context) {
    final usageProvider=context.watch<UsageProvider>();
    final result = getScreenTimeResult(
      estimatedHours: usageProvider.estimatedUsage,
      actualHours: usageProvider.fetchedUsage
    );
    final mainhours = result.mainHours;
    final wakingdaytext = result.wakingDayText;
    final yearlytext = result.yearlyText;
    final secondcardtext = result.secondCardText;
    final cta = result.cta;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
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
                      vertical: 24,
                    ),
                    child: SizedBox(
                      width: contentWidth,
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
                          SizedBox(height: isShort ? 48 : 72),
                          Text(
                            result.title,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.oxanium(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 40),
                          _ImpactCard(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    mainhours,
                                    style: GoogleFonts.oxanium(
                                      fontSize: 44,
                                      color: Colors.amber,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                _ImpactMetric(
                                  icon: Icons.access_alarm_outlined,
                                  label: wakingdaytext,
                                ),
                                const SizedBox(height: 10),
                                _ImpactMetric(
                                  icon: Icons.calendar_month,
                                  label: yearlytext,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          _ImpactCard(
                            minHeight: 86,
                            child: Text(
                              secondcardtext,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(height: isShort ? 80 : 220),
                          InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  cta,
                                  style: GoogleFonts.oxanium(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
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
    );
  }
}

class _ImpactCard extends StatelessWidget {
  const _ImpactCard({required this.child, this.minHeight = 177});

  final Widget child;
  final double minHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: minHeight),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          stops: [.4, .7],
          begin: AlignmentGeometry.topEnd,
          end: AlignmentGeometry.bottomEnd,
          colors: [Color(0xFF22221E), Color(0xFF121212)],
        ),
        color: Color.fromARGB(255, 31, 30, 30),
        border: Border(
          left: BorderSide(color: Colors.amber, width: 3),
          right: BorderSide(color: Colors.grey, width: 1),
          top: BorderSide(color: Colors.grey, width: 1),
          bottom: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      child: Center(child: child),
    );
  }
}

class _ImpactMetric extends StatelessWidget {
  const _ImpactMetric({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.amber),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: GoogleFonts.inter(fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
