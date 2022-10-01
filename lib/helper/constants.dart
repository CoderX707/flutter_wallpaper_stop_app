
Uri url = Uri.parse("https://api.pexels.com/v1/curated?per_page=100");

Uri apiUrlByQuery(query) {
  return Uri.parse(
      "https://api.pexels.com/v1/search?query=$query&per_page=100");
}
