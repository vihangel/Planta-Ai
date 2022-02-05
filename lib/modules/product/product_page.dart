import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:plantaai/modules/maps/maps_page.dart';
import 'package:plantaai/modules/product/product_controller.dart';
import 'package:plantaai/shared/resources/colors.dart';
import 'package:plantaai/shared/resources/text_style.dart';

final controller = Modular.get<ProductController>();

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  _listView(Size size) {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text(
            "Categorias por cores",
            style: TextStyles.title,
            textAlign: TextAlign.left,
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 40, // constrain height
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 10),
                    child: SizedBox(
                      width: size.width * 0.3,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          color: ColorsApp.primary,
                        ),
                        child: TextButton(
                          onPressed: () {
                            controller.updatePlants("green plants");
                          },
                          child: Text(
                            "verde",
                            style: TextStyles.buttonBold,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        //color: AppColors.stroke,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      width: size.width * 0.3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.blue[600],
                        ),
                        child: TextButton(
                          onPressed: () {
                            controller.updatePlants("blue plants");
                          },
                          child: Text(
                            "azul",
                            style: TextStyles.buttonBold,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        //color: AppColors.stroke,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      width: size.width * 0.3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.orange[400],
                        ),
                        child: TextButton(
                          onPressed: () {
                            controller.updatePlants("orange plants");
                          },
                          child: Text(
                            "laranja",
                            style: TextStyles.buttonBold,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        //color: AppColors.stroke,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      width: size.width * 0.3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.red[400],
                        ),
                        child: TextButton(
                          onPressed: () {
                            controller.updatePlants("red plants");
                          },
                          child: Text(
                            "vermelho",
                            style: TextStyles.buttonBold,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        //color: AppColors.stroke,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      width: size.width * 0.3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.purple[400],
                        ),
                        child: TextButton(
                          onPressed: () {
                            controller.updatePlants("purple plants");
                          },
                          child: Text(
                            "roxo",
                            style: TextStyles.buttonBold,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        //color: AppColors.stroke,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text(
            "Todas as plantinhas",
            style: TextStyles.title,
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: GridView.count(
            physics: const BouncingScrollPhysics(),
            childAspectRatio: (0.5 * size.width / 280),
            crossAxisCount: 2,
            shrinkWrap: true,
            children: List.generate(controller.plants.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: ColorsApp.gray2.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset:
                            const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(
                            10.0) //                 <--- border radius here
                        ),
                    color: ColorsApp.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 100,
                        child: Container(
                          width: size.width,
                          child: CachedNetworkImage(
                            placeholder: (context, url) => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircularProgressIndicator(),
                              ],
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            imageUrl: controller.plants[index].src!.original,
                            fit: BoxFit.cover,
                          ),
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            color: ColorsApp.white,
                          ),
                        ),
                      ),
                      Text(
                        controller.plants[index].photographer.toString(),
                        style: TextStyles.titleCard,
                        textAlign: TextAlign.left,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "R\$20,00",
                            style: TextStyles.priceCard,
                          ),
                          Text(
                            "121 vendidos",
                            style: TextStyles.subCard,
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Modular.to.push(MaterialPageRoute(
                              builder: (context) => MapsPage(
                                    index: index,
                                  )));
                        },
                        child: Container(
                          width: 200,
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: ColorsApp.primary,
                          ),
                          child: Text(
                            "Comprar",
                            style: TextStyles.buttonBoldPrimarySmall,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text(
            "Parece que não encontramos mais nada por aqui",
            style: TextStyles.regular,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(padding: EdgeInsets.all(50)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    controller.loadPlants(context);
    return Observer(builder: (context) {
      controller.loader;
      if (controller.loader == "ready") {
        return _listView(size);
      } else if (controller.loader == "loading") {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Container(
          child: const Text("Não existe resultados para essa pesquisa"),
        );
      }
    });
  }
}
