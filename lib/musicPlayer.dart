import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';

// use the info bulb to change to stless -> stful

class MusicPlayerScreen extends StatefulWidget {
  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  AudioPlayer _audioPlayer = AudioPlayer();

  bool _playing = false; // intital value
  AudioPlayerState _audioPlayerState = AudioPlayerState.STOPPED;

  static const SONG_TO_PLAY =
      "https://www.mediacollege.com/downloads/sound-effects/nature/forest/rainforest-ambient.mp3";

  @override
  Widget build(BuildContext context) {
    Function onPressedPlay = () {
      if (_playing)
        pausemusic();
      else
        playmusic();
    };

    return Stack(
      children: [
        Container(
          width: double.maxFinite,
          height: double.infinity,
          color: Colors.cyan[200],
          alignment: AlignmentDirectional.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    icon: _audioPlayerState != AudioPlayerState.PLAYING
                        ? Icon(Icons.play_arrow)
                        : Icon(Icons.pause),
                    onPressed: onPressedPlay),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: IconButton(icon: Icon(Icons.pause) , onPressed: ()=>pausemusic()),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    icon: Icon(Icons.stop), onPressed: () => stopmusic()),
              ),
            ],
          ),
        ),
        Center(
          child: Container(
            width: 200,
            height: 250,
            child: Image.network(
                "https://deviantnoise.com/wp-content/uploads/2020/06/basic-music-theory-guides.jpg"),
          ),
        )
      ],
    );
  }

  void playmusic() async {
    await _audioPlayer.play(SONG_TO_PLAY,
        isLocal: false); // if not stored in phn
    setState(() {
      _audioPlayerState = AudioPlayerState.PLAYING;
      _playing = true;
    });
  }

  void pausemusic() async {
    await _audioPlayer.pause();
    setState(() {
      _audioPlayerState = AudioPlayerState.PAUSED;
      _playing = false;
    });
  }

  void stopmusic() async {
    await _audioPlayer.stop();
    setState(() {
      _audioPlayerState = AudioPlayerState.STOPPED;
      _playing = false;
    });
  }
}
