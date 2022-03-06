// https://bento.cdn.pbs.org/hostedbento-prod/filer_public/gar-phase-2/data/books.json

import 'dart:math';

import 'package:http/http.dart';
import 'package:repopattern/repositories/book.dart';
import 'package:repopattern/repositories/book_local.dart';

import '../models/book.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:convert';

class BookRepositoryRemote implements BookRepositoryLocal {
  @override
  Stream<List<Book>> getAll() async* {
    yield await _loadBooks();
  }

  @override
  Future<Book?> getOne(int id) async {
    return _books.firstWhere((item) => item.id == id);
  }

  @override
  Future<void> insert(Book book) async {
    book.id = Random().nextInt(1000);
    _books.add(book);
  }

  @override
  Future<void> update(Book book) async {
    int idx = _books.indexWhere((item) => item.id == book.id);
    _books[idx] = book;
  }

  @override
  Future<void> delete(int id) async {
    _books.removeWhere((item) => item.id == id);
  }

  List<Book> _books = [];

  // Fetch content from the json file
  Future<List<Book>> _loadBooks() async {
    var url = Uri.parse("http://quotes.rest/bible/vod.json");
    Response response = await http.get(Uri.parse(
        "https://bento.cdn.pbs.org/hostedbento-prod/filer_public/gar-phase-2/data/books.json"));

    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<Book>((json) => Book.fromJson(json)).toList();
  }
}
