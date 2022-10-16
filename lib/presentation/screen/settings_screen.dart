import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_demo/shared/constants/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../business_logic/theme_cubit/theme_cubit.dart';
import '../../business_logic/theme_cubit/theme_state.dart';
import '../../injection.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<ThemeCubitCubit>(context).updateAppTheme();
    final cubit = getIt<ThemeCubitCubit>();

    return BlocProvider.value(
      value: getIt<ThemeCubitCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          backgroundColor: Theme.of(context).accentColor,
        ),
        body: Container(
          color: Theme.of(context).backgroundColor,
          child: ListView(
            children: [
              Row(
                children: [
                  Text('Dark Mode'),
                  BlocBuilder<ThemeCubitCubit, SettingState>(
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
