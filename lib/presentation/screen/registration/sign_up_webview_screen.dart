import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_demo/business_logic/auth_cubit/authentication_cubit.dart';
import 'package:imdb_demo/business_logic/auth_cubit/authentication_state.dart';
import 'package:imdb_demo/injection.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../widget/signup/navigation_controls_widget.dart';

class SignUpWebViewScreen extends StatefulWidget {
  const SignUpWebViewScreen({
    super.key,
  });

  @override
  State<SignUpWebViewScreen> createState() => _SignUpWebViewScreenState();
}

class _SignUpWebViewScreenState extends State<SignUpWebViewScreen> {
  final controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    var currentProgress = 0;
    var cubit = getIt<AuthenticationCubit>();
    return Scaffold(
      appBar: AppBar(title: Text('Sign up now'), actions: [
        NavigationControlsWidget(controller: controller),
      ]),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://www.themoviedb.org/signup',
            onWebViewCreated: (webViewController) {
              controller.complete(webViewController);
            },
            onPageStarted: (url) {
              cubit.emitPageStarted();
            },
            onProgress: (progress) {
              cubit.emitPageOnProgress(currentProgress);
            },
            onPageFinished: (url) {
              cubit.emitPageLoaded();
            },
            navigationDelegate: (navigation) {
              final host = Uri.parse(navigation.url).host;
              if (!host.contains('https://www.themoviedb.org/signup/')) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Blocking navigation to $host',
                    ),
                  ),
                );
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          
            javascriptMode: JavascriptMode.unrestricted,
            javascriptChannels: _createJavascriptChannels(context),
          ),
          if (cubit.loadingPercentage < 100)
            LinearProgressIndicator(
              value: cubit.loadingPercentage / 100.0,
            ),
        ],
      ),
    );
  }

  Set<JavascriptChannel> _createJavascriptChannels(BuildContext context) {
    return {
      JavascriptChannel(
        name: 'SnackBar',
        onMessageReceived: (message) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message.message)));
        },
      ),
    };
  }
}
