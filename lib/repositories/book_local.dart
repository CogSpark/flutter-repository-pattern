import 'dart:math';

import '../models/book.dart';
import 'book.dart';

class BookRepositoryLocal implements BookRepository {
  Stream<List<Book>> getAll() async* {
    Future.delayed(const Duration(milliseconds: 500));
    yield _books;
  }

  Future<Book?> getOne(int id) async {
    return _books.firstWhere((item) => item.id == id);
  }

  Future<void> insert(Book book) async {
    book.id = Random().nextInt(1000);
    _books.add(book);
  }

  Future<void> update(Book book) async {
    int idx = _books.indexWhere((item) => item.id == book.id);
    _books[idx] = book;
  }

  Future<void> delete(int id) async {
    _books.removeWhere((item) => item.id == id);
  }

  final List<Book> _books = <Book>[
    Book(Random().nextInt(1000), "Don Quixote", "Miguel de Cervantes"),
    Book(Random().nextInt(1000), "One Hundred Years of Solitude",
        "Gabriel Garcia Marquez"),
    Book(Random().nextInt(1000), "The Great Gatsby", "F. Scott Fitzgerald"),
    Book(Random().nextInt(1000), "Moby Dick", "Herman Melville"),
    Book(Random().nextInt(1000), "War and Peace", "Leo Tolstoy"),
    Book(Random().nextInt(1000), "Hamlet", "William Shakespeare"),
    Book(Random().nextInt(1000), "The Odyssey", "Homer"),
    Book(Random().nextInt(1000), "Madame Bovary", "Gustave Flaubert"),
    Book(Random().nextInt(1000), "The Divine Comedy", "Dante Alighieri"),
    Book(Random().nextInt(1000), "Lolita", "Vladimir Nabokov"),
    Book(
        Random().nextInt(1000), "The Brothers Karamazov", "Fyodor Dostoyevsky"),
  ];
}
