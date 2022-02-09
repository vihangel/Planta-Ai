import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:plantaai/modules/maps/maps_controller.dart';
import 'package:plantaai/shared/resources/colors.dart';
import 'package:plantaai/shared/resources/text_style.dart';

final controller = Modular.get<MapsController>();

class MapsPage extends StatelessWidget {
  final int index;

  const MapsPage({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getCurrentUserLocation();

    final size = MediaQuery.of(context).size;
    return Observer(builder: (context) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            iconTheme: const IconThemeData(color: ColorsApp.primary),
            backgroundColor: ColorsApp.white,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Modular.to.pop();
                },
                icon: const Icon(Icons.arrow_back)),
          ),
          backgroundColor: ColorsApp.white,
          body: Observer(builder: (
            context,
          ) {
            controller.addressMap;
            controller.getData();
            if (controller.initialcameraposition == const LatLng(0, 0)) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                SizedBox(
                  height: size.height / 3,
                  child: Observer(
                    builder: (context) {
                      controller.initialcameraposition!;

                      return GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: controller.initialcameraposition!,
                          zoom: 15,
                        ),
                        mapType: MapType.normal,
                        onTap: controller.selectPosition,
                        markers: (controller.pickedPosition == null) //&&

                            ? Set()
                            : {
                                Marker(
                                  markerId: const MarkerId('p1'),
                                  position: controller.pickedPosition ??
                                      controller.initialcameraposition!,
                                ),
                              },
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: size.height * 1.5 / 3,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(
                              10.0) //                 <--- border radius here
                          ),
                      color: ColorsApp.white,
                      boxShadow: [
                        BoxShadow(
                          color: ColorsApp.gray2.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset:
                              const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              child: CachedNetworkImage(
                                placeholder: (context, url) => Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const CircularProgressIndicator(),
                                  ],
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                imageUrl:
                                    controller.plants[index].src!.original,
                                fit: BoxFit.cover,
                              ),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                color: ColorsApp.white,
                              ),
                            ),
                            const Padding(padding: const EdgeInsets.all(5)),
                            Container(
                              width: size.width * 0.63,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.plants[index].photographer
                                        .toString(),
                                    style: TextStyles.title,
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    controller.plants[index].alt.toString(),
                                    style: TextStyles.titleCard,
                                    textAlign: TextAlign.left,
                                    softWrap: true,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Local de entraga",
                              style: TextStyles.title,
                              textAlign: TextAlign.left,
                              softWrap: true,
                            ),
                            Observer(builder: (context) {
                              return Text(
                                controller.addressMap,
                                style: TextStyles.titleCard,
                                textAlign: TextAlign.left,
                                softWrap: true,
                              );
                            }),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total",
                                  style: TextStyles.title,
                                  textAlign: TextAlign.left,
                                  softWrap: true,
                                ),
                                Text(
                                  "Produto: R\$20,00 \nEntrega: R\$5,00",
                                  style: TextStyles.titleCard,
                                  textAlign: TextAlign.left,
                                  softWrap: true,
                                ),
                                Text(
                                  "Pagamento: Pix",
                                  style: TextStyles.titleCard,
                                  textAlign: TextAlign.left,
                                  softWrap: true,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "R\$25,00",
                                  style: TextStyles.title,
                                  textAlign: TextAlign.right,
                                  softWrap: true,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          width: size.width,
                          //height: 30,
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: ColorsApp.primary,
                          ),
                          child: TextButton(
                            onPressed: () {
                              showCupertinoDialog(
                                context: context,
                                builder: (_) => CupertinoAlertDialog(
                                  title: Text("Deseja realizar a compra?",
                                      style: TextStyles.title),
                                  actions: [
                                    CupertinoButton(
                                        child: const Text(
                                          'Cancelar',
                                          style: TextStyle(
                                              color: ColorsApp.primary),
                                        ),
                                        onPressed: () {
                                          Modular.to.pop();
                                        }),
                                    CupertinoButton(
                                      child: const Text(
                                        'Comprar',
                                        style:
                                            TextStyle(color: ColorsApp.primary),
                                      ),
                                      onPressed: () {
                                        var snackBar = SnackBar(
                                          backgroundColor: ColorsApp.primary,
                                          duration: const Duration(seconds: 5),
                                          behavior: SnackBarBehavior.floating,
                                          elevation: 150.0,
                                          dismissDirection:
                                              DismissDirection.horizontal,
                                          content: Text(
                                              "Compra realizada com sucesso!",
                                              style: TextStyles.buttonBold),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);

                                        Modular.to.popAndPushNamed(
                                          "/home",
                                        );
                                      },
                                    )
                                  ],
                                ),
                              );
                              //controller.verify();
                            },
                            child: Text(
                              "Comprar",
                              style: TextStyles.buttonBold,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      );
    });
  }
}
