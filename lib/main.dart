import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_show_example/blocs/movie/movie_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => MovieBloc())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      decoration:
                          const InputDecoration(hintText: 'Search for a movie'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          context
                              .read<MovieBloc>()
                              .add(SearchMovieByTitle(_nameController.text));
                        },
                        child: const Text('Search'))
                    // Add TextFormFields and ElevatedButton here.
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) {
              if (state is MovieInitial) {
                return Container();
              }
              if (state is MovieLoading) {
                return const CircularProgressIndicator();
              }

              if (state is MovieError) {
                return Text(state.message ?? 'Error');
              }

              if (state is SearchMovieByTitleSuccess) {
                return Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: state.movies.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          trailing: Image.network(state.movies[index].poster!),
                          title: Text(state.movies[index].title!),
                          subtitle: Text(state.movies[index].year!),
                        );
                      }),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
