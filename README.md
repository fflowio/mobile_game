# mobile_game

A workshop for beginners, where you get to build your own flutter game

## About Flutter

Flutter is a programming language that runs... anywhere! But most importantly, you can run
it on your mobile phone.

In this workshop, we'll provide you with the scaffolding to write your first flutter code. 

# Setup

Before you start, you need a working developer environment with flutter, and a copy of the code
for the workshop.

This might have been done for you, TODO how to check

If not, here is how to set up a working development environment for this workshop 
https://github.com/fflowio/mobile-game/blob/main/README_SETUP.md

# Code

When you start this workshop, you already have an IDE open. At the left-hand side is a list
of files, there are a lot. But there is good news, you can ignore most of them!

## Flutter-generated files

Flutter comes with lots of files that support the way your code works with a phone. They are 
generated for you every time you create a new flutter project. For this workshop, you don't need
to worry about them.

## Folders, files and other structure

When you write a code project, it generally ends up being quite long. You'll notice there are 
already a lot of files, and you haven't even started yet! But if all the code was in one
single file, it would look even messier.

Developers tidy and structure their code by splitting it up. It's a bit like writing a book, or
even a series of books. There's no absolute rule about where and how to split up your code, but
it's roughly like this:

| Code                | Literature   |
| ------------------- | ----------   |
| Folder / directory  | Book         |
| File                | Chapter      |
| Method / function   | Paragraph    |
| ------------------- | ----------   |

A method, also called a function, is generally related to a single thought or action, with several 
methods in a file, and several files in a folder.

In this workshop, you will work on several functions, all in the game.dart file.

## Workshop files

We have provided files which give you a framework and some useful helper functions, and a game
file where you will write your code.

They are all in the lib/ folder, as follows:

- lib/main.dart
- lib/views/game.dart [here is where you will work]
- lib/views/credits.dart
- lib/components/widgets.dart
- lib/components/image_helpers.dart

You'll find out more about them in the workshop.

## Run the blank project

Run the project. There isn't much to see yet, that's because we'll be coding it in the next steps.
But let's just see the blank project first!

### VSCode

TODO F5 instructions

### Android Studio

In Android Studio, at the top of the screen, in the middle you'll see some menus. The look like this:

![img.png](img.png)

1. Run the game
   1.1 Select run options
      1.1.1 Chrome(web) in the first menu
      1.2.2 main.dart in the second menu 

   1.2 Run
       1.2.1 Click on the green triangle next to the third menu

2. Check it's all working

You should see something like this:

![img_1.png](img_1.png)

## Coding Context

At the top of game.dart, you'll see some imports, these are helpful functions you'll need later on.

Next come two classes:

```class Game extends StatefulWidget {```
and
```class _GameState extends State<Game> {```

State is the way a mobile app remembers information between one click and the next. Without it,
everything would always go back to the beginning and start again. 

The second class, _GameState, has two methods:

TODO signatures of game() method
and
```
@override
Widget build(BuildContext context) {
```

@override means there's some stuff we inherit from flutter that does things for us, for example the
AppBar.

All your code will be written in lib/views/game.dart. We will tell you which method to use to make your
changes, or when it's a good idea to create a new method.

To find a method, look for round brackets () and the squirly brackets {} like this:

```
methodName() {
}
```

The round brackets () hold parameters, information that you will pass into the method.
The squirly brackets {} mark the beginning and end of the code that happens in the method.

Most of your code will go inside a method, that is, between { and } for a method()

Methods need to go inside a class, which also has { and }

Let's get started.

### Name

3. Choose a name

Find this line in the build() method:
```
title: const Text("My Game")
```
  3.1 Change "My Game" to your chosen name for the game

As soon as you save, you should see the browser now shows your chosen name.

Congratulations, you've just written your first line of code!

### Background color

4. Choose a background color for your game

Find this line in the game() method:

```
color: Colors.deepPurple,
```

   4.1 Change Colors.deepPurple to Colors.green
   4.2 Change Colors.green to Colors.deepOrange

Did you notice anything while you were typing? Your IDE started helping you, by telling you what 
colours it knows about.

Try a few different colours.

We're using dark mode for this app, which means it will have white text, so it's best to use a dark 
background.

### Comments

5. Comments

    5.1 Comment out the color line, like this:

```
// color: Colors.purple,
```

All programming languages have a way of writing comments, usually so that you can explain what's
happening to other developers. Comments are also useful to remove some code temporarily.

What happened when you commented the color line?

Keep it commented for now, so that the page is plain black. We're about to start putting content on 
the page, and a black background will work well. You'll have a chance to add colours back later on.

## Welcome

6. Welcome

Let's start with a welcome page. 

  6.1 Add this new method inside the _GameState class

```  
  Column welcome() {
    return Column(
      children: [
        const SizedBox(height: 50),
        ImageHelpers.getPicture("assets/images/StoryboardAmico.svg", 300),
        const SizedBox(height: 50)
      ]
    );
  }
```

You'll see that nothing changes in the screen. Why not? Because, in order to run the code in a method,
we need to call it.

We want to put it as contents of the Container in the game() method, and the way flutter does this
is with the child keyword, 

Look in the game() method, it returns a Container. 

   6.2 Edit the previous line:
    ```constraints: const BoxConstraints(maxWidth: 450)```
   add a comma at the end so it looks like this:
   ```constraints: const BoxConstraints(maxWidth: 450),```

   6.3 Add this new line below the comma:
   ```child: welcome()```

The result should look like this!

![img_2.png](img_2.png)

