import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:edge_to_edge_resolver/edge_to_edge_resolver_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelEdgeToEdgeResolver platform = MethodChannelEdgeToEdgeResolver();
  const MethodChannel channel = MethodChannel('edge_to_edge_resolver');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  // test('getPlatformVersion', () async {
  //   expect(await platform.getPlatformVersion(), '42');
  // });
}
