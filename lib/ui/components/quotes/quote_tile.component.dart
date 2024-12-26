import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:quotable/models/quote.model.dart';

class QuoteTile extends StatelessWidget {
  final Quote quote;
  final bool isFavorite;
  final VoidCallback onPressed;

  const QuoteTile(
      {Key? key,
      required this.quote,
      required this.isFavorite,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
      color: Theme.of(context).colorScheme.surface,
      shadowColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            contentPadding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 0),
            title: Text(
              quote.content,
              textAlign: TextAlign.start,
            ),
            subtitle: GestureDetector(
              onTap: () => _showAuthorBio(context, quote),
              child: Text(
                quote.author!.name,
                textAlign: TextAlign.start,
              ),
            ),
            trailing: IconButton(
                onPressed: onPressed,
                color: isFavorite ? Colors.red : null,
                icon: Icon(isFavorite
                    ? Icons.favorite_rounded
                    : Icons.favorite_outline_rounded)),
          ),
        ],
      ));

  void _showAuthorBio(BuildContext context, Quote quote) {
    NAlertDialog(
      dialogStyle: DialogStyle(titleDivider: true),
      title: Text(
        quote.author!.name,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: <Widget>[
          quote.author!.description != null
              ? Text(
                  quote.author!.description!,
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              : const SizedBox.shrink(),
          quote.author!.bio != null
              ? Text(
                  quote.author!.bio!,
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              : const SizedBox.shrink(),
        ],
      ),
      blur: 10,
    ).show(context);
  }
}
