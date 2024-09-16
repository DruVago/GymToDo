import 'package:riverpod/riverpod.dart';
import 'todo.dart';
import 'dart:math';

final todoServiceProvider = Provider((ref) => TodoService());

class TodoService {
  final List<Todo> _todos = [];

  List<Todo> get todos => List.unmodifiable(_todos);

  // Function to generate a short random ID
  String generateShortId() {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    return List.generate(6, (index) => chars[random.nextInt(chars.length)])
        .join();
  }

  void addTodo(String task) {
    final id = generateShortId();
    _todos.add(Todo(id: id, task: task));
  }

  void toggleTodoCompletion(String id) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      _todos[index].toggleCompleted();
    } else {
      print('Todo with id $id not found.');
    }
  }
}
