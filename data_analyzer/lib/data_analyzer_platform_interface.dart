import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'data_analyzer_method_channel.dart';

abstract class DataAnalyzerPlatform extends PlatformInterface {
  /// Constructs a DataAnalyzerPlatform.
  DataAnalyzerPlatform() : super(token: _token);

  static final Object _token = Object();

  static DataAnalyzerPlatform _instance = MethodChannelDataAnalyzer();

  /// The default instance of [DataAnalyzerPlatform] to use.
  ///
  /// Defaults to [MethodChannelDataAnalyzer].
  static DataAnalyzerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DataAnalyzerPlatform] when
  /// they register themselves.
  static set instance(DataAnalyzerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
