class Strings {
  static final Strings instance = Strings._internal();

  factory Strings() {
    return instance;
  }

  Strings._internal();

  final login = 'Login';
  final emailId = 'Email ID';
  final password = 'Password';
  final continueText = 'Continue';
  final posts = 'Posts';
  final loremIpsum =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and';
  final title = 'Title';
  final post = 'Post';
  final createPost = 'Create Post';
  final submitPost = 'Submit Post';
}
