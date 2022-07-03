import 'package:flutter/material.dart';

class User {
  const User({
    required this.uid,
    this.email = "",
    this.profileUrl = "",
    this.displayName = "",
  });
  final String uid;
  final String email;
  final String profileUrl;
  final String displayName;
}
