import 'package:flutter/cupertino.dart';
import 'package:flutter_minggu_4_2/mixins/server.dart';
import 'package:flutter_minggu_4_2/model/movie.dart';

class MovieView extends StatelessWidget {
  late Movie movie;
  MovieView({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            Server.alamat_gambar + movie.poster_path,
            width: 80,
            height: 120,
          ),
          SizedBox(
            width: 3,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(movie.release_date),
                SizedBox(
                  height: 5,
                ),
                Text(
                  movie.overview,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
