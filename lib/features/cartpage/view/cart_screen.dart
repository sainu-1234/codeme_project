import 'package:codeme_project/features/bottomnavigationbar/view/bottomnavigationbar_screen.dart';
import 'package:codeme_project/features/cartpage/view/payment_screen.dart';
import 'package:codeme_project/features/homescreenpage/controller/homescreen_controller.dart';
import 'package:codeme_project/features/homescreenpage/view/home_screen.dart';
import 'package:codeme_project/utils/colorutils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final provider1 = context.read<HomescreenController>();
    final provider2 = context.watch<HomescreenController>();

    // ============================================================
    // CART PRODUCTS
    // ============================================================

    final cartProducts = provider2.ProductList.where(
      (product) => product.quantity > 0,
    ).toList();

    // ============================================================
    // TOTAL CALCULATION
    // ============================================================

    double subtotal = 0;

    for (final product in cartProducts) {
      subtotal += product.price * product.quantity;
    }

    final double deliveryFee = cartProducts.isEmpty ? 0 : 40;

    final double total = subtotal + deliveryFee;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),

      body: SafeArea(
        child: Column(
          children: [
            // ============================================================
            // PREMIUM HEADER
            // ============================================================
            Container(
              width: double.infinity,

              padding: const EdgeInsets.fromLTRB(18, 15, 18, 22),

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
                  // BACK BUTTON
                  InkWell(
                    borderRadius: BorderRadius.circular(13),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomnavigationScreen(),
                        ),
                      );
                    },

                    child: Container(
                      height: 42,
                      width: 42,

                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(13),
                      ),

                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  // TITLE
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          "My Cart",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        SizedBox(height: 3),

                        Text(
                          "Review your selected items",
                          style: TextStyle(color: Colors.white70, fontSize: 11),
                        ),
                      ],
                    ),
                  ),

                  // CART ICON
                  Container(
                    height: 42,
                    width: 42,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                    ),

                    child: Icon(
                      Icons.shopping_bag_outlined,
                      color: Colorutils.buttoncolor,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),

            // ============================================================
            // CART CONTENT
            // ============================================================
            Expanded(
              child: cartProducts.isEmpty
                  ? _emptyCart()
                  : Column(
                      children: [
                        // ==================================================
                        // CART ITEMS
                        // ==================================================
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.fromLTRB(16, 18, 16, 10),

                            physics: const BouncingScrollPhysics(),

                            itemCount: cartProducts.length,

                            itemBuilder: (context, index) {
                              final product = cartProducts[index];

                              final originalIndex =
                                  provider1.ProductList.indexOf(product);

                              return _cartItem(
                                context,
                                product,
                                originalIndex,
                                width,
                                provider1,
                              );
                            },
                          ),
                        ),

                        // ==================================================
                        // PRICE SUMMARY
                        // ==================================================
                        _priceSummary(subtotal, deliveryFee, total),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // ================================================================
  // CART ITEM
  // ================================================================

  Widget _cartItem(
    BuildContext context,
    dynamic product,
    int index,
    double width,
    HomescreenController provider,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 13),

      padding: const EdgeInsets.all(10),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Row(
        children: [
          // ============================================================
          // PRODUCT IMAGE
          // ============================================================
          Container(
            height: 88,
            width: 88,

            padding: const EdgeInsets.all(8),

            decoration: BoxDecoration(
              color: const Color(0xFFF7F7F7),
              borderRadius: BorderRadius.circular(16),
            ),

            child: Image.asset(product.image, fit: BoxFit.contain),
          ),

          const SizedBox(width: 12),

          // ============================================================
          // PRODUCT DETAILS
          // ============================================================
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                // PRODUCT NAME
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        product.name,

                        maxLines: 1,

                        overflow: TextOverflow.ellipsis,

                        style: const TextStyle(
                          color: Color(0xFF202020),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    // DELETE
                    InkWell(
                      onTap: () {
                        provider.ProductList[index].quantity = 0;

                        provider.notifyListeners();
                      },

                      child: const Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                // PRICE
                Text(
                  "\$${product.price}",
                  style: TextStyle(
                    color: Colorutils.buttoncolor,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 9),

                // ========================================================
                // QUANTITY + ITEM TOTAL
                // ========================================================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    // QUANTITY
                    Container(
                      height: 32,

                      decoration: BoxDecoration(
                        color: Colorutils.buttoncolor,
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Row(
                        children: [
                          // MINUS
                          InkWell(
                            onTap: () {
                              if (product.quantity > 1) {
                                product.quantity--;

                                provider.notifyListeners();
                              } else {
                                product.quantity = 0;

                                provider.notifyListeners();
                              }
                            },

                            child: const SizedBox(
                              width: 32,

                              child: Icon(
                                Icons.remove_rounded,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),

                          // QUANTITY
                          SizedBox(
                            width: 24,

                            child: Center(
                              child: Text(
                                product.quantity.toString(),

                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),

                          // PLUS
                          InkWell(
                            onTap: () {
                              setState(() {
                                provider.ProductList[index].quantity++;
                              });
                            },

                            child: const SizedBox(
                              width: 32,

                              child: Icon(
                                Icons.add_rounded,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // ITEM TOTAL
                    Text(
                      "\$${product.price * product.quantity}",

                      style: const TextStyle(
                        color: Color(0xFF202020),
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================================================================
  // PRICE SUMMARY
  // ================================================================

  Widget _priceSummary(double subtotal, double deliveryFee, double total) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 15),

      decoration: const BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),

      child: Column(
        children: [
          // ============================================================
          // SUBTOTAL
          // ============================================================
          _priceRow("Subtotal", "\$${subtotal.toStringAsFixed(0)}", false),

          const SizedBox(height: 10),

          // ============================================================
          // DELIVERY
          // ============================================================
          _priceRow(
            "Delivery Fee",
            "\$${deliveryFee.toStringAsFixed(0)}",
            false,
          ),

          const SizedBox(height: 13),

          Divider(color: Colors.grey.shade200, height: 1),

          const SizedBox(height: 13),

          // ============================================================
          // TOTAL
          // ============================================================
          _priceRow("Total", "\$${total.toStringAsFixed(0)}", true),

          const SizedBox(height: 15),

          // ============================================================
          // CHECKOUT BUTTON
          // ============================================================
          Container(
            height: 56,
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
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ],
            ),

            child: Material(
              color: Colors.transparent,

              child: InkWell(
                borderRadius: BorderRadius.circular(17),

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentScreen()),
                  );
                },

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    const Icon(
                      Icons.lock_outline_rounded,
                      color: Colors.white,
                      size: 18,
                    ),

                    const SizedBox(width: 8),

                    const Text(
                      "Proceed to Checkout",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(width: 7),

                    const Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                      size: 19,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================================================================
  // PRICE ROW
  // ================================================================

  Widget _priceRow(String title, String price, bool isTotal) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text(
          title,

          style: TextStyle(
            color: isTotal ? const Color(0xFF202020) : Colors.grey.shade600,

            fontSize: isTotal ? 16 : 13,

            fontWeight: isTotal ? FontWeight.w800 : FontWeight.w500,
          ),
        ),

        Text(
          price,

          style: TextStyle(
            color: isTotal ? Colorutils.buttoncolor : const Color(0xFF202020),

            fontSize: isTotal ? 18 : 13,

            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  // ================================================================
  // EMPTY CART
  // ================================================================

  Widget _emptyCart() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            // ICON
            Container(
              height: 100,
              width: 100,

              decoration: BoxDecoration(
                color: Colorutils.buttoncolor.withOpacity(0.10),

                shape: BoxShape.circle,
              ),

              child: Icon(
                Icons.shopping_bag_outlined,
                color: Colorutils.buttoncolor,
                size: 48,
              ),
            ),

            const SizedBox(height: 22),

            const Text(
              "Your Cart is Empty",
              style: TextStyle(
                color: Color(0xFF202020),
                fontSize: 21,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Looks like you haven't added anything\n"
              "to your cart yet.",
              textAlign: TextAlign.center,

              style: TextStyle(color: Colors.grey, fontSize: 13, height: 1.5),
            ),

            const SizedBox(height: 25),

            // CONTINUE SHOPPING
            Container(
              height: 48,

              padding: const EdgeInsets.symmetric(horizontal: 22),

              decoration: BoxDecoration(
                color: Colorutils.buttoncolor,
                borderRadius: BorderRadius.circular(14),
              ),

              child: Material(
                color: Colors.transparent,

                child: InkWell(
                  borderRadius: BorderRadius.circular(14),

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomnavigationScreen(),
                      ),
                    );
                  },

                  child: const Center(
                    child: Text(
                      "Continue Shopping",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
