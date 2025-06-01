//ImageFilter
import 'dart:ui';

// packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//models
import '../models/search_category.dart';
import '../models/movie.dart';
import '../models/main_page_data.dart';

//widgets
import '../widgets/movie_tile.dart';

//controllers
import '../controllers/main_page_data_controller.dart';

//provider
import '../provider/main_page_provider.dart';

// ignore: must_be_immutable
class MainPage extends ConsumerWidget {
  late double _deviceWidth;
  late double _deviceHeight;

  late String _selectedMoviePosterUrl;

  late MainPageDataController _mainPageDataController;
  late MainPageData _mainPageData;

  late TextEditingController _searchTextFieldController;

  MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _mainPageDataController = ref.read(mainPageDataControllerProvider.notifier);
    _mainPageData = ref.watch(mainPageDataControllerProvider);

    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;

    _selectedMoviePosterUrl = ref.watch(selectedMoviePosterUrlProvider);
    _searchTextFieldController = TextEditingController();
    _searchTextFieldController.text = _mainPageData.searchText;

    return _buildUI(ref);
  }

  Widget _buildUI(WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: SizedBox(
        width: _deviceWidth,
        height: _deviceHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [_backgroundWidget(), _foregroundWidgets(ref)],
        ),
      ),
    );
  }

  Widget _backgroundWidget() {
    if (_selectedMoviePosterUrl.isNotEmpty) {
      return Container(
        height: _deviceHeight,
        width: _deviceWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: NetworkImage(_selectedMoviePosterUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.2),
            ),
          ),
        ),
      );
    } else {
      return Container(
        height: _deviceHeight,
        width: _deviceWidth,
        color: Colors.black,
      );
    }
  }

  Widget _foregroundWidgets(WidgetRef ref) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, _deviceHeight * 0.02, 0, 0),
      width: _deviceWidth * 0.88,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _topBarWidget(),
          SizedBox(height: _deviceHeight * 0.02),
          Expanded(child: _movieListViewWidget(ref)),
        ],
      ),
    );
  }

  Widget _topBarWidget() {
    return Container(
      height: _deviceHeight * 0.08,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_searchFieldWidget(), _categorySelectionWidget()],
      ),
    );
  }

  Widget _searchFieldWidget() {
    final border = InputBorder.none;
    return SizedBox(
      width: _deviceWidth * 0.50,
      height: _deviceHeight * 0.05,
      child: TextField(
        controller: _searchTextFieldController,

        onSubmitted: (input) => _mainPageDataController.updateTextSearch(input),
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          focusedBorder: border,
          border: border,
          prefixIcon: const Icon(Icons.search, color: Colors.white24),
          hintStyle: const TextStyle(color: Colors.white54),
          hintText: 'Search...',
        ),
      ),
    );
  }

  Widget _categorySelectionWidget() {
    return DropdownButton<String>(
      dropdownColor: Colors.black38,
      value: _mainPageData.searchCategory,
      icon: const Icon(Icons.menu, color: Colors.white24),
      underline: Container(height: 1, color: Colors.white24),
      // onChanged:
      //     (value) =>
      //         value.toString().isNotEmpty
      //             ? mainPageDataController.updateSearchCategory(value!)
      //             : null,
      onChanged: (String? value) {
        if (value != null && value.isNotEmpty) {
          _mainPageDataController.updateSearchCategory(value);
        }
      },
      items: [
        DropdownMenuItem(
          value: SearchCategory.popular,
          child: Text(
            SearchCategory.popular,
            style: TextStyle(color: Colors.white),
          ),
        ),
        DropdownMenuItem(
          value: SearchCategory.upComing,
          child: Text(
            SearchCategory.upComing,
            style: TextStyle(color: Colors.white),
          ),
        ),

        DropdownMenuItem(
          value: SearchCategory.topRated,
          child: Text(
            SearchCategory.topRated,
            style: TextStyle(color: Colors.white),
          ),
        ),

        DropdownMenuItem(
          value: SearchCategory.nowPlaying,
          child: Text(
            SearchCategory.nowPlaying,
            style: TextStyle(color: Colors.white),
          ),
        ),
        DropdownMenuItem(
          value: SearchCategory.none,
          child: Text(
            SearchCategory.none,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _movieListViewWidget(WidgetRef ref) {
    final List<Movie> movies = _mainPageData.movies;

    // for (int i = 0; i < 10; i++) {
    //   movies.add(
    //     Movie(
    //       name: 'Mortal Kombat',
    //       language: 'EN',
    //       isAdult: false,
    //       description:
    //           "Washed-up MMA fighter Cole Young, unaware of his heritage, and hunted by Emperor Shang Tsungs best warrior, Sub-Zero, seeks out and trains with Earth's greatest champions as he prepares to stand against the enemies of Outworld in a high stakes battle for the universe.",
    //       posterPath: "ybrX94xQm8lXYpZAPRmwD9iIbWP.jpg",
    //       backdropPath: "ybrX94xQm8lXYpZAPRmwD9iIbWP.jpg",
    //       rating: 7.8,
    //       releaseDate: '2021-04-07',
    //     ),
    //   );
    // }
    if (movies.isNotEmpty) {
      return NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollEndNotification) {
            if (notification.metrics.pixels >=
                notification.metrics.maxScrollExtent - 100) {
              _mainPageDataController.getMovies();
              return true;
            }
          }
          return true;
        },
        child: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: _deviceHeight * 0.01),
              //  child: GestureDetector(
              // onTap: () {
              //   _selectedMoviePosterUrl = movies[count].posterUrl();
              // },
              child: GestureDetector(
                onTap: () {
                  ref.read(selectedMoviePosterUrlProvider.notifier).state =
                      movies[index].posterUrl();
                },
                child: MovieTile(
                  height: _deviceHeight * 0.20,
                  width: _deviceWidth * 0.85,
                  movie: movies[index],
                ),
              ),
            );
          },
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(backgroundColor: Colors.white),
      );
    }
  }
}
