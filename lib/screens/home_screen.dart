import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shop_ui/models/product_models.dart';
import 'package:shop_ui/screens/details_product_screen.dart';
import 'package:shop_ui/screens/widget/custom_text.dart';

class HomeScreen extends StatelessWidget {
  List<ProductModels> listOfProduct = [
    ProductModels(
      id: "1",
      title: "Nike Shoes",
      des: 'This is Desc',
      image:
          'http://media.gq.com/photos/58c817b8ffec782281bdcdbb/16:9/pass/2017-03_gq_nikeshoe_3x2.jpg',
      price: "280 \$",
      size: "40",
    ),
    ProductModels(
      id: "2",
      title: "Puma shoes",
      des: 'This is Desc',
      image:
          'https://3.bp.blogspot.com/-8qyw_l7ItAg/UUf22cg6AtI/AAAAAAAACHg/9UWlPSzuyKY/s1600/Puma+Shoes+1.jpg',
      price: "180 \$",
      size: "42",
    ),
    ProductModels(
      id: "3",
      title: "Babolat shoes",
      des: 'This is Desc',
      image:
          'http://media.gq.com/photos/58c817b8ffec782281bdcdbb/16:9/pass/2017-03_gq_nikeshoe_3x2.jpg',
      price: "100 \$",
      size: "44",
    ),
    ProductModels(
      id: "4",
      title: "Rebook Shoes",
      des: 'This is Desc',
      image:
          'http://preview.turbosquid.com/Preview/2014/05/18__21_37_29/ShoesReebokQuestion_159.jpg07b9cd24-e1a8-4632-825e-bb6e5c28859dOriginal.jpg',
      price: "90 \$",
      size: "43",
    ),
  ];

  List<String> cat = [
    "All",
    "Golf",
    "Ball",
    "Sneakers",
    "Score",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        elevation: 0,
        title: CustomText(
          txt: "Shop",
          fontWeight: FontWeight.w800,
          fontSize: 18,
        ),
        actions: [
          Icon(
            Icons.add_alert_outlined,
            color: Colors.black,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.add_shopping_cart_sharp,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            width: double.infinity,
            height: 50,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => FadeInDownBig(
                  duration:
                      Duration(milliseconds: index == 0 ? 400 : 600 * index),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color: index == 0 ? Colors.grey.shade300 : Colors.white24,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: CustomText(
                        txt: cat[index],
                        color: index == 0 ? Colors.black : Colors.grey,
                        fontWeight:
                            index == 0 ? FontWeight.w800 : FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: cat.length,
              ),
            ),
          ),
          SizedBox(height: 25),
          Column(
            children: listOfProduct.map((e) {
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsProductScreen(product: e),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Hero(
                            tag: e.id,
                            child: Image.network(
                              e.image,
                              height: 300,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 20),
                          child: CustomText(
                            txt: e.title,
                            alignment: Alignment.bottomLeft,
                            fontWeight: FontWeight.w800,
                            fontSize: 22,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 45),
                          child: CustomText(
                            txt: e.price,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
