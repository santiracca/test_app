import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:test_app/features/home/controllers/home_view_controller.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewState = ref.watch(homeViewProvider);

    useEffect(() {
      ref.read(homeViewProvider).getUser();
      return;
    }, []);
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: ref.read(homeViewProvider).navigateToProfilePage,
        child: const Icon(Icons.arrow_forward_ios),
      ),
      body: Center(
        child: homeViewState.isLoading
            ? CircularProgressIndicator()
            : Text("Soy ${homeViewState.user!.name}"),
      ),
    );
  }
}
