import 'dart:math';

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../analytics/analytics.dart';
import '../../router.dart';
import '../../services/firebase/options.dart';

/// When selecting to sign in with google, if the user already had an account with the same
/// email address and password, the password will be removed from their Firebase Authentication
/// account and google sign in will become their only available login mechanism.

enum LoginGreetingType {
  none,
  forInvite,
}

class LoginLandingPage extends ConsumerWidget {
  const LoginLandingPage({required this.greetingType, super.key});
  final LoginGreetingType greetingType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            BackgroundAnimation(constraints: constraints),
            SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 64),
                    Image.asset(
                      'assets/logo/logo.png',
                      height: 96,
                      width: 96,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Quickshop',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            color: Colors.orange,
                            fontFamily: 'RacingSansOne',
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Rocket through your shopping',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontFamily: 'RacingSansOne',
                              color: Colors.grey[500],
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    switch (greetingType) {
                      LoginGreetingType.none => const SizedBox(height: 24),
                      LoginGreetingType.forInvite => const Padding(
                          padding: EdgeInsets.fromLTRB(32, 0, 24, 32),
                          child: Text(
                            'It looks like someone has shared a Quickshop list with you. Please sign in or create an account to view it.',
                            textAlign: TextAlign.center,
                          ),
                        ),
                    },
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Consumer(builder: (context, ref, _) {
                        return ElevatedButton(
                          onPressed: () => ref.read(routerProvider).push(Routes.loginEmail),
                          style: ButtonStyle(
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            padding: WidgetStateProperty.all(
                              const EdgeInsets.symmetric(vertical: 11, horizontal: 11),
                            ),
                          ),
                          child: Stack(children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(Icons.email),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Continue with email',
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.grey[600],
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ]),
                        );
                      }),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: AuthStateListener<OAuthController>(
                        child: OAuthProviderButton(
                          provider: GoogleProvider(clientId: DefaultFirebaseOptions.googleSignInClientId),
                        ),
                        listener: (oldState, newState, ctrl) {
                          if (newState is SignedIn || newState is UserCreated) {
                            ref.read(analyticsProvider).logEvent(const AnalyticsEvent.loginGoogle());
                            ref.read(routerProvider).go(Routes.postLogin);
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 96),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BackgroundAnimation extends StatefulWidget {
  final BoxConstraints constraints;
  const BackgroundAnimation({required this.constraints, super.key});

  @override
  State<BackgroundAnimation> createState() => _BackgroundAnimationState();
}

class _BackgroundAnimationState extends State<BackgroundAnimation> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 4),
    vsync: this,
  );
  late Animation<Offset> _offsetAnimation;

  late _LogoAnimationPath animationPath;
  // In image-sizes moved per second
  final double animationSpeed = 3.5;
  final double imageSize = 64;

  @override
  void initState() {
    super.initState();
    _updatePath();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        setState(() => _updatePath());
      }
    });
  }

  void _updatePath() {
    animationPath = _LogoAnimationPath(
      imageSize: imageSize,
      constraints: widget.constraints,
    );

    _offsetAnimation = Tween<Offset>(
      begin: animationPath.start,
      end: animationPath.end,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
    _controller.duration = Duration(milliseconds: (1000 * animationPath.distance / animationSpeed).round());
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Transform.rotate(
          angle: animationPath.angle,
          child: Transform.flip(
            flipX: animationPath.flip,
            child: Image.asset(
              'assets/logo/logo_grey_small.png',
              height: imageSize,
              width: imageSize,
            ),
          ),
        ),
      ),
    );
  }
}

class _LogoAnimationPath {
  // Offset is specified relative to image size
  late final Offset start;
  late final Offset end;
  late final bool flip;
  late final double angle;
  late final double distance;

  _LogoAnimationPath({
    required double imageSize,
    required BoxConstraints constraints,
  }) {
    var rand = Random();
    var startYRel = rand.nextDouble() * 2 - 0.5;
    final endYRelRange = switch (startYRel) {
      < 0.1 => _Range(0.5, 1.5),
      < 0.9 => _Range(0.1, 0.1),
      _ => _Range(-0.5, 0.5),
    };
    var endYRel = rand.nextDouble() * endYRelRange.delta + endYRelRange.min;
    const leftX = -1.5;
    final rightXdp = constraints.maxWidth + 1.5 * imageSize;
    final rightX = rightXdp / imageSize;
    final startY = startYRel * constraints.maxHeight / imageSize;
    final endY = endYRel * constraints.maxHeight / imageSize;
    if (rand.nextBool()) {
      start = Offset(leftX, startY);
      end = Offset(rightX, endY);
      flip = false;
    } else {
      start = Offset(rightX, startY);
      end = Offset(leftX, endY);
      flip = true;
    }
    final dx = end.dx - start.dx;
    final dy = end.dy - start.dy;
    angle = (flip ? -1 : 1) * atan2(dy, dx.abs());
    distance = sqrt(dx * dx + dy * dy);
  }
}

class _Range {
  final double min;
  final double max;
  final double delta;
  _Range(this.min, this.max) : delta = max - min;
}
