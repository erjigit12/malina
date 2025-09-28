// ignore_for_file: deprecated_member_use

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:malina/src/core/core.dart';
import 'package:malina/src/features/features.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScreen(const [
      HomePage(),
      SizedBox(),
      SizedBox(),
      ProfilePage(),
      SizedBox(),
    ]);
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen(this.items, {super.key});
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<MainCubit>().state;

    return Scaffold(
      body: items[currentIndex],
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 50,
                  spreadRadius: 5,
                  offset: Offset(-10, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: BottomNavigationBar(
                backgroundColor: AppColors.white,
                selectedItemColor: AppColors.primary,
                unselectedItemColor: AppColors.grey,
                selectedLabelStyle: const TextStyle(height: 2),
                unselectedLabelStyle: const TextStyle(
                  height: 2,
                  color: AppColors.grey,
                ),
                showSelectedLabels: true,
                showUnselectedLabels: true,
                currentIndex: currentIndex,

                onTap: (index) async {
                  if (index == 4) {
                    showDialog(
                      context: context,
                      barrierColor: Colors.transparent,
                      builder: (_) => BasketMenuPopup(parentContext: context),
                    );
                    return;
                  }
                  if (index != 2) {
                    context.read<MainCubit>().change(index);
                  }
                },
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/icons/home.svg',
                      colorFilter: ColorFilter.mode(
                        currentIndex == 0 ? AppColors.primary : AppColors.grey,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Лента',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/icons/favorites.svg',
                      colorFilter: ColorFilter.mode(
                        currentIndex == 1 ? AppColors.primary : AppColors.grey,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Избранное',
                  ),
                  const BottomNavigationBarItem(icon: SizedBox.shrink(), label: ''),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/icons/profile.svg',
                      colorFilter: ColorFilter.mode(
                        currentIndex == 3 ? AppColors.primary : AppColors.grey,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Профиль',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/icons/basket.svg',
                      colorFilter: ColorFilter.mode(
                        currentIndex == 4 ? AppColors.primary : AppColors.grey,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Корзина',
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: GestureDetector(
                  onTap: () {
                    context.push(
                      AppRoutes.qrScanner,
                      extra: const QrScannerArgs(origin: QrScannerOrigin.home),
                    );
                  },
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        currentIndex == 0
                            ? 'assets/icons/qrcode.svg'
                            : 'assets/icons/qrcodeshare.svg',
                        width: 32,
                        height: 32,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
