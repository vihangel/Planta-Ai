import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:planta_ai/modules/home/home_controller.dart';
import 'package:planta_ai/modules/product/product_page.dart';
import 'package:planta_ai/shared/resources/colors.dart';
import 'package:planta_ai/shared/resources/images.dart';
import 'package:planta_ai/shared/resources/text_style.dart';

final controller = Modular.get<HomeController>();

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static List<Widget> widget = <Widget>[
    ProductPage(),
    Text("a"),
    Text("a"),
  ];

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      final size = MediaQuery.of(context).size;
      controller.initialize();
      return Scaffold(
        backgroundColor: ColorsApp.white,
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: ColorsApp.primary),
          backgroundColor: ColorsApp.white,
          elevation: 1,
          title: SvgPicture.asset(
            ImagesApp.logo,
            color: ColorsApp.primary,
            height: 30,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_active_outlined)),
          ],
        ),
        body: Observer(builder: (context) {
          return widget.elementAt(controller.selectedIndex);
        }),
        drawer: Drawer(
          backgroundColor: ColorsApp.white,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(
                                100.0) //                 <--- border radius here
                            ),
                        color: ColorsApp.primary,
                      ),
                      //color: AppColors.stroke,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: controller.getImage(),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    Text(
                      'Oie, ',
                      style: TextStyles.regular,
                    ),
                    Text(
                      controller.name,
                      style: TextStyles.bold,
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.person,
                  color: ColorsApp.primary,
                ),
                title: Text(
                  'Perfil',
                  style: TextStyles.regular,
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.history,
                  color: ColorsApp.primary,
                ),
                title: Text(
                  'Meus produtos',
                  style: TextStyles.regular,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.settings,
                  color: ColorsApp.primary,
                ),
                title: Text(
                  'Configurações ',
                  style: TextStyles.regular,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.power_settings_new,
                  color: ColorsApp.primary,
                ),
                title: Text(
                  'Logout',
                  style: TextStyles.regular,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        floatingActionButton: Observer(
          builder: (context) {
            return Container(
              width: size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: ColorsApp.white,
                boxShadow: [
                  BoxShadow(
                    color: ColorsApp.gray2.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                unselectedFontSize: 10,
                selectedFontSize: 14,
                showUnselectedLabels: true,
                selectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.w600),
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        controller.selectedIndex == 0
                            ? Icons.home
                            : Icons.home_outlined,
                        size: 24,
                        color: controller.selectedIndex == 0
                            ? ColorsApp.primary
                            : ColorsApp.gray2,
                      ),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        controller.selectedIndex == 1
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        size: 24,
                        color: controller.selectedIndex == 1
                            ? ColorsApp.primary
                            : ColorsApp.gray2,
                      ),
                      label: 'Favoritos'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        controller.selectedIndex == 2
                            ? Icons.shopping_cart
                            : Icons.shopping_cart_outlined,
                        size: 24,
                        color: controller.selectedIndex == 2
                            ? ColorsApp.primary
                            : ColorsApp.gray2,
                      ),
                      label: 'Carrinho'),
                ],
                currentIndex: controller.selectedIndex,
                onTap: controller.onItemTapped,
                selectedItemColor: ColorsApp.primary,
              ),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    });
  }
}
