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
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.';
  final title = 'Title';
  final post = 'Post';
  final createPost = 'Create Post';
  final submitPost = 'Submit Post';
  final home = 'Home';
  final albums = 'Albums';
  final todoList = 'To Do List';
  final profile = 'Profile';
  final viewComments = 'view comments';
}
