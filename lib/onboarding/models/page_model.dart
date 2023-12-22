class PageModel {
  final String lottie;
  final String title;
  final String subtitle;
  final String description;
  bool pageSwiped = false;
  bool previousPageSwiped = false;

  PageModel({
    required this.lottie,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.pageSwiped,
    required this.previousPageSwiped,
  });
}

const String description =
    'Lorem ipsum dolor sit\namet, consectetur\nadipiscing elit.\nNam aliquet mollis sem,\nnon varius libero';
