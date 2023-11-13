import 'package:intl/intl.dart';

String getAllPopularMoviesPath(int page, String apiKey, String baseUrl) {
  return '$baseUrl/movie/popular?$apiKey&page=$page';
}

String getAllTopRatedMoviesPath(int page, String apiKey) {
  return 'https://api.themoviedb.org/3/movie/top_rated?$apiKey&page=$page';
}

String getAllUpcomingMoviesPath(int page, String apiKey) {
  return 'https://api.themoviedb.org/3/movie/upcoming?$apiKey&page=$page';
}

String getMovieDetailsPath(String movieId, String apiKey) {
  return "https://api.themoviedb.org/3/movie/$movieId?$apiKey&append_to_response=videos,credits,reviews,similar";
}

//Top Rated

//Upcoming https://api.themoviedb.org/3/movie/upcoming?apiKey

//MODEL FUNCTIONS

String getNetworkImage(String imageUrl) {
  if (imageUrl.isEmpty) {
    return "https://image.tmdb.org/t/p/original/tDM4UAaHxMrvODGIUj9ZixmyVmw.jpg";
  } else {
    return 'https://image.tmdb.org/t/p/original/$imageUrl';
  }
}

String getGenres(List<dynamic> genres) {
  if (genres.isNotEmpty) {
    return genres.first['name'];
  } else {
    return "";
  }
}

String getRuntime(int minutes) {
  int hours = minutes ~/ 60; // Get the whole number of hours
  int remainingMinutes = minutes % 60; // Get the remaining minutes

  String hourStr = hours == 1 ? 'hr' : 'hrs'; // Handle pluralization
  String minuteStr =
      remainingMinutes == 1 ? 'min' : 'mins'; // Handle pluralization

  String result = '$hours$hourStr ${remainingMinutes}$minuteStr';
  return result;
}

String getDate(String releaseDate) {
  DateTime date = DateTime.parse(releaseDate);

  // Step 2: Format the DateTime object to get only the year
  String year = DateFormat('MMM dd, yyyy').format(date);
  return year;
}

String getVotesCount(int voteCount) {
  if (voteCount < 1000) {
    return '($voteCount)';
  }
  return '(${voteCount ~/ 1000}k)';
}

String getProfileImageUrl(String json) {
  if (json != '/qPnZlG3EltTQvC3snWaEjPTtXP9.jpg') {
    String baseUrl = 'https://image.tmdb.org/t/p/w300';
    String profilePath = json;
    return '$baseUrl$profilePath';
  } else {
    return 'https://palmbayprep.org/wp-content/uploads/2015/09/user-icon-placeholder.png';
  }
}

String getAuthorname(String name, String username) {
  if (name.isNotEmpty) {
    return name;
  } else {
    return username;
  }
}

String getDateYear(String movieDate) {
  DateTime date = DateFormat("MMM dd, yyyy").parse(movieDate);
  String year = DateFormat('yyyy').format(date);
  return year;
}
