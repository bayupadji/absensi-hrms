import 'package:absensi/ui/views/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:absensi/utils/colors.dart';
import 'package:absensi/utils/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isloading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      isloading = false;
    });

    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => OnboardingPage())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isloading
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(Assets.logo),
                width: 200,
                height: 200,
              ),
              SizedBox(height: 16,),
              CircularProgressIndicator(
                color:AppColors.primaryColor,
              ),
            ],
          )
          : Container(),
        ),
    );
  }
}
