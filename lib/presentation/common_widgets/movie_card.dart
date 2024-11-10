part of 'common_widgets_imports.dart';

class MovieCard extends StatelessWidget {
  final ImageProvider image;
  const MovieCard({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        image: DecorationImage(
          image:AssetImage(MyAssets.assetsImagesJoker), // Hardcoded asset image
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}