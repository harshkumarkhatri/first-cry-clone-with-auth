import 'package:flutter/material.dart';

class ImagePreview extends StatefulWidget {
  final List<Widget> images;
  final int currentImageIndex;

  const ImagePreview({
    Key? key,
    required this.images,
    this.currentImageIndex = 0,
  }) : super(key: key);

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  late int currentPageIndex;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    currentPageIndex = widget.currentImageIndex;
    _pageController = PageController(initialPage: widget.currentImageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
      ),
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        children: widget.images
            .map((image) => InteractiveViewer(
                  child: Center(
                    child: image,
                  ),
                ))
            .toList(),
      ),
    );
  }
}
