import 'package:flutter/material.dart';
import 'package:monstermind/Rhymes/rhymes.dart';

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
                widget.rhyme.isFav = !(widget.rhyme.isFav);
                rhymes.remove(widget.rhyme);
                addInOrder(widget.rhyme);
                setState(() {});
              },
              icon: widget.rhyme.isFav
                  ? const Icon(
                      Icons.favorite_rounded,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.favorite_outline_rounded,
                      color: Colors.white,
                    ),
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}
