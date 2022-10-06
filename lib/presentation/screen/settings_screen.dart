import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_demo/shared/constants/strings.dart';
import 'package:imdb_demo/shared/offline_data.dart';
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
          child: ListView(
            children: [
              Row(
                children: [
                  Text('Dark Mode'),
                  BlocBuilder<ThemeCubitCubit, SettingState>(
                    builder: (context, state) {
                      return Switch(
                        activeColor: Colors.black54,
                        value: cubit.isDark,
                        onChanged: (value) {
                          cubit.isDark = value;
                          cubit.toggleSwitch(value);
                          SharedPref.setBool(isDarkTheme, cubit.isDark);
                          print(cubit.isDark);
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
