import 'package:aprendendo_flutter/Component/percent_size.dart';
import 'package:flutter/material.dart';

class PictureFrame extends StatelessWidget {
  PictureFrame(this.linkImage, {super.key});
  final String linkImage;
  final PercentSize percentSize = PercentSize();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: percentSize.width(20, context),
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: linkImage.contains('http')
            ? Image.network(
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return Image.asset('assets/image/NoImage.png');
                },
                linkImage,
                fit: BoxFit.cover,
              )
            : Image.asset(
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return Image.asset('assets/image/NoImage.png');
                },
                linkImage,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
