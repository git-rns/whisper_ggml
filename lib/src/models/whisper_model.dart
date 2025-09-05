/// Available whisper models
enum WhisperModel {
  /// tiny model for all languages
  tiny('tiny'),

  /// base model for all languages
  base('base'),

  /// small model for all languages
  small('small'),

  /// small quantized model for all languages
  smallQ('small-q5_1'),

  /// medium model for all languages
  medium('medium'),

  /// large model for all languages
  large('large'),

  /// tiny model for english only
  tinyEn('tiny.en'),

  /// base model for english only
  baseEn('base.en'),

  /// small model for english only
  smallEn('small.en'),

  /// medium model for english only
  mediumEn('medium.en');

  const WhisperModel(this.modelName);

  /// Public name of model
  final String modelName;

  /// Huggingface url to download model
  Uri get modelUri {
    return Uri.parse(
      'https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-$modelName.bin',
    );
  }
}
