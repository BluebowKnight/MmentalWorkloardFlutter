import 'package:flutter_test/flutter_test.dart';
import 'package:data_analyzer/data_analyzer.dart';
import 'package:data_analyzer/data_analyzer_platform_interface.dart';
import 'package:data_analyzer/data_analyzer_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDataAnalyzerPlatform
    with MockPlatformInterfaceMixin
    implements DataAnalyzerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DataAnalyzerPlatform initialPlatform = DataAnalyzerPlatform.instance;

  test('$MethodChannelDataAnalyzer is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDataAnalyzer>());
  });

  test('getPlatformVersion', () async {
    DataAnalyzer dataAnalyzerPlugin = DataAnalyzer();
    MockDataAnalyzerPlatform fakePlatform = MockDataAnalyzerPlatform();
    DataAnalyzerPlatform.instance = fakePlatform;

    expect(await dataAnalyzerPlugin.getPlatformVersion(), '42');
  });
}
