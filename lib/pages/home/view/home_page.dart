import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ifs_pass/pages/home/controller/home_controller.dart';
import 'package:ifs_pass/pages/onboarding/controller/wellcome_controller.dart';
import 'package:system_design_package/system_design.dart';
import 'package:system_package/system.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showInput = false;

  @override
  void initState() {
    Future.microtask(() async {
      final homeController = context.read<HomeController>();

      await homeController.init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeController, WellcomeController>(builder: (
      context,
      homeController,
      wellcomeController,
      child,
    ) {
      return Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            setState(() {
              showInput = !showInput;
            });
          },
          child: SingleChildScrollView(
            child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      SystemImages.background,
                    ),
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
                child: homeController.isBlocked
                    ? GlassContainer(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height,
                        child: SafeArea(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: SystemSpacing.x2.value,
                                      right: SystemSpacing.x2.value,
                                    ),
                                    child: SystemIconButton(
                                      onTap: () async {
                                        await homeController.logout();

                                        if (!context.mounted) return;

                                        Navigator.pushReplacementNamed(
                                          context,
                                          SystemRoutes.wellcomePage,
                                        );
                                      },
                                      icon: SystemIcons.logout_box_line,
                                      color: SystemColors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  SystemAvatar(
                                    size: SystemSize.extraLarge,
                                    imageUrl: homeController.user?.moodlePhoto,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: SystemSpacing.x2.value,
                                    ),
                                    child: Text(
                                      'Olá, ${homeController.user?.firstName ?? ''}!',
                                    ).heading2(
                                      fontWeight: SystemFontWeight.semiBold,
                                      color: SystemColors.white,
                                    ),
                                  ),
                                  if (showInput ||
                                      wellcomeController.isloading ||
                                      wellcomeController
                                          .passwordCtrl.text.isNotEmpty)
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: SystemSpacing.x2.value,
                                        right: SystemSpacing.x2.value,
                                        left: SystemSpacing.x2.value,
                                      ),
                                      child: wellcomeController.isloading
                                          ? CircularProgressIndicator(
                                              color: SystemColors.white.value,
                                              strokeCap: StrokeCap.round,
                                              strokeWidth: 3,
                                            )
                                          : SystemInput(
                                              hint: '••••••••••',
                                              enable: true,
                                              autofocus: true,
                                              fillColor: SystemColors.white,
                                              controller: wellcomeController
                                                  .passwordCtrl,
                                              isPassword: true,
                                              textInputType: TextInputType.text,
                                              onChanged: (value) {
                                                wellcomeController
                                                    .setStatus(Status.success);
                                              },
                                              onSubmitted: (value) async {
                                                wellcomeController.userNameCtrl
                                                    .text = (await SecureLocalData
                                                        .readData(SecureDataKey
                                                            .userName)) ??
                                                    '';

                                                final result =
                                                    await wellcomeController
                                                        .login();

                                                if (!context.mounted) return;

                                                if (result.status) {
                                                  homeController
                                                      .changeBlocked();
                                                } else {
                                                  PopUp.showError(
                                                    context,
                                                    result.title ?? '',
                                                    message: result.message,
                                                  );
                                                }
                                              },
                                            ),
                                    ),
                                  SizedBox(
                                    height: SystemSpacing.x9.value,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: SystemSpacing.x2.value,
                                        right: SystemSpacing.x2.value,
                                        bottom: SystemSpacing.x5.value),
                                    child: const Text(
                                      'Toque para desbloquear.',
                                    ).body2(
                                      color: SystemColors.white,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    : SafeArea(
                        child: Padding(
                          padding: EdgeInsets.all(
                            SystemSpacing.x2.value,
                          ),
                          child: Column(
                            children: [
                              GlassContainer(
                                radius: 5,
                                padding: EdgeInsets.symmetric(
                                  horizontal: SystemSpacing.x2.value,
                                  vertical: SystemSpacing.x2.value,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SystemAvatar(
                                      size: SystemSize.medium,
                                      imageUrl:
                                          homeController.user?.moodlePhoto,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: SystemSpacing.x2.value,
                                        right: SystemSpacing.x2.value,
                                      ),
                                      child: Text(
                                        'Bem vindo ${homeController.user?.firstName ?? ''}!',
                                      ).heading4(
                                        fontWeight: SystemFontWeight.regular,
                                        color: SystemColors.white,
                                      ),
                                    ),
                                    SystemIconButton(
                                      onTap: () async {
                                        await homeController.changeBlocked();
                                      },
                                      icon: SystemIcons.lock_unlock_fill,
                                      color: SystemColors.white,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width,
                                  padding: EdgeInsets.only(
                                    top: SystemSpacing.x2.value,
                                  ),
                                  child: SingleChildScrollView(
                                    child: Wrap(
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      runSpacing: SystemSpacing.x2.value,
                                      spacing: SystemSpacing.x2.value,
                                      children: [
                                        for (int j = 0; j < 10; j++)
                                          for (int i = 0;
                                              i < homeController.apps.length;
                                              i++)
                                            SystemApp(
                                              app: homeController.apps[i],
                                            )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
          ),
        ),
      );
    });
  }
}


// Stack(
//           alignment: Alignment.center,
//           children: [
//             Image.asset(
//               SystemImages.background,
//               width: MediaQuery.sizeOf(context).width,
//               height: MediaQuery.sizeOf(context).height,
//               fit: BoxFit.cover,
//             ),
//             GlassContainer(
//               width: MediaQuery.sizeOf(context).width,
//               height: MediaQuery.sizeOf(context).height,
//               child: SafeArea(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.only(
//                             top: SystemSpacing.x2.value,
//                             right: SystemSpacing.x2.value,
//                           ),
//                           child: SystemIconButton(
//                             onTap: () async {
//                               await SecureLocalData.clearData(SecureDataKey.userName);
//                               await SecureLocalData.clearData(SecureDataKey.password);
//                               await SecureLocalData.clearData(SecureDataKey.token);
//                               await LocalData.clearData(key: DataKey.user);
        
//                               if(!context.mounted) return;
        
//                               Navigator.pushReplacementNamed(context, SystemRoutes.wellcomePage);
        
//                             }, 
//                             icon: SystemIcons.logout_box_line,
//                             color: SystemColors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         SystemAvatar(
//                           size: SystemSize.extraLarge,
//                           imageUrl: user?.moodlePhoto,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                             top: SystemSpacing.x2.value,
//                           ),
//                           child: Text('Olá, ${user?.firstName ?? ''}!').heading2(
//                             fontWeight: SystemFontWeight.semiBold,
//                             color: SystemColors.white,
//                           ),
//                         ),
//                         if(showInput)
//                           Padding(
//                             padding: EdgeInsets.only(
//                               top: SystemSpacing.x2.value,
//                               right: SystemSpacing.x2.value,
//                               left: SystemSpacing.x2.value,
//                             ),
//                             child: SystemInput(
//                               hint: '••••••••••',
//                               enable: true,
//                               autofocus: true,
//                               fillColor: SystemColors.white,
//                               //controller: controller.passwordCtrl,
//                               isPassword: true,
//                               textInputType: TextInputType.text,
//                               onChanged: (value) {
//                                 //controller.setStatus(Status.success);
//                               },
//                             ),
//                           ),
//                         SizedBox(
//                           height: SystemSpacing.x9.value,
//                         )
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.only(
//                             left: SystemSpacing.x2.value,
//                             right: SystemSpacing.x2.value,
//                             bottom: SystemSpacing.x5.value
//                           ),
//                           child: const Text(
//                             'Toque para desbloquear.',
//                           ).body2(
//                             color: SystemColors.white,
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               )
//             )
//           ],
//         ),