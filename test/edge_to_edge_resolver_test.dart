import 'package:flutter_test/flutter_test.dart';
// import 'package:edge_to_edge_resolver/edge_to_edge_resolver.dart';
import 'package:edge_to_edge_resolver/edge_to_edge_resolver_platform_interface.dart';
// import 'package:edge_to_edge_resolver/edge_to_edge_resolver_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockEdgeToEdgeResolverPlatform
    with MockPlatformInterfaceMixin
    implements EdgeToEdgeResolverPlatform {
      @override
      Future<void> setNavigationBarColor(int color, bool isDark) {
        throw UnimplementedError();
      }

  // @override
  // Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  // final EdgeToEdgeResolverPlatform initialPlatform = EdgeToEdgeResolverPlatform.instance;

  // test('$MethodChannelEdgeToEdgeResolver is the default instance', () {
  //   expect(initialPlatform, isInstanceOf<MethodChannelEdgeToEdgeResolver>());
  // });

  // test('getPlatformVersion', () async {
  //   EdgeToEdgeResolver edgeToEdgeResolverPlugin = EdgeToEdgeResolver();
  //   MockEdgeToEdgeResolverPlatform fakePlatform = MockEdgeToEdgeResolverPlatform();
  //   EdgeToEdgeResolverPlatform.instance = fakePlatform;

  //   expect(await edgeToEdgeResolverPlugin.getPlatformVersion(), '42');
  // });
}
