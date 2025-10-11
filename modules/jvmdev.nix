{ pkgs, ... }:

with pkgs; [
  gradle
  gradle_7
  jdk21_headless
  jetbrains.idea-ultimate
  kotlin
  kotlin-native
]

