enum SystemSpacing {
  x0_25(value: 2),
  x0_5(value: 4),
  x1(value: 8),
  x1_5(value: 12),
  x2(value: 16),
  x3(value: 24),
  x4(value: 32),
  x5(value: 40),
  x6(value: 48),
  x8(value: 64),
  x9(value: 72),
  x12(value: 96);

  final double value;
  const SystemSpacing({required this.value});
}
