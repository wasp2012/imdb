import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    final cubit = getIt<ProfileCubit>();
    return FutureBuilder(
      future: getIt<ProfileCubit>().emitGetUserDetails(),
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Hi ${cubit.userDetails!.username!}'),
          ),
          bottomNavigationBar: CurvedBottomNavbarWidget(currentPage: 3),
          body: BlocBuilder<ProfileCubit, ProfileState>(
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
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 60.0,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  cubit.userDetails?.avatar?.tmdb?.avatarPath ==
                                          null
                                      ? personImage
                                      : imageDisplay +
                                          cubit.userDetails!.avatar!.tmdb!
                                              .avatarPath!),
                              radius: 50.0,
                            ),
                          ),
                          Positioned(
                            top: 90,
                            left: 80,
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(cubit.userDetails
                                                ?.avatar?.gravatar?.hash ==
                                            null
                                        ? ''
                                        : '$gravatar${cubit.userDetails?.avatar?.gravatar?.hash}')),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    cubit.userDetails?.username != null
                        ? Row(
                            children: [
                              const Text('Username: '),
                              Text(
                                cubit.userDetails!.username!,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          )
                        : const SizedBox(),
                    cubit.userDetails?.name != null &&
                            cubit.userDetails!.name != ''
                        ? Row(
                            children: [
                              const Text('Name: '),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                cubit.userDetails!.name!,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          )
                        : const SizedBox(),
                    cubit.userDetails?.includeAdult != null
                        ? Row(
                            children: [
                              const Text('Adult: '),
                              Text(
                                cubit.userDetails!.includeAdult! == true
                                    ? 'Yes'
                                    : 'No!',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ],
                );
              }
            },
          ),
        );
      },
    );
  }
}
