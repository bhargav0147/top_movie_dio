import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:top_movie/Movie_Controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final MovieController movieController = Get.put(MovieController());
    final ScrollController scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      movieController.updateGridCount(MediaQuery.of(context).size.width);
      movieController.fetchMovies();
      scrollController.addListener(() {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200) {
          movieController.loadMoreMovies();
        }
      });
    });
    return Scaffold(
      backgroundColor: const Color(0xff141414),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(
              () => movieController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: movieController.crossAxisCount.value,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.6
                ),
            controller: scrollController,
            itemCount: movieController.displayedMovies.length + 1, // +1 for loading indicator
            itemBuilder: (context, index) {
              if (index < movieController.displayedMovies.length) {
                final movie = movieController.displayedMovies[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  height: 250,
                  width: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: movie.primaryImage ?? '',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: const Color(0xff141414),
                        highlightColor: Colors.black26,
                        child: Container(
                          width: 150,
                          height: 250,
                          decoration: BoxDecoration(
                            color: const Color(0xff141414),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                    ),
                  ),
                );
              } else {
                // Load More Indicator
                return const Padding(
                  padding: EdgeInsets.all(10),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
