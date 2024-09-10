import 'package:flutter/material.dart';
import 'package:system_design_package/system_design.dart';
import 'package:system_package/system.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SystemUser? user;

  bool showInput = false;

  @override
  void initState() {
    Future.microtask(() async {
      final userMap = await LocalData.readData(key: DataKey.user);

      user = SystemUser.fromJson(userMap ?? {});

      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
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
            child: GlassContainer(
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
                              await SecureLocalData.clearData(
                                  SecureDataKey.userName);
                              await SecureLocalData.clearData(
                                  SecureDataKey.password);
                              await SecureLocalData.clearData(
                                  SecureDataKey.token);
                              await LocalData.clearData(key: DataKey.user);

                              if (!context.mounted) return;

                              Navigator.pushReplacementNamed(
                                  context, SystemRoutes.wellcomePage);
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
                          imageUrl: user?.moodlePhoto,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: SystemSpacing.x2.value,
                          ),
                          child:
                              Text('Olá, ${user?.firstName ?? ''}!').heading2(
                            fontWeight: SystemFontWeight.semiBold,
                            color: SystemColors.white,
                          ),
                        ),
                        if (showInput)
                          Padding(
                            padding: EdgeInsets.only(
                              top: SystemSpacing.x2.value,
                              right: SystemSpacing.x2.value,
                              left: SystemSpacing.x2.value,
                            ),
                            child: SystemInput(
                              hint: '••••••••••',
                              enable: true,
                              autofocus: true,
                              fillColor: SystemColors.white,
                              //controller: controller.passwordCtrl,
                              isPassword: true,
                              textInputType: TextInputType.text,
                              onChanged: (value) {
                                //controller.setStatus(Status.success);
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
            ),
          ),
        ),
      ),
    );
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