import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/core/helper/constants.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:rahtk_mobile/features/main/profile/business_logic/profile_cubit.dart';
import 'package:rahtk_mobile/features/main/profile/presentation/widgets/profile_item_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(diInjector(),diInjector(),diInjector()),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          ProfileCubit cubit = BlocProvider.of(context);
          return Container(
            width: Get.width,
            color: RahtkColors.aliceBlue,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    color: RahtkColors.tealColor,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "profile".tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(AppRoutes.favorites);
                                },
                                child: SvgPicture.asset(
                                  "assets/images/favorite_ic.svg",
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(AppRoutes.cart);
                                },
                                child: SvgPicture.asset(
                                  "assets/images/cart_ic.svg",
                                  colorFilter: const ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  color: RahtkColors.tealColor,
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cubit.profileEntity?.name ?? "",
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          cubit.profileEntity?.phone ?? "",
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          cubit.profileEntity?.email ?? "",
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: 200,
                      color: RahtkColors.tealColor,
                    ),
                    Container(
                      width: Get.width - 60,
                      margin: const EdgeInsets.only(top: 50,left: 20,right: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          ProfileItemWidget(
                            onTap: () {},
                            title: "edit_profile".tr,
                          ),
                          ProfileItemWidget(
                            onTap: () {
                              var currentLocale = Get.locale;
                              if (currentLocale?.languageCode == "en") {
                                cubit.changeLanguage("ar");
                                Get.updateLocale(const Locale("ar"));
                              } else {
                                cubit.changeLanguage("en");
                                Get.updateLocale(const Locale("en"));
                              }
                            },
                            title: "language".tr,
                          ),
                          ProfileItemWidget(
                            onTap: () {},
                            title: "feedback".tr,
                          ),
                          ProfileItemWidget(
                            onTap: () {},
                            title: "refer_a_friend".tr,
                          ),
                          ProfileItemWidget(
                            onTap: () {
                              Navigator.of(context).pushNamed(AppRoutes.termsConditions);
                            },
                            title: "terms_and_conditions".tr,
                          ),
                          ProfileItemWidget(
                            dividerVisible: false,
                            onTap: () {
                              cubit.logout();
                              Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (Route<dynamic> route) => false);
                            },
                            title: "logout".tr,
                            textColor: RahtkColors.tealColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
