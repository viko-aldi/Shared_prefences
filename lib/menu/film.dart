import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_minggu_4_2/model/movie.dart';
import 'package:flutter_minggu_4_2/repository/movie_repository.dart';
import 'package:flutter_minggu_4_2/widgets/loading_view.dart';
import 'package:flutter_minggu_4_2/widgets/movie_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> list_movie = [];
  bool isNoLoadMore = false;
  int page = 1;
  bool isLoading = true;

  void callAPI() {
    isLoading = true;
    MovieRepository().getMovie(page).then((List<Movie> value) {
      isLoading = false;
      if (value.isEmpty) {
        isNoLoadMore = true;
      }
      list_movie = [...list_movie, ...value];
      setState(() {});
    }).catchError((err, track) {
      print("Something wrong ${err} ${track}");
    });
  }

  @override
  void initState() {
    callAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Rated Movie"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: list_movie.isEmpty
            ? LoadingView()
            : NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollNotification) {
                  if (scrollNotification.metrics.pixels ==
                      scrollNotification.metrics.maxScrollExtent) {
                    if (isNoLoadMore == false) {
                      if (isLoading == false) {
                        page = page + 1;
                        callAPI();
                      }
                    }
                  }
                  return true;
                },
                child: ListView.builder(
                    itemCount: isNoLoadMore == true
                        ? list_movie.length
                        : list_movie.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index < list_movie.length) {
                        return MovieView(movie: list_movie[index]);
                      } else {
                        return LoadingView();
                      }
                    }),
              ),
      ),
    );
  }
}
