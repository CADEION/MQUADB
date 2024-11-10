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
      body:  IndexedStack(index: visit,children: pages,),
      bottomNavigationBar: BottomBarInspiredInside(
              items: items,
              backgroundColor: const Color.fromARGB(31, 90, 83, 83).withOpacity(0.4),
              color: Colors.white,
              colorSelected: Colors.white,
              indexSelected: visit,
              onTap: (int index) => setState(() {
                visit = index;
              }),
              chipStyle:const ChipStyle(convexBridge: true,background: Colors.red),
              itemStyle: ItemStyle.circle,
              animated: true,
            ),
    );
  }
}

