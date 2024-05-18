enum FirestoreCollection {
  user(value: "Users");

  const FirestoreCollection({
    required this.value,
  });

  final String value;
}
