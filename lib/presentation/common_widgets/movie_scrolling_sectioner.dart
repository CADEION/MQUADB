part of 'common_widgets_imports.dart';

class MovieScrollingSectioner extends StatelessWidget {
  const MovieScrollingSectioner({super.key, required this.row});
  final Row row;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            "Popular on Netflix",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 1),
            physics: BouncingScrollPhysics(),
            child: row),
      ],
    );
  }
}
