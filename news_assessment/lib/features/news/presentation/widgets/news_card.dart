import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/helper_methods.dart';
import '../../data/entities/remote_news_response.dart';
import '../pages/news_detail_page.dart';

class NewsCard extends StatefulWidget {
  final int index;
  final Article article;
  final bool isFavourite;
  const NewsCard(
      {super.key,
      required this.index,
      required this.article,
      required this.isFavourite});

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsDetailPage(
                    article: widget.article, isFavourite: widget.isFavourite)));
      },
      child: Container(
        margin: EdgeInsets.only(
            left: 18, right: 18, top: widget.index == 0 ? 18 : 0, bottom: 18),
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Colors.white, // Container background color
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17.42),
              blurRadius: 85.15,
              spreadRadius: -3.87,
              color: Color(0x18274B24), // Box shadow color with alpha
            ),
            BoxShadow(
              offset: Offset(0, 7.74),
              blurRadius: 27.09,
              spreadRadius: -5.81,
              color: Color(0x18274B1F), // Box shadow color with alpha
            ),
          ],
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: CachedNetworkImage(
              imageUrl: widget.article.urlToImage.toString(),
              height: 96,
              width: 96,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Column(
            children: [
              Text(
                widget.article.title,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                widget.article.description,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.calendar_month,
                    color: Color(0xFFB9B9B9),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    dateFormatter(widget.article.publishedAt.toString()),
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFFB9B9B9),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ))
        ]),
      ),
    );
  }
}
