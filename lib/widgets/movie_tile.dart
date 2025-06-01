//Packages
import 'package:flutter/material.dart';

//Models
import '../models/movie.dart';

class MovieTile extends StatelessWidget {
  final double height;
  final double width;
  final Movie movie;
  const MovieTile({
    super.key,
    required this.height,
    required this.width,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _moviePosterWidget(movie.posterUrl()),
          SizedBox(width: 12),
          Expanded(child: _movieInfoWidget()),
        ],
      ),
    );
  }

  Widget _moviePosterWidget(String imageUrl) {
    return Container(
      height: height,
      width: height * 0.80,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _movieInfoWidget() {
    return Container(
      width: width * 0.64, // reduced from 0.66
      // height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                // This ensures text doesn't overflow
                child: Text(
                  movie.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text(
                movie.rating.toStringAsFixed(2),
                style: TextStyle(color: Colors.white, fontSize: 22.0),
              ),
            ],
          ),
          SizedBox(height: height * 0.02),
          Text(
            '${movie.language.toUpperCase()} | R :${movie.isAdult} | ${movie.releaseDate}',
            style: TextStyle(color: Colors.white, fontSize: 12.0),
          ),
          SizedBox(height: height * 0.07),
          Text(
            movie.description,
            maxLines: 9,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white, fontSize: 10.0),
          ),
        ],
      ),
    );
  }
}
