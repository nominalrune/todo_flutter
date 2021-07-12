import '../user/user.dart';

class Task {
  int id;
  String title;
  String? description;
  User? assinee;
  Task({required this.id, required this.title, this.description, this.assinee});
}
