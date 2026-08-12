import 'package:codeme_project/features/bottomnavigationbar/view/bottomnavigationbar_screen.dart';
import 'package:codeme_project/features/homescreenpage/controller/homescreen_controller.dart';
import 'package:codeme_project/features/homescreenpage/view/home_screen.dart';
import 'package:codeme_project/features/homescreenpage/view/productdetailes_screen.dart';
import 'package:codeme_project/utils/colorutils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomescreenController>();

    // Get only favorite products
    final favoriteProducts = provider.ProductList.where(
      (product) => product.isfavorite == true,
    ).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),

      // ============================================================
      // APP BAR
      // ============================================================
      appBar: AppBar(
        backgroundColor: Colorutils.buttoncolor,
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BottomnavigationScreen()),
            );
          },

          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 20,
          ),
        ),

        centerTitle: true,

        title: const Text(
          "Favorites",
          style: TextStyle(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      // ============================================================
      // BODY
      // ============================================================
      body: favoriteProducts.isEmpty
          ? _emptyFavorite()
          : GridView.builder(
              padding: const EdgeInsets.all(16),

              physics: const BouncingScrollPhysics(),

              itemCount: favoriteProducts.length,

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),

              itemBuilder: (context, index) {
                final product = favoriteProducts[index];

                // Get original index from ProductList
                final originalIndex = provider.ProductList.indexOf(product);

                return InkWell(
                  borderRadius: BorderRadius.circular(20),

                  // ==================================================
                  // OPEN PRODUCT DETAILS
                  // ==================================================
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailesScreen(intex: originalIndex),
                      ),
                    );
                  },

                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.circular(20),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 15,
                          offset: const Offset(0, 7),
                        ),
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        // ==================================================
                        // IMAGE
                        // ==================================================
                        Expanded(
                          flex: 5,

                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),

                                child: Container(
                                  width: double.infinity,

                                  color: const Color(0xFFF8F8F8),

                                  padding: const EdgeInsets.all(10),

                                  child: Image.asset(
                                    product.image,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),

                              // ==================================================
                              // FAVORITE BUTTON
                              // ==================================================
                              Positioned(
                                top: 9,
                                right: 9,

                                child: InkWell(
                                  borderRadius: BorderRadius.circular(20),

                                  onTap: () {
                                    setState(() {
                                      provider
                                              .ProductList[originalIndex]
                                              .isfavorite =
                                          false;
                                    });
                                    // Remove from favorite
                                  },

                                  child: Container(
                                    height: 34,
                                    width: 34,

                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,

                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.08),
                                          blurRadius: 8,
                                        ),
                                      ],
                                    ),

                                    child: Icon(
                                      Icons.favorite_rounded,
                                      color: Colorutils.buttoncolor,
                                      size: 19,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // ==================================================
                        // PRODUCT DETAILS
                        // ==================================================
                        Expanded(
                          flex: 4,

                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(11, 9, 11, 9),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                // PRODUCT NAME
                                Text(
                                  product.name,

                                  maxLines: 1,

                                  overflow: TextOverflow.ellipsis,

                                  style: const TextStyle(
                                    color: Color(0xFF202020),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),

                                const SizedBox(height: 5),

                                // ==================================================
                                // RATING
                                // ==================================================
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star_rounded,
                                      color: Colors.orange,
                                      size: 15,
                                    ),

                                    const SizedBox(width: 3),

                                    const Text(
                                      "4.8",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 11,
                                      ),
                                    ),

                                    const SizedBox(width: 5),

                                    const Text(
                                      "• 20 min",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),

                                const Spacer(),

                                // ==================================================
                                // PRICE + ADD BUTTON
                                // ==================================================
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,

                                  children: [
                                    Text(
                                      "\$${product.price}",

                                      style: TextStyle(
                                        color: Colorutils.buttoncolor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),

                                    Container(
                                      height: 30,
                                      width: 30,

                                      decoration: BoxDecoration(
                                        color: Colorutils.buttoncolor,
                                        borderRadius: BorderRadius.circular(9),
                                      ),

                                      child: const Icon(
                                        Icons.add_rounded,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  // ================================================================
  Widget _emptyFavorite() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Container(
              height: 90,
              width: 90,

              decoration: BoxDecoration(
                color: Colorutils.buttoncolor.withOpacity(0.10),
                shape: BoxShape.circle,
              ),

              child: Icon(
                Icons.favorite_border_rounded,
                color: Colorutils.buttoncolor,
                size: 45,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "No Favorites Yet",
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Products you favorite will appear here.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
