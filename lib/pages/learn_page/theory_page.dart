import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:langapp/components/frame/learning_frame.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/pages/learn_page/vocabulary_card.dart';
import 'package:scoped_model/scoped_model.dart';

class TheoryPage extends StatefulWidget {
  @override
  _TheoryPageState createState() => _TheoryPageState();
}

class _TheoryPageState extends State<TheoryPage> {
  @override
  Widget build(BuildContext context) {
    String courseIndex = ScopedModel.of<UserModel>(context, rebuildOnChange: true).courseIndex;

    return LearningFrame(
      point: 0,
      child: Container(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 24.0),
            StreamBuilder(
              stream: Firestore.instance.collection("courses").document(courseIndex).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Text("Loading...");

                DocumentSnapshot ds = snapshot.data;

                // TODO: pobieranie danych słow już znajomych użytkownikom
                // zmienić w bazie danych zapis na liste słow

                if (!ds.exists) {
                  return const Text("No words");
                }

                List<dynamic> courseWords = ds.data['collection_of_words'];
                print(courseWords);
                // [{text: halo,
                // help_texts: [sss, ffff, fffffffff, fffffff],
                // help_imgs: [dddd], phonetics: xxx, audio_url: lalala, translation: hello},
                // {text: neu, phonetics: dddd, translation: new}]

                return Wrap(
                  runSpacing: 8.0,
                  children: courseWords.map((wordData) {
                    return VocabularyCard(
                      vocabulary: wordData['text'],
                      translation: wordData['translation'],
                      isKnown: false,
                    );
                  }).toList(),
                );
              },
            ),
            const SizedBox(height: 12.0),
          ],
        ),
      ),
    );
  }
}
