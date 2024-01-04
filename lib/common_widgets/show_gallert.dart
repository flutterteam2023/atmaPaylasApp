import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void showGallery(
  BuildContext context, {
  required List<String> images,
  required int? startIndex,
}) {
  showDialog<void>(
    barrierColor: Colors.black,
    context: context,
    builder: (context) {
      return MyGalleryWidget(
        images: images,
        startIndex: startIndex,
      );
    },
  );
}

class MyGalleryWidget extends HookWidget {
  const MyGalleryWidget({
    required this.images,
    required this.startIndex,
    super.key,
  });
  final List<String> images;
  final int? startIndex;

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController(initialPage: startIndex ?? 0);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: PageView.builder(
        controller: pageController,
        itemBuilder: (context, index) {
          return InteractiveViewer(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width,
                maxHeight: MediaQuery.of(context).size.height -
                    kToolbarHeight -
                    MediaQuery.of(context).viewPadding.bottom -
                    MediaQuery.of(context).viewPadding.top,
              ),
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(images[index % images.length]),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
