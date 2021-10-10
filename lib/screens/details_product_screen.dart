import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shop_ui/models/product_models.dart';
import 'package:shop_ui/screens/widget/custom_text.dart';

class DetailsProductScreen extends StatelessWidget {
  ProductModels product;
  List<String> size = [
    "40",
    "41",
    "42",
    "43",
    "44",
  ];

  DetailsProductScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: product.id,
          child: Image.network(
            product.image,
            fit: BoxFit.cover,
            height: double.infinity,
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Stack(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black,
                    Colors.transparent,
                  ],
                )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FadeInDownBig(
                      duration: Duration(milliseconds: 500),
                      child: CustomText(
                        txt: product.title,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 10),
                    FadeInDownBig(
                      duration: Duration(milliseconds: 900),
                      child: Row(
                        children: size.map((e) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: e == product.size
                                  ? Colors.white
                                  : Colors.black26,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: CustomText(
                              txt: e,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 50),
                    FadeInLeftBig(
                      duration: Duration(seconds: 1),
                      child: Center(
                        child: SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: CustomText(
                              txt: "Buy now",
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
