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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SpecialMovie(
                  image: 'assets/images/joker.jpg',
                ),
                SizedBox(height: .1),
                BlocBuilder<VelocityBloc<List<HomeModel>>,
                    VelocityState<List<HomeModel>>>(
                  bloc: homeViewModel.homeModelBloc,
                  builder: (context, state) {
                    if (state is VelocityInitialState) {
                      return Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    } else if (state is VelocityUpdateState) {
                      return MovieScrollingSectioner(
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
                                      MovieCard(
                                        image:
                                            NetworkImage(show.image!.medium!),
                                      ),
                                      show.id?.toString().text.make() ??
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
                // SizedBox(height: .1),
                // loadTrendingNow(),
                SizedBox(height: .1),
                loadNewReleases(),
                SizedBox(height: .1),
              ],
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

  Widget loadTrendingNow() {
    return MovieScrollingSectioner(
      row: Row(
        children: List.generate(
          6,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: MovieCard(
              image: AssetImage(MyAssets.assetsImagesJoker),
            ),
          ),
        ),
      ),
    );
  }

  // Widget loadTrendingNow() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.all(10.0),
  //         child: Text(
  //           "Trending Now",
  //           style: TextStyle(
  //             fontSize: 16,
  //             fontWeight: FontWeight.w500,
  //           ),
  //         ),
  //       ),
  //       SingleChildScrollView(
  //         scrollDirection: Axis.horizontal,
  //         padding: EdgeInsets.symmetric(horizontal: 10),
  //         physics: BouncingScrollPhysics(),
  //         child: Row(
  //           children: [
  //             MovieCard(
  //               image: AssetImage(MyAssets.assetsImagesJoker),
  //             ),
  //             SizedBox(
  //               width: 10,
  //             ),
  //             MovieCard(
  //               image: AssetImage(MyAssets.assetsImagesJoker),
  //             ),
  //             SizedBox(
  //               width: 10,
  //             ),
  //             MovieCard(
  //               image: AssetImage(MyAssets.assetsImagesJoker),
  //             ),
  //             SizedBox(
  //               width: 10,
  //             ),
  //             MovieCard(
  //               image: AssetImage(MyAssets.assetsImagesJoker),
  //             ),
  //             SizedBox(
  //               width: 10,
  //             ),
  //             MovieCard(
  //               image: AssetImage(MyAssets.assetsImagesJoker),
  //             ),
  //             SizedBox(
  //               width: 10,
  //             ),
  //             MovieCard(
  //               image: AssetImage(MyAssets.assetsImagesJoker),
  //             ),
  //             SizedBox(
  //               width: 10,
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget loadNewReleases() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "New Releases",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 10),
          physics: BouncingScrollPhysics(),
          child: Row(
            children: [
              MovieCard(
                image: AssetImage(MyAssets.assetsImagesJoker),
              ),
              SizedBox(
                width: 10,
              ),
              MovieCard(
                image: AssetImage(MyAssets.assetsImagesJoker),
              ),
              SizedBox(
                width: 10,
              ),
              MovieCard(
                image: AssetImage(MyAssets.assetsImagesJoker),
              ),
              SizedBox(
                width: 10,
              ),
              MovieCard(
                image: AssetImage(MyAssets.assetsImagesJoker),
              ),
              SizedBox(
                width: 10,
              ),
              MovieCard(
                image: AssetImage(MyAssets.assetsImagesJoker),
              ),
              SizedBox(
                width: 10,
              ),
              MovieCard(
                image: AssetImage(MyAssets.assetsImagesJoker),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
