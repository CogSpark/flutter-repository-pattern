# Flutter Repository Pattern

This repo demonstrates using the repository pattern for layering your architecture. 

In this design the view utilizes a generic interface to get and set data against the repository. That specification can be setup in an abstract class such as:

``dart

abstract class BookRepository {
  Stream<List<Book>> getAll();
  Future<Book?> getOne(int id);
  Future<void> insert(Book book);
  Future<void> update(Book book);
  Future<void> delete(int id);
}

```
This class is the implemented by with the concrete class

```dart

class BookRepositoryLocal implements BookRepository {

```

Alternatively for testing one class can implement another such as 

```dart
class BookRepositoryRemote implements BookRepositoryLocal {
```

Both models work and allow the use of a base interface, in this case both classes end up implementing BookRepository

```dart
    //BookRepository bookRepo = BookRepositoryLocal();
    BookRepository bookRepo = BookRepositoryRemote();
    Stream<List<Book>> books = bookRepo.getAll();
```