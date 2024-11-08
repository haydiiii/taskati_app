import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati_app/core/constants/assets_icons.dart';
import 'package:taskati_app/core/functions/routing.dart';
import 'package:taskati_app/core/services/local_storage.dart';
import 'package:taskati_app/core/utils/text_styles.dart';
import 'package:taskati_app/features/tasks_view/views/tasks_view.dart';
import 'package:taskati_app/features/upload/views/upload_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool isLogin = AppLocalStorage.getCahData('isLogin') ?? false;
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      pushWithReplacment(context, isLogin ? TasksView() : UploadView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AssetsIcons.logo

                // width: 200,
                // height: 200,
                ),
            Text(
              'Taskati',
              style: getTitleStyle(context),
            ),
            Gap(10),
            Text(
              "it's time to Get Organized",
              style: getBodyStyle(context),
            ),
          ],
        ),
      ),
    );
  }
}
