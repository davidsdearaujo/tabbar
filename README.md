# tabbar

Simple tabbar, rewritten using pagecontroller and facilitating manipulation of the internal PageView. 
Its layout is very similar to TabBarView, as the following image:

<img src="https://github.com/davidsdearaujo/tabbar/blob/master/screenshots/screenshot_1.png?raw=true" style="width:50%">

## Simple use
**Controller declaration**
```dart
final controller = PageController();
```

**Header**
```dart

TabbarHeader(
  controller: controller,
  tabs: [
    Tab(child: Icon(Icons.ac_unit)),
    Tab(text: "Tab 2"),
    Tab(child: Icon(Icons.access_alarm)),
  ],
),
```

**Content**
```dart
TabbarContent(
  controller: controller,
  children: <Widget>[
    Container(color: Colors.yellow),
    Container(color: Colors.red),
    Container(color: Colors.purple),
  ],
),
```

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
