import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/cubit/dark_mode_cubit.dart';
import 'package:lms_pptik/src/utils/app_routes.dart';

class LmsPPTIK extends StatelessWidget {
  const LmsPPTIK({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeCubit, bool>(
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: state ? ThemeMode.dark : ThemeMode.light,
          theme: FlexThemeData.light(
            appBarBackground: Colors.white,
            fontFamily: 'NotoSans',
            colors: const FlexSchemeColor(
              primary: Color(0xff00296b),
              primaryContainer: Color(0xffa0c2ed),
              secondary: Color(0xffd26900),
              secondaryContainer: Color(0xffffd270),
              tertiary: Color(0xff5c5c95),
              tertiaryContainer: Color(0xffc8dbf8),
              appBarColor: Color(0xffc8dcf8),
              error: null,
            ),
            surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
            blendLevel: 7,
            subThemesData: const FlexSubThemesData(
              filledButtonRadius: 10,
              blendOnLevel: 10,
              blendOnColors: false,
              useTextTheme: true,
            ),
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            // tabBarStyle: FlexTabBarStyle.forBackground,

            // To use the Playground font, add GoogleFonts package and uncomment
            // fontFamily: GoogleFonts.notoSans().fontFamily,
          ),
          darkTheme: FlexThemeData.dark(
            fontFamily: 'NotoSans',
            colors: const FlexSchemeColor(
              primary: Color(0xffb1cff5),
              primaryContainer: Color(0xff3873ba),
              secondary: Color(0xffffd270),
              secondaryContainer: Color(0xffd26900),
              tertiary: Color(0xffc9cbfc),
              tertiaryContainer: Color(0xff535393),
              appBarColor: Color(0xff00102b),
              error: null,
            ),
            surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
            blendLevel: 13,
            subThemesData: const FlexSubThemesData(
              blendOnLevel: 20,
              useTextTheme: true,
            ),
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            // To use the Playground font, add GoogleFonts package and uncomment
            // fontFamily: GoogleFonts.notoSans().fontFamily,
          ),
          // If you do not have a themeMode switch, uncomment this line
          // to let the device system mode control the theme mode:
          // themeMode: ThemeMode.system,

          routeInformationParser: AppRoutes.goRouter.routeInformationParser,
          routeInformationProvider: AppRoutes.goRouter.routeInformationProvider,
          routerDelegate: AppRoutes.goRouter.routerDelegate,
        );
      },
    );
  }
}
