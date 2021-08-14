class Images {
  static final Images instance = Images._internal();

  factory Images() {
    return instance;
  }

  Images._internal();

  final add = 'assets/images/add.svg';
  final back = 'assets/images/back.svg';
  final forward = 'assets/images/forward.svg';
  final heart = 'assets/images/heart.svg';
  final logo = 'assets/images/logo.svg';
  final logoWhite = 'assets/images/logo_white.svg';
  final message = 'assets/images/message.svg';
  final profile = 'assets/images/profile.svg';
  final person = 'assets/images/person.jpg';
}
