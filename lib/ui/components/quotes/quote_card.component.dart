import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:quotable/models/quote.model.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final bool isFavorite;
  final VoidCallback onPressed;

  const QuoteCard(
      {super.key,
      required this.quote,
      required this.isFavorite,
      required this.onPressed});

  @override
  Widget build(BuildContext context) => Card(
      color: ColorScheme.of(context).surface,
      shadowColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(
              quote.content,
              textAlign: TextAlign.center,
            ),
            subtitle: GestureDetector(
              onTap: () => _showAuthorBio(context, quote),
              child: Text(
                quote.author!.name,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: onPressed,
                  color: isFavorite ? Colors.red : null,
                  icon: Icon(isFavorite
                      ? Icons.favorite_rounded
                      : Icons.favorite_outline_rounded))
            ],
          )
        ],
      ));

  void _showAuthorBio(BuildContext context, Quote quote) {
    NAlertDialog(
      dialogStyle: DialogStyle(titleDivider: true),
      title: Text(
        quote.author!.name,
        style: TextTheme.of(context).titleMedium,
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
                  style: TextTheme.of(context).bodyMedium,
                )
              : const SizedBox.shrink(),
          quote.author!.bio != null
              ? Text(
                  quote.author!.bio!,
                  style: TextTheme.of(context).bodyMedium,
                )
              : const SizedBox.shrink(),
        ],
      ),
      blur: 10,
    ).show(context);
  }
}
