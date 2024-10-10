import 'package:flutter/material.dart';

class StreamDocument extends StatelessWidget {
  const StreamDocument({
    required this.stream,
    required this.itemBuilder,
    super.key,
  });

  final Stream<Map<String, dynamic>?>
      stream; // Stream dari Supabase, mungkin null jika dokumen tidak ada
  final Function(Map<String, dynamic> item) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Map<String, dynamic>?>(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return const Text('Error');
        }
        if (!snapshot.hasData || snapshot.data == null) {
          return const Text('No Data');
        }
        final item = snapshot.data!;
        return itemBuilder(item);
      },
    );
  }
}
