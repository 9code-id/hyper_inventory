import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';
import 'package:hyper_ui/module/web/web_main_navigation/service/web_main_navigation_service.dart';

class AppLogo extends StatelessWidget {
  final Color? color;
  const AppLogo({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async {
        showLoading();
        await UserProfileService().deleteAll();
        hideLoading();
        ss("Delete all data success!");
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Transform.scale(
          scale: 0.8,
          child: Image.network(
            WebMainNavigationService.appLogo,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
