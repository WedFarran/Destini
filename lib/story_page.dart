import 'package:destini/story_brain.dart';
import 'package:flutter/material.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryBrain storyBrain = StoryBrain();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.png'), fit: BoxFit.fill),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: size.height * 0.2,
              ),
              Expanded(
                  flex: 12,
                  child: Text(
                    storyBrain.getStory(),
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                  )),
              InkWell(
                onTap: () => setState(() {
                  storyBrain.nextStory(1);
                }),
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(bottom: 20),
                  height: size.height * 0.1,
                  color: Colors.red,
                  child: Text(
                    storyBrain.getChoice1(),
                    style: const TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
              Visibility(
                visible: storyBrain.buttonShouldBeVisible(),
                child: InkWell(
                  onTap: () => setState(() {
                    storyBrain.nextStory(2);
                  }),
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(bottom: 20),
                    height: size.height * 0.1,
                    color: Colors.blue,
                    child: Text(
                      storyBrain.getChoice2(),
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
