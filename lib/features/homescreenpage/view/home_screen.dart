import 'package:codeme_project/features/homescreenpage/controller/homescreen_controller.dart';
import 'package:codeme_project/features/homescreenpage/view/productdetailes_screen.dart';
import 'package:codeme_project/utils/colorutils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedcategory = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final provider2 = context.watch<HomescreenController>();
    final Provider1 = context.read<HomescreenController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),

      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },

        child: Stack(
          children: [
            // ============================================================
            // TOP PREMIUM BACKGROUND
            // ============================================================
            Container(
              height: height * 0.46,

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
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),

                child: Column(
                  children: [
                    // ======================================================
                    // HEADER
                    // ======================================================
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // LOCATION
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.white,
                                  size: 16,
                                ),

                                const SizedBox(width: 4),

                                Text(
                                  "Current Location",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.75),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                const SizedBox(width: 2),

                                const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Colors.white,
                                  size: 17,
                                ),
                              ],
                            ),

                            const SizedBox(height: 3),

                            const Text(
                              "Kozhikode",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),

                        // NOTIFICATION
                        Container(
                          height: 42,
                          width: 42,

                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.95),
                            borderRadius: BorderRadius.circular(14),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 12,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),

                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(
                                Icons.notifications_none_rounded,
                                color: Colorutils.buttoncolor,
                                size: 23,
                              ),

                              Positioned(
                                top: 9,
                                right: 10,

                                child: Container(
                                  height: 6,
                                  width: 6,

                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // ======================================================
                    // SEARCH BAR
                    // ======================================================
                    Container(
                      height: 50,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(17),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 15,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),

                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Search your favourite food",

                          hintStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 13,
                          ),

                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: Colorutils.buttoncolor,
                            size: 24,
                          ),

                          suffixIcon: Container(
                            margin: const EdgeInsets.all(7),

                            decoration: BoxDecoration(
                              color: Colorutils.buttoncolor,
                              borderRadius: BorderRadius.circular(11),
                            ),

                            child: const Icon(
                              Icons.tune_rounded,
                              color: Colors.white,
                              size: 19,
                            ),
                          ),

                          border: InputBorder.none,

                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // ======================================================
                    // CATEGORY TITLE
                    // ======================================================
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Categories",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        Text(
                          "See all",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.85),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 7),

                    // ======================================================
                    // CATEGORY LIST
                    // ======================================================
                    SizedBox(
                      height: 88,

                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,

                        itemCount: provider2.ProductList.length,

                        itemBuilder: (context, index) {
                          final isSelected = selectedcategory == index;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedcategory = index;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetailesScreen(intex: index),
                                ),
                              );
                            },

                            child: SizedBox(
                              width: 70,

                              child: Column(
                                children: [
                                  // ==========================================
                                  // CATEGORY IMAGE
                                  // ==========================================
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),

                                    height: 52,
                                    width: 52,

                                    padding: const EdgeInsets.all(7),

                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? const Color.fromARGB(
                                              255,
                                              247,
                                              247,
                                              247,
                                            )
                                          : const Color.fromARGB(
                                              255,
                                              223,
                                              218,
                                              218,
                                            ).withOpacity(0.16),

                                      shape: BoxShape.circle,

                                      border: Border.all(
                                        color: isSelected
                                            ? const Color.fromARGB(
                                                255,
                                                255,
                                                254,
                                                254,
                                              )
                                            : const Color.fromARGB(
                                                255,
                                                216,
                                                214,
                                                214,
                                              ).withOpacity(0.15),

                                        width: isSelected ? 1.5 : 1,
                                      ),

                                      boxShadow: isSelected
                                          ? [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                  0.10,
                                                ),
                                                blurRadius: 8,
                                                offset: const Offset(0, 3),
                                              ),
                                            ]
                                          : [],
                                    ),

                                    child: Image.asset(
                                      provider2.ProductList[index].image,
                                      fit: BoxFit.contain,
                                    ),
                                  ),

                                  const SizedBox(height: 5),

                                  // ==========================================
                                  // CATEGORY NAME
                                  // ==========================================
                                  Text(
                                    provider2.ProductList[index].name,

                                    maxLines: 1,

                                    overflow: TextOverflow.ellipsis,

                                    textAlign: TextAlign.center,

                                    style: TextStyle(
                                      color: Colors.white,

                                      fontSize: 10.5,

                                      fontWeight: isSelected
                                          ? FontWeight.w700
                                          : FontWeight.w500,
                                    ),
                                  ),

                                  const SizedBox(height: 3),

                                  // ==========================================
                                  // SELECTED INDICATOR
                                  // ==========================================
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),

                                    height: 2.5,

                                    width: isSelected ? 20 : 0,

                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        19,
                                        19,
                                        19,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // const SizedBox(height: 10),

                    // ======================================================
                    // POPULAR DISHES TITLE
                    // ======================================================
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Popular Dishes",
                          style: TextStyle(
                            color: Color.fromARGB(255, 252, 252, 252),
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        Text(
                          "View all",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 247, 247, 247),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),

                    // ======================================================
                    // PRODUCT GRID
                    // ======================================================
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.only(bottom: 20),

                        physics: const BouncingScrollPhysics(),

                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,

                              crossAxisSpacing: 12,

                              mainAxisSpacing: 12,

                              childAspectRatio: 0.70,
                            ),

                        itemCount: provider2.ProductList.length,

                        itemBuilder: (context, index) {
                          final product = provider2.ProductList[index];

                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetailesScreen(intex: index),
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
                                  // IMAGE SECTION
                                  // ==================================================
                                  Expanded(
                                    flex: 5,

                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              const BorderRadius.vertical(
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

                                        // FAVORITE BUTTON
                                        Positioned(
                                          top: 9,
                                          right: 9,

                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                provider2
                                                        .ProductList[index]
                                                        .isfavorite =
                                                    provider2
                                                        .ProductList[index]
                                                        .isfavorite = !provider2
                                                        .ProductList[index]
                                                        .isfavorite;
                                              });
                                            },
                                            child: Container(
                                              height: 32,
                                              width: 32,

                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,

                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.08),
                                                    blurRadius: 8,
                                                  ),
                                                ],
                                              ),

                                              child:
                                                  provider2
                                                          .ProductList[index]
                                                          .isfavorite ==
                                                      false
                                                  ? Icon(
                                                      Icons.favorite_border,
                                                      color:
                                                          const Color.fromARGB(
                                                            255,
                                                            20,
                                                            19,
                                                            19,
                                                          ),
                                                      size: 18,
                                                    )
                                                  : Icon(
                                                      Icons.favorite,
                                                      size: 18,
                                                      color: Colorutils
                                                          .buttoncolor,
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
                                      padding: const EdgeInsets.fromLTRB(
                                        11,
                                        9,
                                        11,
                                        9,
                                      ),

                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,

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

                                          const SizedBox(height: 4),

                                          // RATING + TIME
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
                                                  fontWeight: FontWeight.w500,
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

                                          // PRICE + QUANTITY
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,

                                            children: [
                                              // PRICE
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,

                                                children: [
                                                  const Text(
                                                    "PRICE",
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 8,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),

                                                  const SizedBox(height: 1),

                                                  Row(
                                                    children: [
                                                      Text(
                                                        "\$",
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      Text(
                                                        "${product.price}",

                                                        style: TextStyle(
                                                          color: Colorutils
                                                              .buttoncolor,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),

                                              // QUANTITY BUTTON
                                              Container(
                                                height: 35,

                                                decoration: BoxDecoration(
                                                  color: Colorutils.buttoncolor,

                                                  borderRadius:
                                                      BorderRadius.circular(9),
                                                ),

                                                child: Row(
                                                  children: [
                                                    // MINUS
                                                    SizedBox(
                                                      width: 30,

                                                      child: IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            Provider1.removeQuandity(
                                                              index,
                                                            );
                                                          });
                                                        },
                                                        icon: Icon(
                                                          Icons.remove_rounded,
                                                          color: Colors.white,
                                                          size: 15,
                                                        ),
                                                      ),
                                                    ),

                                                    // QUANTITY
                                                    Text(
                                                      product.quantity
                                                          .toString(),

                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),

                                                    // PLUS
                                                    SizedBox(
                                                      width: 30,

                                                      child: IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            Provider1.addQuandity(
                                                              index,
                                                            );
                                                          });
                                                        },
                                                        icon: Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                          size: 15,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
