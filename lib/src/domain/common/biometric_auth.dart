import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:oxen_wallet/generated/l10n.dart';

class BiometricAuth {
  Future<bool> isAuthenticated() async {
    final _localAuth = LocalAuthentication();
    try {
      return await _localAuth.authenticate(
          localizedReason: S.current.biometric_auth_reason,
          biometricOnly: true,
          useErrorDialogs: true,
          stickyAuth: false);
    } on PlatformException catch (e) {
      print(e);
    }
    return false;
  }
}
