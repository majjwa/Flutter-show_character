import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:show_character_app/core/app_constant.dart';
import 'package:show_character_app/core/enum.dart';
import 'package:show_character_app/presentation/controller/all_character_bloc.dart';

class CharacterList extends StatelessWidget{
  const CharacterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCharacterBloc, AllCharacterState>(
        buildWhen: (previous, current) =>
        previous.state != current.state,
        builder: (BuildContext context, state) {

          switch (state.state) {
            case CharacterState.loding:
              return const SizedBox(
                  height: 400.0,
                  child: Center(child: CircularProgressIndicator()));
            case CharacterState.loaded:
              print(state);
              return FadeIn(
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  height: 170.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: state.character.length,
                    itemBuilder: (context, index) {
                      final character = state.character[index];
                      return Container(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (BuildContext context){
                            //       return MovieDetailScreen(id: movie.id);
                            //     }));
                          },
                          child: ClipRRect(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
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
                      );
                    },
                  ),
                ),
              );
            case CharacterState.error:
              return Center(child: Container(color: Colors.red,width: 12,height: 13,));
          }
        });
  }
}