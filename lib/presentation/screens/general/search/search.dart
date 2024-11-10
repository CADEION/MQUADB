part of 'search_imports.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _controller = TextEditingController();
  List _movies = [];
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _searchMovies(String searchTerm) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await Dio().get(
        'https://api.tvmaze.com/search/shows',
        queryParameters: {'q': searchTerm},
      );

      setState(() {
        _movies = response.data;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Something went wrong. Please try again.';
      });
      print('Error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _onSearchPressed() {
    final query = _controller.text.trim();
    if (query.isNotEmpty) {
      _searchMovies(query);
    } else {
      setState(() {
        _movies.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Movies'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Search movies...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onSubmitted: (_) => _onSearchPressed(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _onSearchPressed,
                ),
              ],
            ),
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _errorMessage != null
                    ? Center(child: Text(_errorMessage!))
                    : _movies.isEmpty
                        ? const Center(child: Text('No results found'))
                        : ListView.builder(
                            itemCount: _movies.length,
                            itemBuilder: (context, index) {
                              final movie = _movies[index]['show'];
                              return ListTile(
                                leading: movie['image'] != null
                                    ? wimage.Image.network(
                                        movie['image']['medium'],
                                        width: 50,
                                        fit: BoxFit.cover,
                                      )
                                    : const SizedBox(width: 50),
                                title: Text(movie['name'] ?? 'No title'),
                                subtitle: Text(movie['genres']?.join(', ') ?? 'No genres'),
                              );
                            },
                          ),
          ),
        ],
      ),
    );
  }
}
