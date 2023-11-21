import 'package:flutter/material.dart';

class PictureFrame extends StatelessWidget {
  const PictureFrame(this.linkImage, this.tela, {super.key});

  final String linkImage;
  final Size tela;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: num.parse(
            tela.width.toStringAsPrecision(3),
          ) *
          0.20,
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
