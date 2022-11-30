import 'package:flutter/material.dart';

import '../../shared/constants/strings.dart';
import '../../shared/offline_data.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 15,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 200,
                child: Image.network(
                    'https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png'),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(),
                    TextButton(
                      onPressed: null,
                      child: Text(
                        'Youssef Wael',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 20),
                      ),
                    ),
                    const Divider(),
                    TextButton(
                      onPressed: null,
                      child: Text(
                        'Watch List',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 20),
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, favoriteScreen),
                      child: Text(
                        'Favorite',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 20),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        if (await SharedPrefs.checkValue(sessionIdKey)) {
                          Navigator.pushNamed(context, profileScreen);
                        } else {
                          await returnToLogin(context);
                        }
                      },
                      child: Text(
                        'Profile',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            alignment: AlignmentDirectional.bottomStart,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  settingsScreen,
                );
              },
              child: Row(
                children: [
                  Text(
                    'Settings',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Icon(Icons.settings),
                  Divider(
                    color: Colors.grey,
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () async {
                        await returnToLogin(context);
                      },
                      child: Text(
                        'Log out',
                        style: Theme.of(context).textTheme.bodyText2,
                      )),
                ],
              ),
            ),
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
