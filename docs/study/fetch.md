Call the `fetchAlbum()` method in either the `initState()` or `didChangeDependencies()` methods.

The `initState()` method is called exactly once and then never again. If you want to have the option of reloading the API in response to an `InheritedWidget` changing, put the call into the `didChangeDependencies()` method. See `State` for more details.****

```dart
class _MyAppState extends State<MyApp> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }
  // ···
}
```