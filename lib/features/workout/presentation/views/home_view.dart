import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:test_app/features/workout/presentation/controllers/home_view_controller.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewProvider = ref.watch(homeViewController);
    useEffect(() {
      homeViewProvider.onStartup();
    }, []);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          homeViewProvider.isLoading
              ? CircularProgressIndicator()
              : Text(homeViewProvider.wod.id.toString())
        ],
      ),
    );
  }
}
