import '../user/user.dart';

class Group {
  late List<User> users;
  Group(this.users);
  Group.one(User user) {
    users = [user];
  }
}
