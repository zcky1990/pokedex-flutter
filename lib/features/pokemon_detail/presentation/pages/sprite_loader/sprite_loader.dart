import 'package:flutter/material.dart';

class SpriteLoader extends StatefulWidget {
  final String? frontImage;
  final String? backImage;

  const SpriteLoader({
    super.key,
    this.frontImage,
    this.backImage,
  });

  @override
  State<SpriteLoader> createState() => _SpriteLoaderState();
}

class _SpriteLoaderState extends State<SpriteLoader> {
  late String currentImage;

  @override
  void initState() {
    super.initState();
    currentImage = widget.frontImage ?? "";
  }

  @override
  void didUpdateWidget(covariant SpriteLoader oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.frontImage != oldWidget.frontImage &&
        widget.frontImage != null) {
      setState(() {
        currentImage = widget.frontImage!;
      });
    } else if (widget.frontImage == null && currentImage.isNotEmpty) {
      setState(() {
        currentImage = "";
      });
    }
  }

  void changeImage() {
    if (widget.frontImage == null || widget.frontImage!.isEmpty) {
      return;
    }

    setState(() {
      currentImage = (currentImage == widget.frontImage)
          ? widget.backImage ?? ""
          : widget.frontImage ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    double imageWidth = 200;
    double imageHeight = 200;
    double arrowPostition = imageHeight / 3;
    return SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: currentImage.isEmpty
                  ? const Center(
                      child: Icon(
                        Icons.image,
                        size: 150,
                        color: Colors.white,
                      ),
                    )
                  : Image.network(
                      width: imageWidth,
                      height: imageHeight,
                      currentImage,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.broken_image, size: 48),
                    ),
            ),
            Positioned(
                top: arrowPostition,
                left: 0,
                child: ElevatedButton(
                  onPressed: changeImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.black,
                    shadowColor: Colors.black,
                    elevation: 0,
                  ),
                  child: const Text(
                    "<",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                )),
            Positioned(
                top: arrowPostition,
                right: 0,
                child: ElevatedButton(
                  onPressed: changeImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.black,
                    shadowColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: const Text(
                    ">",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                )),
          ],
        ));
  }
}
