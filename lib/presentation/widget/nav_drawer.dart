import 'package:flutter/material.dart';
import 'package:imdb_demo/shared/constants/strings.dart';

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
                      onPressed: null,
                      child: Text(
                        'Favorite',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 20),
                      ),
                    ),
                    TextButton(
                      onPressed: null,
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
                children: const [
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
