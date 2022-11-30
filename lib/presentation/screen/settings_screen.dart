import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart' as riveImport;
import '../../shared/common/gradient.dart';

import '../../business_logic/theme_cubit/theme_cubit.dart';
import '../../business_logic/theme_cubit/theme_state.dart';
import '../../injection.dart';
import '../widget/curved_bottom_navbar_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final cubit;
  @override
  void initState() {
    super.initState();
    cubit = getIt<ThemeCubit>();
    cubit.settingUpTheArtBoard();
  }

  @override
  Widget build(BuildContext context) {
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
              margin: const EdgeInsets.only(top: 40),
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
                      BlocBuilder<ThemeCubit, SettingState>(
                        builder: (context, state) {
                          return Container(
                            color: Colors.transparent,
                            height: MediaQuery.of(context).size.height / 10,
                            width: MediaQuery.of(context).size.width / 5,
                            child: GestureDetector(
                              onTap: () {
                                if (cubit.savedTheme == true) {
                                  cubit.savedTheme = !(cubit.savedTheme!);
                                  cubit.switchToLight();
                                  cubit.toggleSwitch(false);
                                } else {
                                  cubit.savedTheme = !(cubit.savedTheme!);
                                  cubit.switchToDark();
                                  cubit.toggleSwitch(true);
                                }
                              },
                              child: cubit.riveArtBoard == null
                                  ? const SizedBox.shrink()
                                  : riveImport.Rive(
                                      artboard: cubit.riveArtBoard!),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
