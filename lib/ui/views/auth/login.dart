import 'package:absensi/domain/controllers/app_controller.dart';
import 'package:absensi/domain/controllers/auth/auth_controller.dart';
import 'package:absensi/ui/widgets/button/default_btn.dart';
import 'package:absensi/ui/widgets/button/icon_btn.dart';
import 'package:absensi/ui/widgets/textfields/text_form.dart';
import 'package:absensi/utils/assets.dart';
import 'package:absensi/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HelpCenter(),
            CompanyLogo(),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            DefaultIconButton(
              label: 'Butuh Bantuan',
              icon: Icons.headset_mic_outlined,
              onPressed: () {},
              bgColor: AppColors.primarySwatch.shade50,
              fgColor: AppColors.primarySwatch.shade500,
            ),
          ]),
        ),
      ],
    );
  }
}

class CompanyLogo extends StatelessWidget {
  const CompanyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Image.asset(
        Assets.logo,
        width: 183,
        height: 183,
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    final AppController appController = Get.find();

    return Container(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            InputTextFields(
              label: 'Email/Username',
              hint: 'Masukan email atau username',
              isPassword: false,
            ),
            SizedBox(
              height: 16,
            ),
            InputTextFields(
              label: 'Password',
              hint: 'Masukan password',
              isPassword: true
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Lupa Password?',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            SizedBox(
              width: double.infinity,
              child: DefaultButton(
                label: 'Masuk',
                onPressed: () {
                  authController.onMove();
                },
                bgColor: AppColors.primaryColor,
                fgColor: AppColors.backgroundColor
              ),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                'Version ${appController.version.value}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.greyColor,
                ),
              ),
            )
          ],
        )
      );
  }
}
