import 'package:flutter/material.dart';
import 'package:main/models/model_product.dart';
import 'package:main/models/product.dart';
import 'package:main/pages/product/detail_product_page.dart';
import 'package:main/utils/colors.dart';
import 'package:main/widgets/product_text.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int id;
  const ProductCard({Key? key, required this.product, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 350,
      // width: 285,
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailProductPage(
                        id: id,
                        // isFavorite: product.isFavorite,
                        // price: product.price,
                        // stock: product.stock,
                        // name: product.title,
                        // image: product.image,
                        // description:
                        //     id.toString() + " - " + product.description
                      )));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildImage(context),
            buildBodyText(context),
            // buildFooter(context),
          ],
        ),
      ),
    );
  }

  Stack buildImage(context) {
    return Stack(
      children: [
        Container(
          height: 160,
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(product.image), fit: BoxFit.cover),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
        ),
        // Positioned(
        //   top: 8,
        //   right: 16,
        //   child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        //     Icon(
        //       Icons.favorite_rounded,
        //       size: 25,
        //       color: product.isFavorite ? primaryColor : Colors.transparent,
        //     )
        //   ]),
        // )
      ],
    );
  }

  Container buildBodyText(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        color: white,
      ),
      padding: const EdgeInsets.only(left: 10, right: 9, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          SizedBox(
            // width: 150,
            // height: 35,
            child: ProductText(
              text: product.title,
              size: 13.5,
              weight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            // width: 150,
            // height: 35,
            child: ProductText(
              text: CurrencyFormat.convertToIdr(product.price),
              size: 15,
              color: primaryColor,
              weight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 6,
          )
        ],
      ),
    );
  }
}
