import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ifs_pass/pages/home/controller/home_controller.dart';
import 'package:system_package/system.dart';
import 'package:system_design_package/system_design.dart';

class CarteirinhaHomePage extends StatelessWidget {
  const CarteirinhaHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, controller, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: SystemColors.primary.value,
            title: const Text('Carteirinha').heading3(
              color: SystemColors.white.value,
            ),
            foregroundColor: SystemColors.white.value,
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: EdgeInsets.all(
                      SystemSpacing.x4.value,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: SystemColors.white.value,
                      border: Border.all(
                        color: SystemColors.neutral800.value,
                      )
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            height: 16,
                            width: constraints.maxHeight,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(5.0),
                                topLeft: Radius.circular(5.0),
                              ),
                              color: SystemColors.primary.value,
                            ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: SystemSpacing.x2.value,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Estudante:').body1(
                                    fontWeight: SystemFontWeight.medium,
                                  ),
                                  Text(controller.user?.fullname ?? '').body1(
                                    fontWeight: SystemFontWeight.regular,
                                  ),
                                  SizedBox(
                                    height: SystemSpacing.x1.value,
                                  ),
                                  const Text('Matrícula:').body1(
                                    fontWeight: SystemFontWeight.medium,
                                  ),
                                  Text(controller.user?.username ?? '').body1(
                                    fontWeight: SystemFontWeight.regular,
                                  ),
                                  SizedBox(
                                    height: SystemSpacing.x1.value,
                                  ),
                                  const Text('Email:').body1(
                                    fontWeight: SystemFontWeight.medium,
                                  ),
                                  Text(controller.user?.email ?? '').body1(
                                    fontWeight: SystemFontWeight.regular,
                                  ),
                                  SizedBox(
                                    height: SystemSpacing.x1.value,
                                  ),
                                  const Text('Validade:').body1(
                                    fontWeight: SystemFontWeight.medium,
                                  ),
                                  const Text('30/07/2025').body1(
                                    fontWeight: SystemFontWeight.regular,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: SystemSpacing.x4.value,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: CachedNetworkImage(
                                    imageUrl: controller.user?.moodlePhoto ?? '',
                                    width: 105,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Image.asset(
                                'assets/images/campus.png',
                                width: 223,
                                height: 137,
                          
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          )
        );
      },
    );
  }
}
