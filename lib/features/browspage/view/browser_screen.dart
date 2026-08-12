import 'package:codeme_project/features/homescreenpage/controller/homescreen_controller.dart';
import 'package:codeme_project/utils/colorutils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrowserScreen extends StatefulWidget {
  const BrowserScreen({super.key});

  @override
  State<BrowserScreen> createState() => _BrowserScreenState();
}

class _BrowserScreenState extends State<BrowserScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomescreenController>();

    // Products that are actually ordered
    final orderedProducts = provider.ProductList.where(
      (product) => product.quantity > 0,
    ).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),

      body: SafeArea(
        child: Column(
          children: [
            // ============================================================
            // HEADER
            // ============================================================
            Container(
              padding: const EdgeInsets.fromLTRB(18, 15, 18, 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: Colorutils.primecolor,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),

              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },

                    borderRadius: BorderRadius.circular(14),

                    child: Container(
                      height: 42,
                      width: 42,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),

                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 18,
                      ),
                    ),
                  ),

                  const Expanded(
                    child: Center(
                      child: Text(
                        "My Orders",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 42),
                ],
              ),
            ),

            // ============================================================
            // CONTENT
            // ============================================================
            Expanded(
              child: orderedProducts.isEmpty
                  ? _emptyOrder()
                  : ListView(
                      padding: const EdgeInsets.all(18),

                      physics: const BouncingScrollPhysics(),

                      children: [
                        // ==================================================
                        // SUCCESS MESSAGE
                        // ==================================================
                        Container(
                          padding: const EdgeInsets.all(18),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 15,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),

                          child: Row(
                            children: [
                              Container(
                                height: 48,
                                width: 48,

                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.10),
                                  shape: BoxShape.circle,
                                ),

                                child: const Icon(
                                  Icons.check_rounded,
                                  color: Colors.green,
                                  size: 28,
                                ),
                              ),

                              const SizedBox(width: 13),

                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text(
                                      "Order Confirmed!",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),

                                    SizedBox(height: 4),

                                    Text(
                                      "Your order has been placed successfully.",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        // ==================================================
                        // ORDER DETAILS
                        // ==================================================
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            const Text(
                              "Order Details",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),

                            Text(
                              "#ORD${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}",
                              style: TextStyle(
                                color: Colorutils.buttoncolor,
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        // ==================================================
                        // PRODUCTS
                        // ==================================================
                        ...orderedProducts.map(
                          (product) => orderProductCard(product),
                        ),

                        const SizedBox(height: 10),

                        // ==================================================
                        // DELIVERY STATUS
                        // ==================================================
                        Container(
                          padding: const EdgeInsets.all(18),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.04),
                                blurRadius: 12,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              const Text(
                                "Order Status",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),

                              const SizedBox(height: 18),

                              statusRow(
                                icon: Icons.check_circle_rounded,
                                title: "Order Confirmed",
                                subtitle: "Your order has been received",
                                active: true,
                              ),

                              statusLine(),

                              statusRow(
                                icon: Icons.restaurant_rounded,
                                title: "Preparing",
                                subtitle: "Your items are being prepared",
                                active: false,
                              ),

                              statusLine(),

                              statusRow(
                                icon: Icons.delivery_dining_rounded,
                                title: "Out for Delivery",
                                subtitle: "Your order is on the way",
                                active: false,
                              ),

                              statusLine(),

                              statusRow(
                                icon: Icons.home_rounded,
                                title: "Delivered",
                                subtitle: "Enjoy your order!",
                                active: false,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        // ==================================================
                        // TOTAL
                        // ==================================================
                        Container(
                          padding: const EdgeInsets.all(18),

                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: Colorutils.primecolor,
                            ),

                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              const Text(
                                "Order Total",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              Text(
                                "\$${calculateTotal(orderedProducts).toStringAsFixed(0)}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // PRODUCT CARD
  // ============================================================

  Widget orderProductCard(dynamic product) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Row(
        children: [
          // IMAGE
          Container(
            height: 70,
            width: 70,

            padding: const EdgeInsets.all(8),

            decoration: BoxDecoration(
              color: const Color(0xFFF7F7F7),
              borderRadius: BorderRadius.circular(15),
            ),

            child: Image.asset(product.image, fit: BoxFit.contain),
          ),

          const SizedBox(width: 13),

          // NAME + QUANTITY
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  product.name,

                  maxLines: 1,

                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  "Quantity: ${product.quantity}",

                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ],
            ),
          ),

          // PRICE
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              Text(
                "\$${product.price}",

                style: TextStyle(
                  color: Colorutils.buttoncolor,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                "x ${product.quantity}",

                style: const TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // STATUS ROW
  // ============================================================

  Widget statusRow({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool active,
  }) {
    return Row(
      children: [
        Container(
          height: 38,
          width: 38,

          decoration: BoxDecoration(
            color: active
                ? Colorutils.buttoncolor.withOpacity(0.12)
                : Colors.grey.withOpacity(0.10),

            shape: BoxShape.circle,
          ),

          child: Icon(
            icon,

            color: active ? Colorutils.buttoncolor : Colors.grey.shade400,

            size: 20,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                title,

                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,

                  color: active ? const Color(0xFF202020) : Colors.grey,
                ),
              ),

              const SizedBox(height: 2),

              Text(
                subtitle,

                style: const TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // STATUS LINE
  // ============================================================

  Widget statusLine() {
    return Container(
      margin: const EdgeInsets.only(left: 18, top: 4, bottom: 4),

      height: 22,

      width: 2,

      color: Colors.grey.shade200,
    );
  }

  // ============================================================
  // CALCULATE TOTAL
  // ============================================================

  double calculateTotal(List products) {
    double total = 0;

    for (final product in products) {
      total += product.price * product.quantity;
    }

    return total;
  }

  // ============================================================
  // EMPTY ORDER
  // ============================================================

  Widget _emptyOrder() {
    return Center(
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
              Icons.shopping_bag_outlined,
              color: Colorutils.buttoncolor,
              size: 45,
            ),
          ),

          const SizedBox(height: 18),

          const Text(
            "No Orders Yet",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),

          const SizedBox(height: 7),

          const Text(
            "Your placed orders will appear here.",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
