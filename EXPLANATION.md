# Movie App Additional Explanations

## 1. UI/UX Design
This application essentially consists of just three pages: home, detail, and favorite. I chose this approach for the sake of simplicity and to save development time.

## a. Movie Card
Each movie card displays four key pieces of information: the poster image, title, overview, and release date. I included these because they are essential and help keep the information clear and concise. Unlike most movie apps that typically show only the poster, I designed the layout to be both distinctive and informative, aiming to stand out while providing more useful content at a glance.

## b. Favorite Floating Action Button
The favorite button is designed as a floating action button to make it easily noticeable without interfering with the main content.

## 2. Caching (Image Caching)

One of the caching techniques I applied is using packages like `cached_network_image` to prevent re-downloading images.
You can find its implementation in `movie_widget.dart`, `favorite_widget.dart`, and `detail_page.dart`

```dart
  CachedNetworkImage(
width: 88.ds,
height: 88.ds,
imageUrl: movie.urlPoster,
imageBuilder:
(context, imageProvider) => Container(
width: 88.ds,
height: 88.ds,
decoration: BoxDecoration(
borderRadius: ThemeBorderCircular.ba12,
image: DecorationImage(
image: imageProvider,
fit: BoxFit.cover,
),
),
),
placeholder:
(context, url) =>
CircularProgressIndicator(padding: ThemePadding.pa20),
errorWidget: (context, url, error) => Icon(Icons.error),
)
```
## 3. Memory Management
Several practices that i used to prevent memory leaks or reduce unused memory:

### a. Dispose Resources Properly
Always dispose of controllers, animations, streams, or timers in dispose() for example in `home_page.dart`:
```dart
  GetX(
init: _moviesController,
didUpdateWidget: (old, newState) {
_scrollController.addListener(_scrollListener);
},
dispose: (state) {
_scrollController.removeListener(_scrollListener);
_searchController.dispose();
},
```
### b. Use Stateless Widgets When Possible
I used StatelessWidget for widgets that do not require state management, such as `movie_widget.dart` and `favorite_widget.dart`

### c. Use ListView.builder for Large Lists
I used `ListView.builder` in `home_page.dart` to efficiently render large lists of movies, which only builds visible items and reduces memory usage.

```dart
ListView.builder(
controller: _scrollController,
itemCount: _moviesController.movies.length,
itemBuilder: (context, index) {
final movie = _moviesController.movies[index];
return MovieWidget(movie: movie);
},
)
```


