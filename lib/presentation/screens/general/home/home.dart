part of 'home_imports.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _showTobBar = true, _flag = true;
  late ScrollController controller;
  late HomeViewModel homeViewModel;

  @override
  void initState() {
    homeViewModel = HomeViewModel(repositories: context.read<Repositories>());
    homeViewModel.fetchAllPosts();

    super.initState();
    controller = ScrollController();
    controller.addListener(() {
      _flag =
          controller.position.userScrollDirection == ScrollDirection.forward;

      if (_showTobBar != _flag) setState(() {});
      _showTobBar = _flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: controller,
            physics: BouncingScrollPhysics(),
            child: BlocBuilder<VelocityBloc<List<HomeModel>>,
                VelocityState<List<HomeModel>>>(
              bloc: homeViewModel.homeModelBloc,
              builder: (context, state) {
                if (state is VelocityInitialState) {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is VelocityUpdateState) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SpecialMovie(
                        image: 'assets/images/joker.jpg',
                      ),
                      SizedBox(height: .1),
                      MovieScrollingSectioner(
                        row: Row(
                          children: List.generate(
                            state.data.length,
                            (index) {
                              final homeModel = state.data[index];
                              final show = homeModel.show;
                              if (show != null &&
                                  show.image != null &&
                                  show.image!.medium != null) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 3.0),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeDetailsScreen(homeData: homeModel,)));
                                        },
                                        child: MovieCard(
                                          image:
                                              NetworkImage(show.image!.medium!),
                                        ),
                                      ),
                                      show.name!.text.make() ??
                                          SizedBox.shrink(),
                                    ],
                                  ),
                                );
                              } else {
                                // Handle the case where `show` or its properties are null
                                return SizedBox.shrink();
                              }
                            },
                          ),
                        ),
                        rowName: 'Popular on QuadB',
                      ),
                      SizedBox(height: .1),
                      MovieScrollingSectioner(
                        row: Row(
                          children: List.generate(
                            state.data.length,
                            (index) {
                              state.data.shuffle();
                              final List<HomeModel> orderedData = state.data;
                              final homeModel = orderedData[index];
                              final show = homeModel.show;
                              if (show != null &&
                                  show.image != null &&
                                  show.image!.medium != null) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 3.0),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeDetailsScreen(homeData: homeModel,)));
                                        },
                                        child: MovieCard(
                                          image:
                                              NetworkImage(show.image!.medium!),
                                        ),
                                      ),
                                      show.name!.text.make() ??
                                          SizedBox.shrink(),
                                    ],
                                  ),
                                );
                              } else {
                                // Handle the case where `show` or its properties are null
                                return SizedBox.shrink();
                              }
                            },
                          ),
                        ),
                        rowName: 'Trending Now',
                      ),
                      SizedBox(height: .1),
                      MovieScrollingSectioner(
                        row: Row(
                          children: List.generate(
                            state.data.length,
                            (index) {
                              state.data.shuffle();
                              final List<HomeModel> orderedData = state.data;
                              final homeModel = orderedData[index];
                              final show = homeModel.show;
                              if (show != null &&
                                  show.image != null &&
                                  show.image!.medium != null) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 3.0),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeDetailsScreen(homeData: homeModel,)));
                                        },
                                        child: MovieCard(
                                          image:
                                              NetworkImage(show.image!.medium!),
                                        ),
                                      ),
                                      show.name!.text.make() ??
                                          SizedBox.shrink(),
                                    ],
                                  ),
                                );
                              } else {
                                // Handle the case where `show` or its properties are null
                                return SizedBox.shrink();
                              }
                            },
                          ),
                        ),
                        rowName: 'New Releases',
                      ),
                      SizedBox(height: .1),
                    ],
                  );
                } else if (state is VelocityFailedState) {
                  return Center(
                    child: state.error.text.make(),
                  );
                }
                return SizedBox(
                  child: 'Data'.text.make(),
                );
              },
            ),
          ),
          AnimatedPositioned(
            top: _showTobBar ? 0 : -80,
            duration: Duration(milliseconds: 300),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              opacity: _showTobBar ? 1 : 0,
              child: IgnorePointer(
                ignoring: !_showTobBar,
                child: TopBar(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
