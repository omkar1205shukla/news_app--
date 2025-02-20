import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/helper_methods.dart';
import '../../data/entities/remote_news_response.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage(
      {super.key, required this.article, required this.isFavourite});
  final Article article;
  final bool isFavourite;

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.arrow_back_ios),
                      SizedBox(
                        width: 4,
                      ),
                      Text('Back')
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: CachedNetworkImage(
                            imageUrl: widget.article.urlToImage.toString(),
                            height: 200,
                            width: double.maxFinite,
                            fit: BoxFit.cover,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                        value: downloadProgress.progress),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Icon(
                            Icons.favorite,
                            size: 30,
                            color: Color(0xFFFA6464),
                          ),
                        )
                      ],
                    )),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  widget.article.title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 10,
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
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  widget.article.description,
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
