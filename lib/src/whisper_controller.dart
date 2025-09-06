import 'package:flutter/foundation.dart';
import 'package:whisper_ggml/src/models/whisper_model.dart';

import 'models/whisper_result.dart';
import 'whisper.dart';

class WhisperController {
  String _modelPath = '';
  String? _dir;

  Future<void> initModel(WhisperModel model) async {
    _modelPath = '$_dir/ggml-${model.modelName}.bin';
  }

  Future<TranscribeResult?> transcribe({
    required WhisperModel model,
    required String audioPath,
    String lang = 'en',
  }) async {
    await initModel(model);

    final Whisper whisper = Whisper(model: model);
    final DateTime start = DateTime.now();
    const bool translate = false;
    const bool withSegments = false;
    const bool splitWords = false;

    try {
      final WhisperTranscribeResponse transcription = await whisper.transcribe(
        transcribeRequest: TranscribeRequest(
          audio: audioPath,
          language: lang,
          isTranslate: translate,
          isNoTimestamps: !withSegments,
          splitOnWord: splitWords,
          isRealtime: true,
        ),
        modelPath: _modelPath,
      );

      final Duration transcriptionDuration = DateTime.now().difference(start);

      return TranscribeResult(
        time: transcriptionDuration,
        transcription: transcription,
      );
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }



  /// Get local path of model file

  /// Download [model] to [destinationPath]
}
