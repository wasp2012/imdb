import 'package:flutter/material.dart';

class CharacterInfoWIdget extends StatelessWidget {
  final String? title;
  final String? value;

  const CharacterInfoWIdget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
              text: title,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.bold)),
          TextSpan(text: value, style: Theme.of(context).textTheme.subtitle1!),
        ],
      ),
    );
  }
}
