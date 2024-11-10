part of 'search_imports.dart';

class SearchViewModel{

  final Repositories repositories;

  SearchViewModel({required this.repositories});

  VelocityBloc<List<HomeModel>> searchModelBloc = VelocityBloc<List<HomeModel>>(HomeList.homeCharList);
  
  fetchAllPosts() async {
  try {
    var homeData = await repositories.homeRepo.getAllPosts();
    Vx.log("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
    Vx.log(homeData);
    Vx.log("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
    searchModelBloc.onUpdateData(homeData);
    // if (postsData.status == 1) {
    //   // postsModelBloc.onUpdateData(postsData);
    // }
  } catch (e) {
    Vx.log('Error fetching posts: $e');
  }
}


  
}