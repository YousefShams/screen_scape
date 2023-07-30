
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


  static String get greetingsString {
    final currentHour = DateTime.now().hour;

    if(currentHour >= 0 && currentHour < 12) return "Good Morning";
    else if(currentHour >= 12 && currentHour < 6) return "Good Afternoon";
    else return "Good Evening";
  }
}