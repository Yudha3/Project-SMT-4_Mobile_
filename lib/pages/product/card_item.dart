import 'package:flutter/material.dart';
import 'package:main/models/product.dart';
import 'package:main/pages/product/detail_product_page.dart';
import 'package:main/utils/colors.dart';
import 'package:main/widgets/small_text.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final int id;
  // final Function press;
  const ItemCard({
    Key? key,
    required this.product,
    required this.id,
    // required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailProductPage(
                    id: id,
                    // isFavorite: true,
                    stock: product.stok,
                    image: product.img,
                    price: 50000,
                    name: "Anjay",
                    description: id.toString() + " - Lorem ipsum")));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Hero(
              // padding: EdgeInsets.all(12),
              // For  demo we use fixed height  and width
              // Now we dont need them
              // height: 180,
              // width: 160,
              tag: "${product.id}",

              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(product.img), fit: BoxFit.cover),
                  color: gray,
                  borderRadius: BorderRadius.circular(12),
                  // child: Image.network(product.img),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 2,
              bottom: 3,
              top: 6,
            ),
            child: SmallText(
              // products is out demo list
              text: product.name,
              size: 15, weight: FontWeight.w400,
            ),
          ),
          SmallText(
            text: "Rp ${product.price}",
            size: 16,
            weight: FontWeight.w500,
          ),
          SizedBox(
            height: 4,
          )
        ],
      ),
    );
  }
}
