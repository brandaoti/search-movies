import 'package:flutter/material.dart';

class MoviePosterComponent extends StatelessWidget {
  const MoviePosterComponent({
    Key? key,
    required this.imageUrl,
    this.child,
  }) : super(key: key);

  final String imageUrl;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 16.0),
      child: Container(
        height: _size.height * 0.7,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(imageUrl),
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 20,
              spreadRadius: -10,
              offset: Offset(0, 20),
              color: Color.fromRGBO(0, 56, 76, 0.2),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
