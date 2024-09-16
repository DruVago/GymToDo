import 'dart:io';
import 'package:riverpod/riverpod.dart';
import 'todo_service.dart';

void main() {
  final container = ProviderContainer();
  final todoService = container.read(todoServiceProvider);

  while (true) {
    print(
        'Options: [1] Add Todo [2] List Todos [3] Toggle Completion [4] Exit');
    final choice = int.tryParse(stdin.readLineSync() ?? '') ?? 4;

    if (choice == 1) {
      print('Enter todo task:');
      final task = stdin.readLineSync() ?? '';
      todoService.addTodo(task);
    } else if (choice == 2) {
      for (var todo in todoService.todos) {
        print(
            '${todo.id}: ${todo.task} [${todo.isCompleted ? "Completed" : "Pending"}]');
      }
    } else if (choice == 3) {
      print('Enter todo ID to toggle completion:');
      final id = stdin.readLineSync() ?? '';
      todoService.toggleTodoCompletion(id);
    } else if (choice == 4) {
      break;
    }
  }
}
