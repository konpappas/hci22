import 'package:flutter/material.dart';
import 'main.dart';
import 'LiveEventView.dart';
import 'dart:io';

class StoriesScreen extends StatefulWidget {
  final Event event;

  const StoriesScreen({Key? key, required this.event}) : super(key: key);

  @override
  _StoriesScreenState createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  final PageController _pageController = PageController();
  int _currentStoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          if (_currentStoryIndex < widget.event.stories.length - 1) {
            setState(() {
              _currentStoryIndex++;
            });
            _pageController.animateToPage(
              _currentStoryIndex,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
            );
          } else {
            Navigator.pop(context);
          }
        },
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  PageView.builder(
                    itemCount: widget.event.stories.length,
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentStoryIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final story = widget.event.stories[index];
                      return Image.file(
                        File(story.image),
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      actions: [
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        widget.event.stories.length,
                        (index) => buildStoryIndicator(index),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.event.stories[_currentStoryIndex].user,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.event.stories[_currentStoryIndex].time.toString(),
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStoryIndicator(int index) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == _currentStoryIndex ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}
