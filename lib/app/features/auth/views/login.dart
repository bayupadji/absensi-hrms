import 'package:absensi/app/features/auth/controllers/app_controller.dart';
import 'package:absensi/app/features/auth/controllers/auth_controller.dart';
import 'package:absensi/app/utils/constants/assets.dart';
import 'package:absensi/app/utils/theme/colors.dart';
import 'package:absensi/app/utils/widgets/button/default_btn.dart';
import 'package:absensi/app/utils/widgets/button/icon_btn.dart';
import 'package:absensi/app/utils/widgets/textfields/text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Mengubah warna status bar untuk halaman ini
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.backgroundColor,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HelpCenter(),
                  CompanyLogo(),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: LoginForm(),
            ),
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

class LoginForm extends GetView<AuthController> {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.find();
    final AuthController authController = Get.find();

    return Container(
      padding: EdgeInsets.all(24.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundColor
        ),
        child: Column(
          children: [
            InputTextFields(
              label: 'Username',
              hint: 'Masukan email atau username',
              isPassword: false,
              controller: authController.usernameController, // Connect controller
            ),
            SizedBox(
              height: 16,
            ),
            InputTextFields(
              label: 'Password',
              hint: 'Masukan password',
              isPassword: true,
              controller: authController.passwordController, // Connect controller
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle forgot password logic
                  },
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
            Obx(() => SizedBox(
              width: double.infinity,
              child: DefaultButton(
                label: 'Masuk',
                onPressed: authController.isLoading.value ? null : () {
                  authController.login();
                },
                bgColor: AppColors.primaryColor,
                fgColor: AppColors.backgroundColor,
              ),
            )),
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
        ),
      ),
    );
  }
}
