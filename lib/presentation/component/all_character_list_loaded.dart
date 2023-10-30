import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_character_app/core/app_constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import '../controller/all_character_bloc.dart';
import '../screens/character_details_screen.dart';

class CharacterListLoaded extends StatefulWidget {
  const CharacterListLoaded({super.key});
  @override
  CharacterListLoadedState createState() => CharacterListLoadedState();
}

class CharacterListLoadedState extends State<CharacterListLoaded> {
  CharacterListLoadedState();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    context.read<AllCharacterBloc>().add(const GetAllCharactersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCharacterBloc, AllCharacterState>(
        buildWhen: (previous, current) =>
            previous.character != current.character,
        builder: (BuildContext context, state) {
          return CustomScrollView(
            controller: scrollController,
            key: const Key('CharacterScrollView'),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Container(
                        width: 330,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 7),
                            Icon(
                              Icons.person,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            const SizedBox(width: 20),
                            Text(
                              "All Characters",
                              style: GoogleFonts.acme(
                                textStyle: const TextStyle(fontSize: 20),
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Divider(
                        height: 8,
                        thickness: 1,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final character = state.character[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 13, left: 15),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0)),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return CharacterDetailsScreen(
                                          characterId: character.id,
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: 'character_image_${character.id}',
                                  child: CachedNetworkImage(
                                    height: 140.0,
                                    width: 120.0,
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        AppConstant.imageUrl(character.id),
                                    placeholder: (context, url) {
                                      return Shimmer.fromColors(
                                        baseColor: Colors.grey[850]!,
                                        highlightColor: Colors.grey[800]!,
                                        child: Container(
                                          height: 170.0,
                                          width: 120.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                      );
                                    },
                                    errorWidget: (context, url, error) {
                                      return const Icon(Icons.error);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return CharacterDetailsScreen(
                                      characterId: character.id,
                                    );
                                  },
                                ),
                              );
                            },
                            child: SizedBox(
                              height: 110,
                              width: 200,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 5,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(character.name),
                                      Text(
                                          'Status: ${character.isAlive ? 'ALIVE!' : 'DEAD!!'}',
                                          style: TextStyle(
                                            color: character.isAlive
                                                ? Colors.lightGreen
                                                : Colors.redAccent,
                                          )),
                                      Text(
                                          "Last Location: ${character.location.name}"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: state.character.length,
                ),
              ),
            ],
          );
        });
  }

  void _scrollListener() {
    const threshold = 200.0;
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - threshold) {
      context.read<AllCharacterBloc>().add(const GetAllCharactersEvent());
    }
  }
}
