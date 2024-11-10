part of 'general_imports.dart';

class General extends StatefulWidget {
  const General({super.key});

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {

  List<TabItem> items = [
    const TabItem(
      icon: Icons.movie_outlined,
      title: 'Movie',
    ),
    const TabItem(
      icon: FeatherIcons.search,
      title: 'Search',
    ),
    
  ];
  int visit = 0;

  List<Widget> pages = [
    // Home(),
    Home(),
    Search(),
    // Tags(navigateType: NavigateType.outer,),
    // Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: pages.elementAt(visit),
      bottomNavigationBar: BottomBarInspiredInside(
              items: items,
              backgroundColor: Color(0xffFE5F55),
              color: Colors.white,
              colorSelected: Colors.white,
              indexSelected: visit,
              onTap: (int index) => setState(() {
                visit = index;
              }),
              chipStyle:const ChipStyle(convexBridge: true,background: Color.fromARGB(255, 243, 197, 194)),
              itemStyle: ItemStyle.circle,
              animated: true,
            ),
    );
  }
}

