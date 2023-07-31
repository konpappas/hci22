import 'package:flutter/material.dart';
import 'package:testwheren/main.dart';
import 'package:image_picker/image_picker.dart';
import 'Camera.dart';
import 'StoriesScreen.dart';
import 'globals.dart' as globals;
import 'package:camera/camera.dart';

class LiveEventView extends StatefulWidget {
  final Event event;
  const LiveEventView({Key? key, required this.event}) : super(key: key);

  @override
  State<LiveEventView> createState() => _LiveEventViewState();
}

class _LiveEventViewState extends State<LiveEventView> {
  final _commentController = TextEditingController();
  String Comment = "";
  String time = "";
  //List<Story> stories = [];
  Future<String?> getImageFromCamera() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.getImage(source: ImageSource.camera);
    return pickedFile?.path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            shadowColor: Colors.black,
            elevation: 2,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.event.OnomaEvent),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.radio_button_checked_outlined,
                  color: Color.fromARGB(255, 179, 38, 30),
                )
              ],
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  // navigate to the stories screen
                  if (widget.event.stories.isNotEmpty) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            StoriesScreen(event: widget.event),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    radius: 20,
                    child: Container(
                        decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage(widget.event.eikona)),
                    )),
                  ),
                ),
              ),
            ],
          )),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Card(
                    child: ListTile(
                      leading: const Icon(Icons.location_on_outlined),
                      title: Text(widget.event.meros),
                    ),
                  ),
                ),
                const Flexible(
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text('180'),
                    ),
                  ),
                ),
              ],
            ),

            Divider(
              height: 5,
              color: Colors.grey.shade400,
            ),
            Expanded(
                child: ListView.builder(
              reverse: true,
              itemCount: widget.event.feedback.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(widget
                            .event
                            .feedback[widget.event.feedback.length - 1 - index]
                            .FirstName +
                        widget
                            .event
                            .feedback[widget.event.feedback.length - 1 - index]
                            .LastName),
                    subtitle: Text(widget
                        .event
                        .feedback[widget.event.feedback.length - 1 - index]
                        .commentBody),
                    leading: CircleAvatar(
                        backgroundColor: Colors.purple.shade800,
                        radius: 20,
                        child: Text(
                          widget
                                  .event
                                  .feedback[
                                      widget.event.feedback.length - 1 - index]
                                  .FirstName[0] +
                              widget
                                  .event
                                  .feedback[
                                      widget.event.feedback.length - 1 - index]
                                  .LastName[0],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        )),
                    trailing: Text(
                      widget
                          .event
                          .feedback[widget.event.feedback.length - 1 - index]
                          .UploadTime
                          .format(context)
                          .toString(),
                      style: const TextStyle(fontSize: 16),
                    ));
              },
            )), //Expanded για List μέσα σε Column
            Container(
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  controller: _commentController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          Comment = _commentController.text;
                          _commentController.clear();
                          time = TimeOfDay.now().format(context).toString();
                          widget.event.feedback.add(LiveComment(
                              UploadTime: TimeOfDay.now(),
                              commentBody: Comment,
                              FirstName: globals.firtname,
                              LastName: globals.lastname));
                          setState(() {});
                        },
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      hintText: 'Type your message'),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: (globals.level >= 1)
          ? Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: FloatingActionButton(
                onPressed: ()

                    /*
                async {
                  final image =
                      await getImageFromCamera(); // get the image from camera
                  if (image != null) {
                    // create a new story object with image, current time and user info
                    final newStory = Story(
                      image: image,
                      time: DateTime.now(),
                      user: "${globals.firtname} ${globals.lastname}",
                    );
                    // Add the new story to the list of stories
                    widget.event.stories.add(newStory);
                    setState(() {});
                  }
                },
*/

                    async {
                  await availableCameras().then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => StoryCamera(
                                cameras: value,
                                event: widget.event,
                              ))));
                  globals.progress(.2);
                },
                tooltip: 'Post Story',
                child: const Icon(Icons.camera_alt),
              ),
            )
          : null,
    );
  }
}

class LiveComment {
  final String FirstName;
  final String LastName;
  final String commentBody;
  final TimeOfDay UploadTime;

  LiveComment({
    this.FirstName = "FirstName",
    this.LastName = "LastName",
    required this.commentBody,
    required this.UploadTime,
  });
}

class Story {
  final String image;
  final DateTime time;
  final String user;

  Story({required this.image, required this.time, required this.user});
}
