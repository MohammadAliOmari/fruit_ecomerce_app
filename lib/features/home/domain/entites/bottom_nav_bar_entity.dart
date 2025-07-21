import 'package:fruite_app/core/utils/app_images.dart';

class BottomNavBarEntity {
  final String title;
  final String activeIcon;
  final String inactiveIcon;
  BottomNavBarEntity(
      {required this.title,
      required this.activeIcon,
      required this.inactiveIcon});
}

List<BottomNavBarEntity> get bottomNavBarItems => [
      BottomNavBarEntity(
        title: 'الرئيسية',
        activeIcon: Assets.assetsImagesHomeFill,
        inactiveIcon: Assets.assetsImagesHomeOutline,
      ),
      BottomNavBarEntity(
        title: 'المنتجات',
        activeIcon: Assets.assetsImagesProductsFill,
        inactiveIcon: Assets.assetsImagesProductsOutline,
      ),
      BottomNavBarEntity(
        title: 'سلة التسوق',
        activeIcon: Assets.assetsImagesShoppingCartFill,
        inactiveIcon: Assets.assetsImagesShoppingCartOutline,
      ),
      BottomNavBarEntity(
        title: 'حسابي',
        activeIcon: Assets.assetsImagesUserFill,
        inactiveIcon: Assets.assetsImagesUserOutline,
      ),
    ];
