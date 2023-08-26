import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'data_analyzer_platform_interface.dart';

/// An implementation of [DataAnalyzerPlatform] that uses method channels.
class MethodChannelDataAnalyzer extends DataAnalyzerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('data_analyzer');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
