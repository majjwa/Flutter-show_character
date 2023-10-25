import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_character_app/core/app_constant.dart';
import 'package:show_character_app/presentation/controller/character_details_bloc.dart';
import '../../core/service_locator.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final int characterId;
  const CharacterDetailsScreen({Key? key, required this.characterId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return sl<CharacterDetailsBloc>()
          ..add(GetCharacterDetailsEvent(characterId));
      },
      child: Scaffold(
        body: MovieDetailContent(
          characterId: characterId,
        ),
      ),
    );
  }
}

class MovieDetailContent extends StatelessWidget {
  final int? characterId;
  const MovieDetailContent({
    Key? key,
    required this.characterId,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterDetailsBloc, CharacterDetailsState>(
        builder: (BuildContext context, state) {
      if (state.characterDetail == null) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Details"),
          ),
          body: CustomScrollView(
            key: const Key('DetailScrollView'),
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  background: FadeIn(
                    duration: const Duration(milliseconds: 500),
                    child: Hero(
                      tag: 'character_image_$characterId',
                      child: CachedNetworkImage(
                        width: MediaQuery.of(context).size.width,
                        imageUrl:
                            AppConstant.imageUrl(state.characterDetail!.id),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: FadeInUp(
                  from: 20,
                  duration: const Duration(milliseconds: 500),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(state.characterDetail!.name,
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.2,
                            )),
                        const SizedBox(height: 8.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Status: ${state.characterDetail!.isAlive ? 'ALIVE!' : 'DEAD!!'}',
                                style: TextStyle(
                                  color: state.characterDetail!.isAlive
                                      ? Colors.lightGreen
                                      : Colors.redAccent,
                                )),
                            const SizedBox(height: 12),
                            const Divider(
                              thickness: 1,
                              height: 8,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Origin: ${state.characterDetail!.origin.name}",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              "Last location: ${state.characterDetail!.location.name}",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              "Species: ${state.characterDetail!.species}",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              "Type: ${state.characterDetail!.type}",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              "Gender: ${state.characterDetail!.gender}",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            Text(
                              "Episodes: ",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 100,
                  width: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.characterDetail!.episode.length,
                    itemBuilder: (context, index) {
                      final ep = state.characterDetail!.episode[index];
                      final epNum = ep.split('/').last;
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 12, top: 6, bottom: 3),
                        child: SizedBox(
                          width: 90,
                          height: 100,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Center(
                              child: Text(
                                epNum,
                                style: TextStyle(
                                  fontSize: 15,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        );
      }
    });
  }
}
