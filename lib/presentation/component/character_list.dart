import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:show_character_app/core/app_constant.dart';
import 'package:show_character_app/core/enum.dart';
import 'package:show_character_app/presentation/controller/all_character_bloc.dart';

import '../screens/character_details_screen.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCharacterBloc, AllCharacterState>(
        buildWhen: (previous, current) => previous.state != current.state,
        builder: (BuildContext context, state) {
          switch (state.state) {
            case CharacterState.loading:
              return const SizedBox(
                  height: 400.0,
                  child: Center(child: CircularProgressIndicator()));
            case CharacterState.loaded:
              return  ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  scrollDirection: Axis.vertical,
                  itemCount: state.character.length,
                  itemBuilder: (context, index) {
                    final character = state.character[index];
                    return Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                            onTap: () {

                            },
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0)),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (BuildContext context){
                                        return CharacterDetailsScreen( characterId:character.id,);
                                      }));
                                },
                                child: CachedNetworkImage(
                                  width: 120.0,
                                  fit: BoxFit.cover,
                                  imageUrl: AppConstant.imageUrl(character.id),
                                  placeholder: (context, url) => Shimmer.fromColors(
                                    baseColor: Colors.grey[850]!,
                                    highlightColor: Colors.grey[800]!,
                                    child: Container(
                                      height: 170.0,
                                      width: 120.0,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          child: Column(
                          children: [
                            Text(character.name),
                            // Text("status: ${character.status} "),
                            // Text("Last Location: ${character.location}"),

                          ],
                        ),),
                      ],
                    );
                  },

              );
            case CharacterState.error:
              return Container();
          }
        });
  }
}
