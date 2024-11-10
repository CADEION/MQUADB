part of 'general_imports.dart';

class GeneralViewModel{}

// Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     SpecialMovie(
//                       image: 'assets/images/joker.jpg',
//                     ),
//                     SizedBox(height: .1),
//                     BlocBuilder<VelocityBloc<List<HomeModel>>,
//                         VelocityState<List<HomeModel>>>(
//                       bloc: homeViewModel.homeModelBloc,
//                       builder: (context, state) {
//                         if (state is VelocityInitialState) {
//                           return Center(
//                             child: CircularProgressIndicator.adaptive(),
//                           );
//                         } else if (state is VelocityUpdateState) {
//                           return MovieScrollingSectioner(
//                             row: Row(
//                               children: List.generate(
//                                 state.data.length,
//                                 (index) {
//                                   final homeModel = state.data[index];
//                                   final show = homeModel.show;
//                                   if (show != null &&
//                                       show.image != null &&
//                                       show.image!.medium != null) {
//                                     return Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 3.0),
//                                       child: Column(
//                                         children: [
//                                           MovieCard(
//                                             image: NetworkImage(
//                                                 show.image!.medium!),
//                                           ),
//                                           show.id?.toString().text.make() ??
//                                               SizedBox.shrink(),
//                                         ],
//                                       ),
//                                     );
//                                   } else {
//                                     // Handle the case where `show` or its properties are null
//                                     return SizedBox.shrink();
//                                   }
//                                 },
//                               ),
//                             ),
//                           );
//                         } else if (state is VelocityFailedState) {
//                           return Center(
//                             child: state.error.text.make(),
//                           );
//                         }
//                         return SizedBox(
//                           child: 'Data'.text.make(),
//                         );
//                       },
//                     ),
//                     // SizedBox(height: .1),
//                     // loadTrendingNow(),
//                     SizedBox(height: .1),
//                     loadNewReleases(),
//                     SizedBox(height: .1),
//                   ],
//                 );