import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_cry_with_auth/screens/image_preview.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late int imageIndex;
  late ScrollController _controller;
  bool showInList = false;
  bool showAppBar = true;

  final postImages = [
    "https://m.media-amazon.com/images/I/61N4oFvSUVL._UX679_.jpg",
    "https://m.media-amazon.com/images/I/41VTsHWZD7L.jpg",
    "https://m.media-amazon.com/images/I/41Zh6lUfmeL.jpg",
    "https://m.media-amazon.com/images/I/41NuIZCkANL.jpg",
  ];

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    imageIndex = 0;
    _controller.addListener(() {
      if (_controller.position.pixels > 1220) {
        showInList = true;
      } else {
        showInList = false;
      }

      if (_controller.position.pixels > 100) {
        showAppBar = false;
      } else {
        showAppBar = true;
      }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar
          ? AppBar(
              backgroundColor: Colors.white,
              leading: const Icon(
                Icons.arrow_back,
                color: Colors.grey,
              ),
              title: Container(
                width: 120,
                height: 40,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(
                      "https://cdn.fcglcdn.com/brainbees/images/m/fc-logo.png",
                    ),
                  ),
                ),
              ),
              actions: [
                const Icon(
                  Icons.search,
                  size: 24,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Icon(
                  Icons.share,
                  size: 24,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 8,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const Icon(
                      Icons.shopping_cart_outlined,
                      size: 24,
                      color: Colors.grey,
                    ),
                    Positioned(
                      right: 2,
                      top: 10,
                      child: Container(
                        height: 12,
                        width: 8,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(
                            2,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "0",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 8,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
              elevation: 2,
            )
          : null,
      bottomNavigationBar: !showInList ? _buildAddToCrdBottomBar() : null,
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImages(),
            const SizedBox(
              height: 20,
            ),
            _buildNewTag(),
            const SizedBox(
              height: 16,
            ),
            _buildItemName(),
            const SizedBox(
              height: 16,
            ),
            _buildItemPriceAndLikeButton(),
            const SizedBox(
              height: 6,
            ),
            _buildMRP(),
            const SizedBox(
              height: 8,
            ),
            _buildMRPTaxesLabel(),
            const SizedBox(
              height: 8,
            ),
            Container(height: 8, color: Colors.grey.shade200),
            const SizedBox(
              height: 12,
            ),
            _buildFreeShippingJoin(),
            const SizedBox(
              height: 10,
            ),
            _buildEarnClubCash(),
            const SizedBox(
              height: 10,
            ),
            Container(height: 8, color: Colors.grey.shade200),
            const SizedBox(
              height: 10,
            ),
            _buildOffers(),
            const SizedBox(
              height: 20,
            ),
            _buildSizing(),
            const SizedBox(
              height: 20,
            ),
            Container(height: 8, color: Colors.grey.shade200),
            const SizedBox(
              height: 20,
            ),
            _buildDelivery(),
            const SizedBox(
              height: 20,
            ),
            Container(height: 8, color: Colors.grey.shade200),
            const SizedBox(
              height: 20,
            ),
            _buildFeatures(),
            const SizedBox(
              height: 20,
            ),
            Container(height: 8, color: Colors.grey.shade200),
            const SizedBox(
              height: 20,
            ),
            _buildClubBenefits(),
            const SizedBox(
              height: 20,
            ),
            Container(height: 8, color: Colors.grey.shade200),
            const SizedBox(
              height: 20,
            ),
            _buildSizeInfo(),
            const SizedBox(
              height: 20,
            ),
            Container(height: 8, color: Colors.grey.shade200),
            const SizedBox(
              height: 20,
            ),
            _buildProductInfo(),
            const SizedBox(
              height: 20,
            ),
            Container(height: 8, color: Colors.grey.shade200),
            const SizedBox(
              height: 20,
            ),
            _buildBrandInfo(),
            const SizedBox(
              height: 20,
            ),
            Container(height: 8, color: Colors.grey.shade200),
            if (showInList) ...[
              _buildAddToCrdBottomBar(),
              Container(height: 8, color: Colors.grey.shade200),
            ],
            const SizedBox(
              height: 20,
            ),
            _buildyouMayLike(),
            Container(height: 8, color: Colors.grey.shade200),
            _buildMoreInfo(),
            Container(height: 8, color: Colors.grey.shade200),
            const SizedBox(
              height: 20,
            ),
            _buildFrequentlyBoughtTogether(),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOffers() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 80,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            _buildOfferOneBanner(),
            const SizedBox(
              width: 16,
            ),
            _buildOfferTwoBanner(),
            const SizedBox(
              width: 16,
            ),
            _buildOfferOneBanner()
          ],
        ),
      ),
    );
  }

  Widget _buildEarnClubCash() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            16,
          ),
          border: Border.all(
            color: Colors.yellow.shade600,
          ),
          color: const Color(0xFFFEFBE8),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 6,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 14,
              width: 14,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://cdn-icons-png.flaticon.com/512/272/272525.png",
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            const Text(
              "Buy & Earn Club Cash up to",
            ),
            const Icon(
              Icons.currency_rupee,
              size: 12,
            ),
            const Text(
              "12",
              style: TextStyle(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFreeShippingJoin() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Row(
        children: [
          const SizedBox(
            height: 48,
            width: 48,
            child: Image(
              image: NetworkImage(
                "https://cdn-icons-png.flaticon.com/512/7541/7541900.png",
              ),
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Get Free Shipping with ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Club",
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Shipping Cost: ",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  const Icon(
                    Icons.currency_rupee,
                    size: 14,
                    color: Colors.green,
                  ),
                  const Text("0",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      )),
                  const SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.currency_rupee,
                    size: 12,
                    color: Colors.grey.shade700,
                  ),
                  Text(
                    "50",
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey.shade700,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                "Join Now",
                style: TextStyle(
                  color: Colors.orange.shade800,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 12,
                color: Colors.orange.shade800,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMRP() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Row(
        children: [
          Text(
            "MRP:",
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Icon(
            Icons.currency_rupee,
            size: 16,
            color: Colors.grey.shade600,
          ),
          Text(
            "699.99",
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          const Text(
            "14% OFF",
            style: TextStyle(
              color: Colors.red,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMRPTaxesLabel() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        "MRP incl. all taxes",
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade800,
        ),
      ),
    );
  }

  Widget _buildItemName() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        "THE NESAVU Golden Yellow with White Cotton Frock for Girls Kids",
        style: TextStyle(
          fontSize: 16,
          height: 1.3,
        ),
      ),
    );
  }

  Widget _buildItemPriceAndLikeButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          const Icon(
            Icons.currency_rupee,
            size: 20,
          ),
          const SizedBox(
            width: 4,
          ),
          const Text(
            "601.1",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          Icon(
            Icons.favorite_outline,
            color: Colors.grey.shade600,
            size: 24,
          ),
        ],
      ),
    );
  }

  Widget _buildNewTag() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        padding: const EdgeInsets.all(
          2,
        ),
        child: Text(
          "New",
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildImages() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ..._buildImageCarousel(),
        if (postImages.length > 1)
          Padding(
            padding: const EdgeInsets.only(
              bottom: 12.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 6,
              ),
              child: Text(
                "${imageIndex + 1} / ${postImages.length}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildBrandInfo() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Text(
            "BRAND INFORMATION",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          Icon(
            Icons.add,
          ),
        ],
      ),
    );
  }

  Widget _buildSizing() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Text(
                "SIZE",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Icon(
                Icons.straighten,
                color: Colors.blue,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "SIZE HELP",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            height: 32,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                _buildSizeWidget(
                  "1 - 3 M",
                ),
                const SizedBox(
                  width: 12,
                ),
                _buildSizeWidget("4 - 6 M"),
                const SizedBox(
                  width: 12,
                ),
                _buildSizeWidget("7 - 9 M"),
                const SizedBox(
                  width: 12,
                ),
                _buildSizeWidget("10 - 12 M"),
                const SizedBox(
                  width: 12,
                ),
                _buildSizeWidget("13 - 15 M"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDelivery() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Icon(
                Icons.local_shipping_outlined,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                "Delivery Pincode ",
              ),
              Text(
                "324000",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                "(Update)",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.check,
                  size: 12,
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              const Text(
                "Get it by ",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Text(
                "Wednesday, May 10.",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildFeatures() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(
                  Icons.redeem,
                  size: 32,
                  color: Colors.orange.shade800,
                ),
                const SizedBox(
                  height: 4,
                ),
                const SizedBox(
                  width: 36,
                  child: Text(
                    "Gift Wrap",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.payments,
                  size: 32,
                  color: Colors.orange.shade800,
                ),
                const SizedBox(
                  height: 4,
                ),
                const SizedBox(
                  width: 60,
                  child: Text(
                    "COD   Available",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.currency_exchange,
                  size: 32,
                  color: Colors.orange.shade800,
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  "Days Return",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  "or Exchange",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSizeInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Text(
                "SIZE INFORMATION & MATERIAL CARE",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Icon(
                Icons.add,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "Product Material",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "Rayon",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProductInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "PRODUCT INFORMATION",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Specifications:",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        _buildProdictInfoItem(
          "Brand - Babyhug",
        ),
        _buildProdictInfoItem(
          "Type - Frock",
        ),
        _buildProdictInfoItem(
          "Fabric - Rayon",
        ),
        _buildProdictInfoItem(
          "Sleeves - Sleveless",
        ),
        _buildProdictInfoItem(
          "Neck - Singlet",
        ),
        _buildProdictInfoItem(
          "Neck opening - Shoulder Tie",
        ),
        const SizedBox(
          height: 4,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Length - Knee Length",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Pattern - Chevron Pattern",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Read More",
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddToCrdBottomBar() {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              color: const Color(0xff524C4E),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "3 - 4 Y",
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              height: 48,
              alignment: Alignment.center,
              color: const Color(0xffFE7043),
              child: const Text(
                "ADD TO CART",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildyouMayLike() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "YOU MAY ALSO LIKE",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          crossAxisCount: 2,
          childAspectRatio: .7,
          shrinkWrap: true,
          children: <Widget>[
            _buildYouMayLikeItem(),
            _buildYouMayLikeItem(),
            _buildYouMayLikeItem(),
            _buildYouMayLikeItem(),
            _buildYouMayLikeItem(),
            _buildYouMayLikeItem(),
          ],
        ),
      ],
    );
  }

  Widget _buildMoreInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildMoreInfoItem("More One Peice Dresses/Frocks"),
        const Divider(
          height: 1,
        ),
        _buildMoreInfoItem("More Red One Peice Dresses/Frocks"),
        const Divider(
          height: 1,
        ),
        _buildMoreInfoItem("More One Peice Dresses/Frocks from BabyHug"),
      ],
    );
  }

  Widget _buildFrequentlyBoughtTogether() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "FREQUENTLY BOUGHT TOGETHER",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        SizedBox(
          height: 280,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              _buildFrequentlyBoughtTogetherItem(),
              _buildFrequentlyBoughtTogetherItem(),
              _buildFrequentlyBoughtTogetherItem(),
              _buildFrequentlyBoughtTogetherItem(),
              _buildFrequentlyBoughtTogetherItem(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFrequentlyBoughtTogetherItem() {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 2,
                  spreadRadius: 2,
                  offset: const Offset(
                    0,
                    -2,
                  ),
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              "https://m.media-amazon.com/images/I/61N4oFvSUVL._UX679_.jpg",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 4,
            ),
            child: Text(
              "THE NESAVU Golden Yellow with White Cotton Frock for Girls Kids",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              children: [
                const Icon(
                  Icons.currency_rupee,
                  size: 12,
                ),
                const Text(
                  "601.1",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  "699",
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                const Text(
                  "14% OFF",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              height: 32,
              color: const Color(0xffFF7043),
              alignment: Alignment.center,
              child: const Text(
                "ADD TO CART",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMoreInfoItem(String label) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 9,
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildYouMayLikeItem() {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 2,
                  spreadRadius: 2,
                  offset: const Offset(
                    0,
                    -2,
                  ),
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              "https://m.media-amazon.com/images/I/61N4oFvSUVL._UX679_.jpg",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 4,
            ),
            child: Text(
              "THE NESAVU Golden Yellow with White Cotton Frock for Girls Kids",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              children: [
                const Icon(
                  Icons.currency_rupee,
                  size: 12,
                ),
                const Text(
                  "601.1",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  "699",
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                const Text(
                  "14% OFF",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProdictInfoItem(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildClubBenefits() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "FIRSTCRY CLUB BENEFITS",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 140,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                _buildClubBenefitItem(),
                const SizedBox(
                  width: 16,
                ),
                _buildClubBenefitItem(),
                const SizedBox(
                  width: 16,
                ),
                _buildClubBenefitItem(),
                const SizedBox(
                  width: 16,
                ),
                _buildClubBenefitItem(),
                const SizedBox(
                  width: 16,
                ),
                _buildClubBenefitItem(),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClubBenefitItem() {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: Image.network(
              "https://st2.depositphotos.com/1435425/6338/v/950/depositphotos_63384005-stock-illustration-special-offer-icon-design.jpg",
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Exclusive Offers and Benefits',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                WidgetSpan(
                  child: Icon(
                    Icons.arrow_right,
                    size: 16,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSizeWidget(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: .6),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildOfferOneBanner() {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width - 68,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            6,
          ),
          border: Border.all(
            color: const Color(0xFFF2E17F),
          ),
          color: const Color(0xFFFEFBE8)),
      child: Row(children: [
        Container(
          height: 80,
          width: 20,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color(0xFFF2E17F),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                6,
              ),
              bottomLeft: Radius.circular(
                6,
              ),
            ),
          ),
          child: RotatedBox(
            quarterTurns: 3,
            child: Text(
              "OFFERS",
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.6,
              ),
            ),
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 68,
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 2,
                    bottom: 2,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFF053C78),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        8,
                      ),
                      bottomRight: Radius.circular(
                        8,
                      ),
                    ),
                  ),
                  child: const Text(
                    "Use Code: SMBRF",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 2, top: 3.0),
                  child: Text(
                    "T&C apply",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 68 - 40,
                child: const Text(
                  "Flat 40% Off for All Users - Superhit Fashion Bonanza sale",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }

  Widget _buildOfferTwoBanner() {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width - 68,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            6,
          ),
          border: Border.all(
            color: const Color(0xFFF4BDE2),
          ),
          color: const Color(0xFFF9EBF7)),
      child: Row(children: [
        Container(
          height: 80,
          width: 20,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color(0xFFF4BDE2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                6,
              ),
              bottomLeft: Radius.circular(
                6,
              ),
            ),
          ),
          child: RotatedBox(
            quarterTurns: 3,
            child: Text(
              "OFFERS",
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.6,
              ),
            ),
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 68,
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 2,
                    bottom: 2,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFF024580),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        8,
                      ),
                      bottomRight: Radius.circular(
                        8,
                      ),
                    ),
                  ),
                  child: const Text(
                    "Use Code: SMBRF",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 2, top: 3.0),
                  child: Text(
                    "T&C apply",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Flat 40% OFF* SIDEWIDE OFFER",
              style: TextStyle(
                color: Color(0xFF024580),
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            Container(
              width: (MediaQuery.of(context).size.width) / 1.4,
              height: 1,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFEFBE8),
                    Color(0xFFF4BDE2),
                    Color(0xFFFEFBE8),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "Flat 35% OFF* SIDEWIDE OFFER",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ]),
    );
  }

  List<Widget> _buildImageCarousel() {
    if (postImages.isEmpty) {
      return [Container()];
    }
    final images = postImages
        .map<Widget>((image) => SizedBox(
              child: Image(
                image: NetworkImage(
                  image,
                ),
                fit: BoxFit.cover,
              ),
            ))
        .toList();
    return [
      CarouselSlider(
        items: List.generate(
          postImages.length,
          (index) => InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return ImagePreview(
                    images: images,
                    currentImageIndex: index,
                  );
                }),
              );
            },
            child: Container(
              height: MediaQuery.of(context).size.height * .60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.yellow,
                image: DecorationImage(
                  image: NetworkImage(postImages[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        options: CarouselOptions(
          aspectRatio: .79,
          enableInfiniteScroll: false,
          viewportFraction: 1,
          onPageChanged: (pageIndex, reason) {
            setState(() {
              imageIndex = pageIndex;
            });
          },
        ),
      ),
      if (postImages.length > 1)
        const SizedBox(
          height: 8,
        ),
      if (postImages.length == 1)
        const SizedBox(
          height: 8,
        ),
    ];
  }
}
