import 'package:codeme_project/features/cartpage/view/cart_screen.dart';
import 'package:codeme_project/features/homescreenpage/controller/homescreen_controller.dart';
import 'package:codeme_project/utils/colorutils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailesScreen extends StatefulWidget {
  final int intex;
  const ProductDetailesScreen({super.key, required this.intex});

  @override
  State<ProductDetailesScreen> createState() => _ProductDetailesScreenState();
}

class _ProductDetailesScreenState extends State<ProductDetailesScreen> {
  // ============================================================
  // TEMPORARY PRODUCT DATA
  // Later you can pass this from HomeScreen
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final provider1 = context.read<HomescreenController>();
    final provider2 = context.watch<HomescreenController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),

      body: Stack(
        children: [
          // ============================================================
          // TOP IMAGE BACKGROUND
          // ============================================================
          Container(
            height: height * 0.48,

            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: Colorutils.primecolor,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
          ),

          // ============================================================
          // MAIN CONTENT
          // ============================================================
          SafeArea(
            child: Column(
              children: [
                // ======================================================
                // APP BAR
                // ======================================================
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // BACK BUTTON
                      _circleButton(
                        icon: Icons.arrow_back_ios_new_rounded,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),

                      const Text(
                        "Product Details",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      // FAVORITE
                      _circleButton(
                        icon: provider2.ProductList[widget.intex].isfavorite
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,

                        iconColor:
                            provider2.ProductList[widget.intex].isfavorite
                            ? Colors.red
                            : Colorutils.buttoncolor,

                        onTap: () {
                          setState(() {
                            provider2.ProductList[widget.intex].isfavorite =
                                provider2.ProductList[widget.intex].isfavorite =
                                    !provider2
                                        .ProductList[widget.intex]
                                        .isfavorite;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                // ======================================================
                // PRODUCT IMAGE
                // ======================================================
                SizedBox(
                  height: height * 0.30,

                  child: Center(
                    child: Hero(
                      tag: provider2.ProductList[widget.intex].name,

                      child: Container(
                        height: width * 0.65,
                        width: width * 0.65,

                        padding: const EdgeInsets.all(20),

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white.withOpacity(0.18),
                            width: 1,
                          ),
                        ),

                        child: Image.asset(
                          provider2.ProductList[widget.intex].image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),

                // ======================================================
                // DETAILS CARD
                // ======================================================
                Expanded(
                  child: Container(
                    width: double.infinity,

                    padding: const EdgeInsets.fromLTRB(20, 24, 20, 15),

                    decoration: const BoxDecoration(
                      color: Color(0xFFF7F7F7),

                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        // ==================================================
                        // NAME + PRICE
                        // ==================================================
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Expanded(
                              child: Text(
                                provider2.ProductList[widget.intex].name,

                                style: const TextStyle(
                                  color: Color(0xFF202020),
                                  fontSize: 23,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),

                            const SizedBox(width: 10),
                          ],
                        ),

                        const SizedBox(height: 9),

                        // ==================================================
                        // RATING + DELIVERY
                        // ==================================================
                        Row(
                          children: [
                            // RATING
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 5,
                              ),

                              decoration: BoxDecoration(
                                color: Colors.orange.withOpacity(0.10),
                                borderRadius: BorderRadius.circular(8),
                              ),

                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.star_rounded,
                                    color: Colors.orange,
                                    size: 16,
                                  ),

                                  SizedBox(width: 3),

                                  Text(
                                    "4.8",
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(width: 10),

                            // REVIEWS
                            const Text(
                              "120 Reviews",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),

                            const SizedBox(width: 10),

                            Container(
                              height: 4,
                              width: 4,

                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                              ),
                            ),

                            const SizedBox(width: 10),

                            // DELIVERY
                            const Icon(
                              Icons.access_time_rounded,
                              color: Colors.grey,
                              size: 15,
                            ),

                            const SizedBox(width: 3),

                            const Text(
                              "20 min",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // ==================================================
                        // DESCRIPTION TITLE
                        // ==================================================
                        const Text(
                          "About this food",

                          style: TextStyle(
                            color: Color(0xFF222222),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        // ==================================================
                        // DESCRIPTION
                        // ==================================================
                        Text(
                          provider2.ProductList[widget.intex].description,

                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,

                          style: const TextStyle(
                            color: Color.fromARGB(255, 69, 68, 68),
                            height: 1.5,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 18),

                        // ==================================================
                        // CUSTOMIZATION
                        // ==================================================
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            const Text(
                              "Quantity",

                              style: TextStyle(
                                color: Color(0xFF222222),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            // QUANTITY CONTROL
                            Container(
                              height: 40,

                              decoration: BoxDecoration(
                                color: Colorutils.buttoncolor,
                                borderRadius: BorderRadius.circular(12),
                              ),

                              child: Row(
                                children: [
                                  // MINUS
                                  InkWell(
                                    borderRadius: BorderRadius.circular(12),

                                    onTap: () {
                                      setState(() {
                                        provider2.removeQuandity(widget.intex);
                                      });
                                    },

                                    child: const SizedBox(
                                      width: 38,

                                      child: Icon(
                                        Icons.remove_rounded,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                  ),

                                  // NUMBER
                                  Container(
                                    constraints: const BoxConstraints(
                                      minWidth: 28,
                                    ),

                                    alignment: Alignment.center,

                                    child: Text(
                                      provider2
                                          .ProductList[widget.intex]
                                          .quantity
                                          .toString(),

                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),

                                  // PLUS
                                  InkWell(
                                    borderRadius: BorderRadius.circular(12),

                                    onTap: () {
                                      setState(() {
                                        provider2.addQuandity(widget.intex);
                                      });
                                    },

                                    child: const SizedBox(
                                      width: 38,

                                      child: Icon(
                                        Icons.add_rounded,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const Spacer(),

                        // ==================================================
                        // ADD TO CART
                        // ==================================================
                        Container(
                          height: 58,

                          width: double.infinity,

                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: Colorutils.primecolor,
                            ),

                            borderRadius: BorderRadius.circular(17),

                            boxShadow: [
                              BoxShadow(
                                color: Colorutils.buttoncolor.withOpacity(0.25),
                                blurRadius: 15,
                                offset: const Offset(0, 7),
                              ),
                            ],
                          ),

                          child: Material(
                            color: Colors.transparent,

                            child: InkWell(
                              borderRadius: BorderRadius.circular(17),

                              onTap: () {
                                provider2.addQuandity(widget.intex);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CartScreen(),
                                  ),
                                );
                              },

                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                ),

                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,

                                  children: [
                                    // CART ICON
                                    Container(
                                      height: 38,
                                      width: 38,

                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.15),
                                        borderRadius: BorderRadius.circular(11),
                                      ),

                                      child: const Icon(
                                        Icons.shopping_bag_outlined,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),

                                    const Text(
                                      "Add to Cart",

                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),

                                    Text(
                                      provider2.ProductList[widget.intex].price
                                          .toString(),

                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // CIRCLE BUTTON
  // ============================================================

  Widget _circleButton({
    required IconData icon,
    required VoidCallback onTap,
    Color iconColor = Colors.black,
  }) {
    return InkWell(
      onTap: onTap,

      borderRadius: BorderRadius.circular(14),

      child: Container(
        height: 42,
        width: 42,

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(14),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Icon(icon, color: iconColor, size: 19),
      ),
    );
  }
}
