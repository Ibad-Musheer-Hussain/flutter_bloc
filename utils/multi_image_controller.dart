import 'dart:io';
import 'package:flutter/foundation.dart';

class MultiImageController extends ChangeNotifier {
  final List<File> _localImages = [];
  final List<String> _networkImages = [];
  final List<String> _removedNetworkImages = [];

  /// Get all local images
  List<File> get localImages => List.unmodifiable(_localImages);

  /// Get all network images
  List<String> get networkImages => List.unmodifiable(_networkImages);

  /// Get all removed network images (useful for tracking deletions)
  List<String> get removedNetworkImages =>
      List.unmodifiable(_removedNetworkImages);

  /// Get total image count
  int get totalImageCount => _localImages.length + _networkImages.length;

  /// Check if there are any images
  bool get hasImages => totalImageCount > 0;

  /// Check if there are no images
  bool get isEmpty => totalImageCount == 0;

  /// Add a local image file
  void addLocalImage(File image) {
    _localImages.add(image);
    notifyListeners();
  }

  /// Add multiple local image files
  void addLocalImages(List<File> images) {
    _localImages.addAll(images);
    notifyListeners();
  }

  /// Add a network image URL
  void addNetworkImage(String imageUrl) {
    _networkImages.add(imageUrl);
    notifyListeners();
  }

  /// Add multiple network image URLs
  void addNetworkImages(List<String> imageUrls) {
    _networkImages.addAll(imageUrls);
    notifyListeners();
  }

  void removeImage(int index, bool isLocal) {
    if (isLocal) {
      if (index < _localImages.length) {
        _localImages.removeAt(index);
      }
    } else {
      final networkIndex = index - _localImages.length;
      if (networkIndex >= 0 && networkIndex < _networkImages.length) {
        // Track removed network images
        _removedNetworkImages.add(_networkImages[networkIndex]);
        _networkImages.removeAt(networkIndex);
      }
    }
    notifyListeners();
  }

  void removeLocalImage(File image) {
    _localImages.remove(image);
    notifyListeners();
  }

  void removeNetworkImage(String imageUrl) {
    if (_networkImages.contains(imageUrl)) {
      _removedNetworkImages.add(imageUrl);
      _networkImages.remove(imageUrl);
      notifyListeners();
    }
  }

  void clear() {
    _localImages.clear();
    _networkImages.clear();
    _removedNetworkImages.clear();
    notifyListeners();
  }

  void initialize({
    List<File>? localImages,
    List<String>? networkImages,
  }) {
    _localImages.clear();
    _networkImages.clear();
    _removedNetworkImages.clear();

    if (localImages != null) {
      _localImages.addAll(localImages);
    }
    if (networkImages != null) {
      _networkImages.addAll(networkImages);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _localImages.clear();
    _networkImages.clear();
    _removedNetworkImages.clear();
    super.dispose();
  }
}
