import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_demo/business_logic/auth_cubit/authentication_cubit.dart';
import 'package:imdb_demo/presentation/widget/plasma.dart';
import 'package:imdb_demo/shared/data/models/authentication/req_token.dart';

class LogInScreen extends StatefulWidget {
  final RequestTokenModel requestTokenModel;

  LogInScreen({super.key, required this.requestTokenModel});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const PlasmaBackground(),
          Positioned(child: Image.asset('assets/images/popcorn.png')),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: context.read<LogInCubit>().userName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Username',
                ),
              ),
              TextField(
                controller: context.read<LogInCubit>().password,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Log In'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
