part of 'common_widgets_imports.dart';

// Import MyAssets class

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.green,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(.8),
            Colors.black.withOpacity(.7),
            Colors.black.withOpacity(0),
          ],
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: Image(
                      image: AssetImage(MyAssets.assetsImagesJoker),
                      fit: BoxFit.contain,
                      height: 200,
                    ).cornerRadius(50),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.cast_outlined,color: Colors.white,),
                      SizedBox(width: 30,),
                      Icon(Icons.search,color: Colors.white,),
                      SizedBox(width: 30,),
                      Icon(Icons.person,color: Colors.white,),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: .1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("TV Shows",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                Text("Movies",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                Text("Categories",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
