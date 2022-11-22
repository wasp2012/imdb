import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared/common/gradient.dart';
import '../../shared/constants/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../business_logic/theme_cubit/theme_cubit.dart';
import '../../business_logic/theme_cubit/theme_state.dart';
import '../../injection.dart';
import '../widget/curved_bottom_navbar_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<ThemeCubitCubit>(context).updateAppTheme();
    final cubit = getIt<ThemeCubit>();

    return BlocProvider.value(
      value: getIt<ThemeCubit>(),
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: const CurvedBottomNavbarWidget(currentPage: 4),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: SharedGradient.gradientColors(context),
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Dark Mode',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                      ),
                      BlocBuilder<ThemeCubit, SettingStateTheme>(
                        builder: (context, state) {
                          return Switch(
                            activeColor:
                                const Color.fromARGB(255, 255, 252, 252),
                            activeTrackColor:
                                const Color.fromARGB(255, 0, 0, 0),
                            value: cubit.savedTheme ?? false,
                            onChanged: (value) async {
                              cubit.isDark = value;
                              cubit.toggleSwitch(value);
                              await cubit.getSavedTheme();
                              print(
                                  ' Setting Screen Saved Theme  ${cubit.savedTheme}');
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
