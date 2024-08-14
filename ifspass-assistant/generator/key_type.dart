enum KeyType {
  appName(value: '{app_name}'),
  appId(value: '{app_id}'),
  imports(value: '{imports}'),
  instances(value: '{instances}');

  final String value;

  const KeyType({required this.value});
}
