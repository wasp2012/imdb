import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        bottomNavigationBar: CurvedBottomNavbarWidget(currentPage: 4),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListView(
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
                        activeColor: Color.fromARGB(255, 255, 252, 252),
                        activeTrackColor: Color.fromARGB(255, 0, 0, 0),
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
            ],
          ),
        ),
      ),
    );
  }
}
