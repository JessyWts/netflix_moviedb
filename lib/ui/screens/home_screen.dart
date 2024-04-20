import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netfix_moviedb/models/movie_model.dart';
import 'package:netfix_moviedb/repositories/data_repository.dart';
import 'package:netfix_moviedb/utils/constants.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ super.key });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MovieModel>? movies;

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  getMovies() async {
    final dataprovider = Provider.of<DataRepository>(context, listen: false);
    await dataprovider.getPopularMovies();
  }
  
  @override
  Widget build(BuildContext context) {
    final dataprovider = Provider.of<DataRepository>(context);

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: Image.asset('assets/images/netflix_logo_2.png'),
      ),
      body: ListView(
        children: [
          Container(
            height: 500,
            color: Colors.red,
            child: dataprovider.popularMovieList.isEmpty
              ? const Center()
              : Image.network(
                dataprovider.popularMovieList[0].posterURL(),
                fit: BoxFit.cover,
              ),
          ),
          const SizedBox(height: 15.0,),
          Text(
            'Tendances actuelles',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize:18,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 5.0,),
          SizedBox(
            height: 160,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 110.0,
                  margin: const EdgeInsets.only(right: 8.0),
                  color: Colors.yellow,
                  child: dataprovider.popularMovieList.isEmpty
                    ? Center(
                      child: Text(index.toString()),
                    )
                    : Image.network(
                      dataprovider.popularMovieList[index].posterURL(),
                      fit: BoxFit.cover,
                    ),
                );
              },
            ),
          ),
          const SizedBox(height: 15.0,),
          Text(
            'Actuellement au cinema',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize:18,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 5.0,),
          SizedBox(
            height: 320,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 220.0,
                  margin: const EdgeInsets.only(right: 8.0),
                  color: Colors.blue,
                  child: Center(
                    child: Text(index.toString()),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 15.0,),
          Text(
            'Bientôt disponible',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize:18,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 5.0,),
          SizedBox(
            height: 160,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 110.0,
                  margin: const EdgeInsets.only(right: 8.0),
                  color: Colors.green,
                  child: Center(
                    child: Text(index.toString()),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}