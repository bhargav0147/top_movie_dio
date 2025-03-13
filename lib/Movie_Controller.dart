import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'Movie_Model.dart';

class MovieController extends GetxController {
  RxInt crossAxisCount = 2.obs;
  void updateGridCount(double width) {
    int count = (width ~/ 240);
    crossAxisCount.value = count;
  }
  RxList<MovieModel> allMovies = <MovieModel>[].obs;
  RxList<MovieModel> displayedMovies = <MovieModel>[].obs;
  RxBool isLoading = true.obs;
  final int batchSize = 20;
  int currentBatch = 0;

  Future<void> fetchMovies() async {
    try {
      isLoading(true);
      final response = await Dio().get(
        'https://imdb236.p.rapidapi.com/imdb/top250-movies',
        options: Options(headers: {
          'x-rapidapi-host': 'imdb236.p.rapidapi.com',
          'x-rapidapi-key': '5cdf72d9dfmshdc32b086cf4749dp125e55jsn74d6bc305066',
        }),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        allMovies.assignAll(data.map((e) => MovieModel.fromJson(e)).toList());

        // Load the initial batch
        loadMoreMovies();
      } else {
        print('Failed to load movies');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }

  void loadMoreMovies() {
    if (currentBatch * batchSize < allMovies.length) {
      final nextBatch = allMovies
          .skip(currentBatch * batchSize)
          .take(batchSize)
          .toList();

      displayedMovies.addAll(nextBatch);
      currentBatch++;
    }
  }
}
