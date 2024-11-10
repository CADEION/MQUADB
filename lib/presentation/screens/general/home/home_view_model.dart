part of 'home_imports.dart';

class HomeViewModel{

  final Repositories repositories;

  HomeViewModel({required this.repositories});

  VelocityBloc<List<HomeModel>> homeModelBloc = VelocityBloc<List<HomeModel>>(HomeList.homeCharList);
  
  fetchAllPosts() async {
  try {
    var homeData = await repositories.homeRepo.getAllPosts();
    Vx.log("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
    Vx.log(homeData);
    Vx.log("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
    homeModelBloc.onUpdateData(homeData);
    // if (postsData.status == 1) {
    //   // postsModelBloc.onUpdateData(postsData);
    // }
  } catch (e) {
    Vx.log('Error fetching posts: $e');
  }
}


  
}