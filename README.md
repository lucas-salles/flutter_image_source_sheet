# Image Source Sheet Package

Um package para captura de imagems.

## Features

- Exibe um Bottom Sheet para capturar uma imagem da câmera ou da galeria.
- Exibe a visualização da câmera em um widget com um overlay para a captura da face.

## Installation

Primeiro, adicione `image_source_sheet` como uma [dependência em seu arquivo pubspec.yaml](https://flutter.dev/using-packages/).

### iOS

Adicione duas linhas ao `ios/Runner/Info.plist`:

- um com a key `Privacy - Camera Usage Description` e uma descrição de uso.
- e um com a key `Privacy - Microphone Usage Description` e uma descrição de uso.

Ou em formato de texto, adicione a key:

```xml
<key>NSCameraUsageDescription</key>
<string>Can I use the camera please?</string>
<key>NSMicrophoneUsageDescription</key>
<string>Can I use the mic please?</string>
```

### Android

Mude a versão mínima do Android SDK para 21 (ou superior) em seu arquivo `android/app/build.gradle`.

```
minSdkVersion 21
```

Mude a `compileSdkVersion` para 31 (ou superior) em seu arquivo `android/app/build.gradle`.

```
compileSdkVersion 31
```
