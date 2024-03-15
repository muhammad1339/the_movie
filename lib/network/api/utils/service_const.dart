class ServiceConst {
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const apiKey = '799a7636fa97467d0ec35f8c6d4c4666';
  static const accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3OTlhNzYzNmZhOTc0NjdkMGVjMzVmOGM2ZDRjNDY2NiIsInN1YiI6IjVhODlhZTc0YzNhMzY4MmRiZjA2ZWQxZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.yUnJiYqkSuq3va8GompRLVylvJhXWV-dYsIAm5nEKhM';
  static const imageUrl = 'https://image.tmdb.org/t/p/w500';
  static const language = 'en-US';
  static const region = 'US';
  static String discoverMovie({int page=1}) => '/discover/movie?api_key=$apiKey&page=$page';
}
