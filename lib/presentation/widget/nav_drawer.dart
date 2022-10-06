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
                margin: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Divider(),
                    Text(
                      'Youssef Wael',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Divider(),
                    Text(
                      'Watch List',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Favorite',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 14,
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
