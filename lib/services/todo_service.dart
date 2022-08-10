import 'package:flutter/material.dart';
import 'package:todo/database/todo_database.dart';
import 'package:todo/models/todo.dart';

class TodoService with ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  Future<String> getTodos(String username) async {
    try {
      _todos = await TodoDatabase.instance.getTodos(username);
      notifyListeners();
    } catch (e) {
      return e.toString();
    }
    return 'OK';
  }

  Future<String> deleteTodo(Todo todo) async {
    try {
      await TodoDatabase.instance.deleteTodo(todo);
    } catch (e) {
      return e.toString();
    }
    String result = await getTodos(todo.username);
    return result;
  }

  Future<String> createTodo(Todo todo) async {
    try {
      await TodoDatabase.instance.createTodo(todo);
    } catch (e) {
      return e.toString();
    }
    String result = await getTodos(todo.username);
    return result;
  }

  Future<String> toggleTodoDone(Todo todo) async {
    try {
      await TodoDatabase.instance.toggleTodoDone(todo);
    } catch (e) {
      return e.toString();
    }
    String result = await getTodos(todo.username);
    return result;
  }
}
