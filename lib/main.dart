import 'package:flutter/material.dart';
import 'package:repopattern/repositories/book.dart';
import 'package:repopattern/repositories/book_local.dart';
import 'package:repopattern/repositories/book_remote.dart';

import 'models/book.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    //BookRepository bookRepo = BookRepositoryLocal();
    BookRepository bookRepo = BookRepositoryRemote();
    Stream<List<Book>> books = bookRepo.getAll();

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: StreamBuilder<List<Book>>(
            stream: books,
            initialData: [],
            builder: (
              BuildContext context,
              AsyncSnapshot<List<Book>> bookList,
            ) {
              return ListView(
                children: bookList.data!
                    .map(
                      ((Book book) => Text(book.title)),
                    )
                    .toList(),
              );
            },
          ),
        ));
  }
}
