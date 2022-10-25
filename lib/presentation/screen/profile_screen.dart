import 'package:flutter/material.dart';
import 'package:imdb_demo/business_logic/profile_cubit/profile_cubit.dart';
import 'package:imdb_demo/injection.dart';
import 'package:imdb_demo/shared/constants/strings.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    getIt<ProfileCubit>().emitGetUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<ProfileCubit>();
    // print(cubit.userDetails!.avatar?.tmdb?.avatarPath);
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi ${cubit.userDetails!.username!}'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            alignment: Alignment.center,
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 60.0,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        cubit.userDetails?.avatar?.tmdb?.avatarPath == null
                            ? personImage
                            : imageDisplay +
                                cubit.userDetails!.avatar!.tmdb!.avatarPath!),
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
                          image: NetworkImage(cubit
                                      .userDetails?.avatar?.gravatar?.hash ==
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
                    Text('Username: '),
                    Text(
                      cubit.userDetails!.username!,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                )
              : SizedBox(),
          cubit.userDetails?.name != null && cubit.userDetails!.name != ''
              ? Row(
                  children: [
                    Text('Name: '),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      cubit.userDetails!.name!,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                )
              : SizedBox(),
          cubit.userDetails?.includeAdult != null
              ? Row(
                  children: [
                    Text('Adult: '),
                    Text(
                      cubit.userDetails!.includeAdult! == true ? 'Yes' : 'No!',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
