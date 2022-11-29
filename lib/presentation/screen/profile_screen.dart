import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb_demo/shared/common/gradient.dart';
import 'package:imdb_demo/shared/offline_data.dart';
import '../../business_logic/profile_cubit/profile_cubit.dart';
import '../../business_logic/profile_cubit/profile_state.dart';
import '../../injection.dart';
import '../../shared/constants/strings.dart';
import '../widget/curved_bottom_navbar_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final double coverHeight = 280;
    final double profileHeight = 160;
    final double top = coverHeight - profileHeight / 2;

    final cubit = getIt<ProfileCubit>();
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedBottomNavbarWidget(currentPage: 3),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: SharedGradient.gradientColors(context),
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FutureBuilder(
          future: getIt.allReady(),
          builder: (context, snapshot) {
            return BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileStateLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ProfileStateError) {
                  return const Center(
                    child: Text('Somethin went wrong'),
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: [
                            Container(
                              color: Colors.grey,
                              child: Image.network(
                                cubit.userDetails?.avatar?.tmdb?.avatarPath ==
                                        null
                                    ? personImage
                                    : imageDisplay +
                                        cubit.userDetails!.avatar!.tmdb!
                                            .avatarPath!,
                                width: double.infinity,
                                height: coverHeight.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: top,
                              child: CircleAvatar(
                                radius: profileHeight / 2,
                                backgroundColor: Colors.grey.shade800,
                                backgroundImage: NetworkImage(cubit.userDetails
                                            ?.avatar?.tmdb?.avatarPath ==
                                        null
                                    ? personImage
                                    : imageDisplay +
                                        cubit.userDetails!.avatar!.tmdb!
                                            .avatarPath!),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      cubit.userDetails?.username != null ||
                              cubit.userDetails?.username != ''
                          ? buildUserInfo(context, 'Username: ',
                              cubit.userDetails!.username!)
                          : const SizedBox(),
                      cubit.userDetails?.name != null &&
                              cubit.userDetails!.name != ''
                          ? buildUserInfo(
                              context, 'name: ', cubit.userDetails!.name!)
                          : const SizedBox(),
                      cubit.userDetails?.includeAdult != null
                          ? buildUserInfo(
                              context,
                              'Adult: ',
                              cubit.userDetails?.includeAdult == true
                                  ? '+18 content'
                                  : 'Child')
                          : const SizedBox(),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          onPressed: () async {
                            await returnToLogin(context);
                          },
                          child: Text(
                            'Log out',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp),
                          ),
                        ),
                      )
                    ],
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildUserInfo(BuildContext context, String title, String content) {
    return Container(
      margin: EdgeInsets.only(left: 8),
      child: Row(
        children: [
          Text(title, style: Theme.of(context).textTheme.subtitle1),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }

  Future<void> returnToLogin(BuildContext context) async {
    await SharedPrefs.logOut();
    Navigator.pushReplacementNamed(context, logInScreen);
  }
}
