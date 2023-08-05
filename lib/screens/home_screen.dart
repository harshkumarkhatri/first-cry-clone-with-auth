import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState();
  late int imageIndex;

  final postImages = [
    "https://m.media-amazon.com/images/I/61N4oFvSUVL._UX679_.jpg",
    "https://m.media-amazon.com/images/I/41VTsHWZD7L.jpg",
    "https://m.media-amazon.com/images/I/41Zh6lUfmeL.jpg",
    "https://m.media-amazon.com/images/I/41NuIZCkANL.jpg",
  ];

  @override
  void initState() {
    super.initState();
    imageIndex = 0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 52,
                  ),
                  // Image 1
                  Container(
                    height: 64,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://cdn.fcglcdn.com/brainbees/banners/baby_hp_1682761126540.jpg",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildImageCarouselOne(),
                  const SizedBox(
                    height: 8,
                  ),
                  _buildOfferCarousel(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Shop By Category",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildByCategory(),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: _buildScrollableCategories(),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  _buildTrendingStoriesDivider(),
                  const Text(
                    "TRENDING STORIES",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  _buildTrendingStoriesDivider(),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: SizedBox(
                      height: 350,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width * .75,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                ),
                              ],
                              image: DecorationImage(
                                image: NetworkImage(
                                  "https://cdn.fcglcdn.com/brainbees/images/boutique/670x670/29839.jpg",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 12,
                          );
                        },
                        itemCount: 5,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ),
          _buildDeliverTo(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildTrendingStoriesDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 32,
      ),
      child: Divider(
        color: Colors.black,
        height: 2,
        thickness: 1,
      ),
    );
  }

  Widget _buildScrollableCategories() {
    return SizedBox(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          _buildScrollableCategoryItem(),
          const SizedBox(
            width: 13,
          ),
          _buildScrollableCategoryItem(),
          const SizedBox(
            width: 12,
          ),
          _buildScrollableCategoryItem(),
          const SizedBox(
            width: 12,
          ),
          _buildScrollableCategoryItem(),
          const SizedBox(
            width: 12,
          ),
          _buildScrollableCategoryItem(),
          const SizedBox(
            width: 12,
          ),
          _buildScrollableCategoryItem(),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
    );
  }

  Widget _buildScrollableCategoryItem() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 120,
          height: 55,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.pink.shade300,
                Colors.pink.shade600,
                Colors.pink.shade700,
              ],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 140,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://i.pinimg.com/736x/2f/c1/3f/2fc13f58e7f12e1a939d0b8cdd560b67.jpg",
                  ),
                ),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "ARTICLES",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(
                  Icons.arrow_right_rounded,
                  color: Colors.white,
                  size: 16,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }

  Widget _buildByCategory() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        primary: false,
        crossAxisCount: 2,
        childAspectRatio: 1.1,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        shrinkWrap: true,
        children: <Widget>[
          _buildShopByCategoryItem(),
          _buildShopByCategoryItem(),
          _buildShopByCategoryItem(),
          _buildShopByCategoryItem(),
          _buildShopByCategoryItem(),
          _buildShopByCategoryItem(),
          _buildShopByCategoryItem(),
          _buildShopByCategoryItem(),
          _buildShopByCategoryItem(),
          _buildShopByCategoryItem(),
          _buildShopByCategoryItem(),
          _buildShopByCategoryItem(),
        ],
      ),
    );
  }

  Widget _buildShopByCategoryItem() {
    return Container(
      alignment: Alignment.bottomCenter,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 2),
            blurRadius: 1,
            // spreadRadius: 2,
          ),
        ],
        image: const DecorationImage(
          image: NetworkImage(
            "https://cdn.fcglcdn.com/brainbees/images/boutique/670x670/29735.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white.withOpacity(.8),
        padding: const EdgeInsets.symmetric(
          vertical: 2,
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "GIRL 0-6 MONTHS",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOfferCarousel() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: SizedBox(
        height: 72,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: [
            _buildOfferCarouselItem(),
            const SizedBox(
              width: 8,
            ),
            _buildOfferCarouselItem(),
            const SizedBox(
              width: 12,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOfferCarouselItem() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            "https://img.freepik.com/premium-vector/special-offer-sale-discount-banner_180786-46.jpg?w=2000",
          ),
        ),
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      width: MediaQuery.of(context).size.width - 72,
    );
  }

  Widget _buildImageCarouselOne() {
    return Container(
      alignment: Alignment.center,
      height: 332,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          ..._buildImageCarousel(),
          if (postImages.length > 1)
            Positioned(
              bottom: 8,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 12.0,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(
                      postImages.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == imageIndex
                              ? Colors.white
                              : Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDeliverTo() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(
              0,
              2,
            ),
            blurRadius: 2,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12,
        ),
        child: Row(
          children: [
            Icon(
              Icons.pin_drop,
              color: Colors.grey.shade400,
            ),
            const SizedBox(
              width: 8,
            ),
            const Text(
              "Deliver to 324000",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.keyboard_arrow_down_outlined,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 28,
            width: 28,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.yellow),
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Shop for",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey.shade600,
                    size: 16,
                  ),
                ],
              ),
              const Text(
                "All",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const Spacer(),
          Icon(
            Icons.search,
            color: Colors.grey.shade400,
            size: 28,
          ),
          const SizedBox(
            width: 4,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.notifications_none_rounded,
                size: 28,
                color: Colors.grey.shade400,
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle,
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
            width: 4,
          ),
          Icon(
            Icons.favorite_outline,
            size: 28,
            color: Colors.grey.shade400,
          ),
          const SizedBox(
            width: 4,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.shopping_cart_outlined,
                size: 28,
                color: Colors.grey.shade400,
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle,
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
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: const Color(
        0xffff7043,
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.grey.shade800,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Shopping',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_circle_outline),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Parenting',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Menu',
        ),
      ],
    );
  }

  List<Widget> _buildImageCarousel() {
    if (postImages.isEmpty) {
      return [Container()];
    }
    return [
      CarouselSlider(
        items: List.generate(
          postImages.length,
          (index) => Container(
            height: MediaQuery.of(context).size.height * .60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.yellow,
              image: DecorationImage(
                image: NetworkImage(postImages[index]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 2),
          aspectRatio: 1.2,
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
