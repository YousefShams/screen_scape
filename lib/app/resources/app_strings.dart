// ignore_for_file: curly_braces_in_flow_control_structures

class AppStrings {

  static const onboardingTitle1 = "Welcome to ScreenScape!";
  static const onboardingSubtitle1 = "Welcome to ScreenScape! Here you can discover the latest and greatest movies."
      " Browse through our collection of popular and top-rated movies, and find your next favorite film.";

  static const onboardingTitle2 = "Stay updated";
  static const onboardingSubtitle2 = "Stay up to date with the latest movie releases by exploring our curated selection of popular movies."
      " From action-packed blockbusters to heartwarming romances, we have something for everyone.";

  static const onboardingTitle3 = "Search through thousand of movies";
  static const onboardingSubtitle3 = "Can't find the movie you're looking for? Use our powerful search feature to quickly find the movie you want. Search by title, genre, or actor, and get instant results. Let's start right now!";

  static const nowPlaying = "Now Playing";
  static const topRated = "Top Rated";
  static const genres = "Genres";

  static const emptyOverview = "We don't have an overview translated in English yet.";
  static const emptyBio = "We don't have a biography for this person yet.";

  static const searchTitle = "Search";
  static const searchHint = "Search here..";
  static const searchEmpty = "Search for movie, tv-shows or people...";

  static const watchlistTitle = "Your Watchlist ❤️";
  static const watchlistEmpty = "Your watchlist is empty, you can add movies"
      " or tv-shows to the watchlist and come back later";

  static const watchlistSuccessAdd = "successfully added to your watchlist!";
  static const watchlistSuccessRemove = "successfully removed from your watchlist";

  static const tryAgain = "Try Again";
  static const locationError = "Please allow and open the location in your device settings"
      " so we can know the"
      " country you are in to display relevant movies to you.";

  static const countryPick = "Choose your country";
  static const countryError = "Please pick a country before proceeding";


  static String get greetingsString {
    final currentHour = DateTime.now().hour;

    if(currentHour >= 0 && currentHour < 12) return "Good Morning";
    else if(currentHour >= 12 && currentHour < 6) return "Good Afternoon";
    else return "Good Evening";
  }
}