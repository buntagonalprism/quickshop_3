import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_token_service.g.dart';

@Riverpod(keepAlive: true)
UserTokenService userTokenService(Ref ref) {
  return UserTokenService(ref);
}

class UserTokenService {
  UserTokenService(this.ref);
  final Ref ref;

  Future<String?> getToken() async {
    final user = auth.FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.getIdToken();
    }
    return null;
  }
}
