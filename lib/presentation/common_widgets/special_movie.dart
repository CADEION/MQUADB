part of 'common_widgets_imports.dart';

class SpecialMovie extends StatelessWidget {
  final String image;
  const SpecialMovie({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 24),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .50,
          child: Stack(
            children: [
              80.h.heightBox,
              Container(
                constraints: BoxConstraints.expand(),
                child: Image(
                  image:AssetImage(MyAssets.assetsImagesBatmanImage), // Hardcoded asset image
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter,
                ).cornerRadius(20),
              ),
              Positioned(
                bottom: -1,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(Icons.add,color: Colors.white,),
                          SizedBox(height: 2),
                          Text("My List",style: TextStyle(color: Colors.white,),),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.black,
                            ),
                            SizedBox(width: 2),
                            Text(
                              "Play",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(Icons.info_outline,color: Colors.white,),
                          SizedBox(height: 2),
                          Text("Info",style: TextStyle(color: Colors.white,),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}