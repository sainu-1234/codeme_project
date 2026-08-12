import 'package:codeme_project/features/browspage/view/browser_screen.dart';
import 'package:codeme_project/utils/colorutils.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedAddress = 0;
  int selectedPayment = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),

      body: Stack(
        children: [
          // ============================================================
          // TOP PREMIUM BACKGROUND
          // ============================================================
          Container(
            height: height * 0.28,
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
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      // BACK BUTTON
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
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
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
                            "Payment",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),

                      // EMPTY SPACE FOR BALANCE
                      const SizedBox(width: 42),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                // ======================================================
                // WHITE CONTENT CARD
                // ======================================================
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(18, 22, 18, 15),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF7F7F7),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),

                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ==================================================
                          // DELIVERY ADDRESS
                          // ==================================================
                          const Text(
                            "Delivery Address",
                            style: TextStyle(
                              color: Color(0xFF202020),
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),

                          const SizedBox(height: 12),

                          addressCard(
                            title: "Home",
                            phone: "+91 98765 43210",
                            address: "Kozhikode, Kerala",
                            value: 0,
                            icon: Icons.home_rounded,
                          ),

                          const SizedBox(height: 10),

                          addressCard(
                            title: "Office",
                            phone: "+91 98765 43210",
                            address: "Cyber Park, Kozhikode",
                            value: 1,
                            icon: Icons.work_rounded,
                          ),

                          const SizedBox(height: 24),

                          // ==================================================
                          // PAYMENT METHOD
                          // ==================================================
                          const Text(
                            "Payment Method",
                            style: TextStyle(
                              color: Color(0xFF202020),
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),

                          const SizedBox(height: 12),

                          paymentTile(
                            image: "assets/images/googlepay.png",
                            title: "Google Pay",
                            subtitle: "Pay securely with Google Pay",
                            value: 0,
                          ),

                          paymentTile(
                            image: "assets/images/images.jpeg",
                            title: "Credit / Debit Card",
                            subtitle: "Visa, Mastercard and more",
                            value: 1,
                          ),

                          paymentTile(
                            image: "assets/images/phonepay.jpeg",
                            title: "PhonePe",
                            subtitle: "Fast and secure payment",
                            value: 2,
                          ),

                          paymentTile(
                            image: "assets/images/images.png",
                            title: "Apple Pay",
                            subtitle: "Pay when your order arrives",
                            value: 3,
                          ),

                          const SizedBox(height: 15),

                          // ==================================================
                          // ORDER SUMMARY
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
                            child: Column(
                              children: [
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Order Summary",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 15),

                                amountRow("Items Total", "\$2,450"),

                                const SizedBox(height: 10),

                                amountRow("Delivery Fee", "\$80"),

                                const SizedBox(height: 10),

                                amountRow(
                                  "Discount",
                                  "-\$50",
                                  valueColor: Colors.green,
                                ),

                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 14),
                                  child: Divider(),
                                ),

                                amountRow(
                                  "Total Amount",
                                  "\$2,480",
                                  bold: true,
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 18),

                          // ==================================================
                          // PAYMENT BUTTON
                          // ==================================================
                          SizedBox(
                            width: double.infinity,
                            height: 58,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: Colorutils.primecolor,
                                ),
                                borderRadius: BorderRadius.circular(17),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colorutils.buttoncolor.withOpacity(
                                      0.25,
                                    ),
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
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "Order placed successfully!",
                                        ),
                                      ),
                                    );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BrowserScreen(),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.lock_rounded,
                                        color: Colors.white,
                                        size: 18,
                                      ),

                                      const SizedBox(width: 8),

                                      const Text(
                                        "Pay \$2,480",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.verified_user_rounded,
                                  size: 14,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "100% Secure Payment",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 10),
                        ],
                      ),
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
  // ADDRESS CARD
  // ============================================================

  Widget addressCard({
    required String title,
    required String phone,
    required String address,
    required int value,
    required IconData icon,
  }) {
    final bool selected = selectedAddress == value;

    return InkWell(
      onTap: () {
        setState(() {
          selectedAddress = value;
        });
      },
      borderRadius: BorderRadius.circular(18),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: selected ? Colorutils.buttoncolor : Colors.transparent,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // ADDRESS ICON
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colorutils.buttoncolor.withOpacity(0.10),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(icon, color: Colorutils.buttoncolor, size: 22),
            ),

            const SizedBox(width: 12),

            // ADDRESS DETAILS
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    address,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),

                  const SizedBox(height: 2),

                  Text(
                    phone,
                    style: const TextStyle(color: Colors.grey, fontSize: 11),
                  ),
                ],
              ),
            ),

            // RADIO
            Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected
                      ? Colorutils.buttoncolor
                      : Colors.grey.shade400,
                  width: 2,
                ),
              ),
              child: selected
                  ? Center(
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colorutils.buttoncolor,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // PAYMENT TILE
  // ============================================================

  Widget paymentTile({
    required String image,
    required String title,
    required String subtitle,
    required int value,
  }) {
    final bool selected = selectedPayment == value;

    return InkWell(
      onTap: () {
        setState(() {
          selectedPayment = value;
        });
      },
      borderRadius: BorderRadius.circular(17),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
            color: selected ? Colorutils.buttoncolor : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(image)),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colorutils.buttoncolor),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ],
              ),
            ),

            Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected
                      ? Colorutils.buttoncolor
                      : Colors.grey.shade400,
                  width: 2,
                ),
              ),
              child: selected
                  ? Center(
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colorutils.buttoncolor,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // AMOUNT ROW
  // ============================================================

  Widget amountRow(
    String title,
    String value, {
    bool bold = false,
    Color? valueColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: bold ? const Color(0xFF202020) : Colors.grey.shade600,
            fontSize: bold ? 17 : 13,
            fontWeight: bold ? FontWeight.w800 : FontWeight.w500,
          ),
        ),

        Text(
          value,
          style: TextStyle(
            color:
                valueColor ??
                (bold ? Colorutils.buttoncolor : const Color(0xFF202020)),
            fontSize: bold ? 18 : 13,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
