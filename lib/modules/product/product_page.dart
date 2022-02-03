import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:planta_ai/modules/product/product_controller.dart';
import 'package:planta_ai/shared/resources/colors.dart';
import 'package:planta_ai/shared/resources/text_style.dart';

final controller = Modular.get<ProductController>();

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    controller.initialize();
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        children: List.generate(controller.plants.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: ColorsApp.gray2.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(
                        10.0) //                 <--- border radius here
                    ),
                color: ColorsApp.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 80,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              controller.plants[index].src!.original),
                          fit: BoxFit.cover,
                          //opacity: 1,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(
                                10.0) //                 <--- border radius here
                            ),
                        color: ColorsApp.white,
                      ),
                      //color: AppColors.stroke,
                    ),
                  ),
                  Text(
                    controller.plants[index].photographer.toString(),
                    style: TextStyles.regular,
                  ),
                  TextButton(
                    onPressed: () {
                      //controller.verify();
                    },
                    child: Container(
                      width: size.width,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: ColorsApp.primary,
                      ),
                      child: Text(
                        "Comprar",
                        style: TextStyles.buttonBoldPrimary,
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
    );
  }
}
