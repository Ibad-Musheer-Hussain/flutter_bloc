import 'dart:io';
import 'package:bloc_practice/utils/responsiveSize.dart';
import 'package:bloc_practice/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';


class ImageGalleryViewer extends StatefulWidget {
  final List<dynamic> images; // Can be List<File> or List<String> (URLs)
  final int initialIndex;

  const ImageGalleryViewer({
    super.key,
    required this.images,
    this.initialIndex = 0,
  });

  @override
  State<ImageGalleryViewer> createState() => _ImageGalleryViewerState();
}

class _ImageGalleryViewerState extends State<ImageGalleryViewer> {
  late final ValueNotifier<int> _currentIndexNotifier;

  @override
  void initState() {
    super.initState();
    _currentIndexNotifier = ValueNotifier(widget.initialIndex);
  }

  @override
  void dispose() {
    _currentIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Stack(
        children: [
          // Photo View Gallery
          PhotoViewGallery.builder(
            backgroundDecoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            pageController: PageController(initialPage: widget.initialIndex),
            onPageChanged: (index) {
              _currentIndexNotifier.value = index;
            },
            itemCount: widget.images.length,
            builder: (context, index) {
              final image = widget.images[index];
              return PhotoViewGalleryPageOptions(
                imageProvider: _getImageProvider(image),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 2,
              );
            },
            scrollPhysics: const BouncingScrollPhysics(),
            loadingBuilder: (context, event) => Center(
              child: Utils.progress(),
            ),
          ),
          // Close Button
          Positioned(
            top: 40,
            right: 20,
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              radius: 20.rf(context),
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          // Image Index Indicator
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: ValueListenableBuilder<int>(
                valueListenable: _currentIndexNotifier,
                builder: (context, currentIndex, _) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${currentIndex + 1} / ${widget.images.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  ImageProvider _getImageProvider(dynamic imageFile) {
    if (imageFile is File) {
      return FileImage(imageFile);
    } else if (imageFile is String) {
      return NetworkImage(imageFile);
    } else {
      return const AssetImage('assets/images/add.png');
    }
  }
}
