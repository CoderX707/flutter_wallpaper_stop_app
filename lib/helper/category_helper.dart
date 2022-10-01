import '../model/category_model.dart';

List<CategoriesModel>? getCategories() {
  List<CategoriesModel> categories = [];
  CategoriesModel vehicles = CategoriesModel(
      categoryName: 'Vehicles',
      imageUrl:
          'https://images.pexels.com/photos/39855/lamborghini-brno-racing-car-automobiles-39855.jpeg?auto=compress&cs=tinysrgb&w=600');
  CategoriesModel abstract = CategoriesModel(
      categoryName: 'Abstract',
      imageUrl:
          'https://images.pexels.com/photos/2523959/pexels-photo-2523959.jpeg?auto=compress&cs=tinysrgb&w=600');
  CategoriesModel animals = CategoriesModel(
      categoryName: 'Animals',
      imageUrl:
          'https://images.pexels.com/photos/45170/kittens-cat-cat-puppy-rush-45170.jpeg?auto=compress&cs=tinysrgb&w=600');
  CategoriesModel drinks = CategoriesModel(
      categoryName: 'Drinks',
      imageUrl:
          'https://images.pexels.com/photos/1283219/pexels-photo-1283219.jpeg?auto=compress&cs=tinysrgb&w=600');
  CategoriesModel entertainment = CategoriesModel(
      categoryName: 'Entertainment',
      imageUrl:
          'https://images.pexels.com/photos/1763075/pexels-photo-1763075.jpeg?auto=compress&cs=tinysrgb&w=600');
  CategoriesModel food = CategoriesModel(
      categoryName: 'Food',
      imageUrl:
          'https://images.pexels.com/photos/1565982/pexels-photo-1565982.jpeg?auto=compress&cs=tinysrgb&w=600');
  CategoriesModel holidays = CategoriesModel(
      categoryName: 'Holidays',
      imageUrl:
          'https://images.pexels.com/photos/3388335/pexels-photo-3388335.jpeg?auto=compress&cs=tinysrgb&w=600');
  CategoriesModel nature = CategoriesModel(
      categoryName: 'Nature',
      imageUrl:
          'https://images.pexels.com/photos/1757363/pexels-photo-1757363.jpeg?auto=compress&cs=tinysrgb&w=600');
  CategoriesModel people = CategoriesModel(
      categoryName: 'People',
      imageUrl:
          'https://images.pexels.com/photos/889545/pexels-photo-889545.jpeg?auto=compress&cs=tinysrgb&w=600');
  CategoriesModel sports = CategoriesModel(
      categoryName: 'Sports',
      imageUrl:
          'https://images.pexels.com/photos/46798/the-ball-stadion-football-the-pitch-46798.jpeg?auto=compress&cs=tinysrgb&w=600');
  CategoriesModel technology = CategoriesModel(
      categoryName: 'Technology',
      imageUrl:
          'https://images.pexels.com/photos/3861969/pexels-photo-3861969.jpeg?auto=compress&cs=tinysrgb&w=600');
  CategoriesModel world = CategoriesModel(
      categoryName: 'World',
      imageUrl:
          'https://images.pexels.com/photos/1078850/pexels-photo-1078850.jpeg?auto=compress&cs=tinysrgb&w=600');
  CategoriesModel other = CategoriesModel(
      categoryName: 'Other',
      imageUrl:
          'https://images.pexels.com/photos/6954155/pexels-photo-6954155.jpeg?auto=compress&cs=tinysrgb&w=600');

  categories.add(abstract);
  categories.add(animals);
  categories.add(drinks);
  categories.add(vehicles);
  categories.add(entertainment);
  categories.add(food);
  categories.add(nature);
  categories.add(holidays);
  categories.add(people);
  categories.add(sports);
  categories.add(technology);
  categories.add(world);
  categories.add(other);
  categories.shuffle();
  return categories;
}
