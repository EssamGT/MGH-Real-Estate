import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mgh/state/cubit/app_logic.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class ImageGenerate extends StatefulWidget {
  List<String> image = [];
  ImageGenerate(this.image, {super.key});

  @override
  State<ImageGenerate> createState() => _ImageGenerateState();
}

class _ImageGenerateState extends State<ImageGenerate> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider.builder(
            itemCount: widget.image.length,
            itemBuilder: (context, index, realIndex) {
              final assetiamgge = widget.image[index];
              return GestureDetector(
                  onTap: () {
                    photoViewr(context, widget.image, index);
                  },
                  child: buildIamge(assetiamgge, index));
            },
            options: CarouselOptions(
              height: 400,
              viewportFraction: 1.2,
              onPageChanged: (index, reason) => setState(() {
                activeIndex = index;
              }),
            ),
          ),
          buildIndecator(widget.image.length, activeIndex),
        ],
      ),
    );
  }
}

Widget buildIndecator(int count, int activeIndex) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedSmoothIndicator(
        effect: const ExpandingDotsEffect(
          dotWidth: 15,
          activeDotColor: Colors.blue,
        ),
        activeIndex: activeIndex,
        count: count,
      ),
    );

Widget buildIamge(String image, int index) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      color: Colors.black,
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.cover,
        cacheManager: AppLogic.customCacheManger,
        fadeInDuration: Duration(milliseconds: 10),
      ),
    );

photoViewr(
  BuildContext context,
  List<String> images,
  int index,
) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Center(
          child: PhotoViewGallery.builder(
            itemCount: images.length,
            builder: (context, index) {
              return PhotoViewGalleryPageOptions(
                
                imageProvider: CachedNetworkImageProvider(
                  
                  images[index],
                  cacheManager: AppLogic.customCacheManger,
                  
                ),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 3,
                filterQuality: FilterQuality.high,
              );
            },
            pageController: PageController(initialPage: index),
            loadingBuilder: (context, event) => const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
