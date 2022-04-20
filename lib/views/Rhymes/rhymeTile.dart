import 'package:flutter/material.dart';
import 'package:monstermind/views/Rhymes/rhymes.dart';
import 'package:monstermind/views/Rhymes/ryhmesProvider.dart';
import 'package:monstermind/views/Rhymes/video.dart';
import 'package:provider/provider.dart';

class RhymeTile extends StatefulWidget {
  const RhymeTile({
    Key? key,
    required this.rhyme,
  }) : super(key: key);

  final Rhymes rhyme;

  @override
  State<RhymeTile> createState() => _RhymeTileState();
}

class _RhymeTileState extends State<RhymeTile> {
  @override
  Widget build(BuildContext context) {
    List<Rhymes> rhymes = context.watch<RhymesProvider>().rhymes;

    return SizedBox(
      height: 75,
      child: Card(
        color: const Color(0xffFA978B),
        child: Align(
          child: ListTile(
            leading: Image(
              width: 50,
              height: 40,
              image: AssetImage(widget.rhyme.icon),
              fit: BoxFit.fill,
            ),
            title: Text(
              widget.rhyme.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                context.read<RhymesProvider>().changeFav(widget.rhyme);
              },
              icon: context.read<RhymesProvider>().isFav(widget.rhyme)
                  ? const Icon(
                      Icons.favorite_rounded,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.favorite_outline_rounded,
                      color: Colors.white,
                    ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Video(
                    id: widget.rhyme.vidID,
                  ),
                ),
              );
            },
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}
