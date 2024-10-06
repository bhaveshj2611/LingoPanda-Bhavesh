
import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseConfigService {
  final FirebaseRemoteConfig _remoteConfig;

  FirebaseConfigService(this._remoteConfig);

  static Future<FirebaseConfigService> init() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));
    await remoteConfig.setDefaults({
      'mask_email': false,
    });
    await remoteConfig.fetchAndActivate();
    return FirebaseConfigService(remoteConfig);
  }

  bool get shouldMaskEmail => _remoteConfig.getBool('mask_email');

  String maskEmail(String email) {
    if (!shouldMaskEmail) return email;

    final parts = email.split('@');
    if (parts.length != 2) return email;

    String username = parts[0];
    String domain = parts[1];

    if (username.length <= 3) return email;

    String maskedUsername =
        '${username.substring(0, 3)}${'*' * (username.length - 3)}';
    return '$maskedUsername@$domain';
  }
}
