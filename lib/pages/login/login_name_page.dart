import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/user_store.dart';
import '../../router.dart';

class LoginNamePage extends StatefulWidget {
  const LoginNamePage({super.key});

  @override
  State<LoginNamePage> createState() => _LoginNamePageState();
}

class _LoginNamePageState extends State<LoginNamePage> {
  final TextEditingController _nameController = TextEditingController();

  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Welcome to Quickshop!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'If you\'re planning to share shopping lists with friends or family, please enter your name.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      errorText: errorText,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Consumer(builder: (context, ref, _) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () => ref.read(routerProvider).go(Routes.postLogin),
                    child: const Text('Skip'),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      final userName = _nameController.text;
                      if (userName.isEmpty) {
                        setState(() {
                          errorText = 'Please enter your name';
                        });
                        return;
                      }
                      ref.read(userStoreProvider.notifier).setUserName(userName);
                      ref.read(routerProvider).go(Routes.postLogin);
                    },
                    child: const Text('Continue'),
                  )
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
