import 'package:system_package/system.dart';

class SystemPermission {
  final String? name;
  final String? description;
  final Permission? service;

  bool? _greated;
  bool get greated => _greated ?? false;

  SystemPermission({
    this.name,
    this.description,
    this.service,
  });

  Future<void> check() async {
    _greated = (await service?.status)?.isGranted;
  }

  Future<void> request() async {
    if (!greated) {
      final result = await service?.request();
      _greated = result?.isGranted;
    }
  }
}
