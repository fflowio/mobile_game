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

Run the project. There isn't much to see yet, that's because you will be coding it in the next steps.
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

   1.3 Check it's all working

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

@override means there's code inherited from flutter that does things for you, for example the
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

2. Choose a name

Find this line in the build() method:
```
title: const Text("My Game")
```
  2.1 Change "My Game" to your chosen name for the game

As soon as you save, you should see the browser now shows your chosen name.

Congratulations, you've just written your first line of code!

### Background color

  2.2 Choose a background color for your game

Find this line in the game() method:

```
color: Colors.deepPurple,
```

   2.2.1 Change Colors.deepPurple to Colors.green
   2.2.2 Change it again, from Colors.green to Colors.deepOrange

Did you notice anything while you were typing? Your IDE started helping you, by telling you what 
colours it knows about.

Try a few different colours.

We're using dark mode for this app, which means it will have white text, so it's best to use a dark 
background.

### Comments

  2.3 Comments

    2.3.1 Comment out the color line, like this:

```
// color: Colors.purple,
```

All programming languages have a way of writing comments, usually so that you can explain what's
happening to other developers. Comments are also useful to remove some code temporarily.

What happened when you commented the color line?

Keep it commented for now, so that the page is plain black. We're about to start putting content on 
the page, and a black background will work well. You'll have a chance to add colours back later on.

## Welcome

3. Welcome

Let's start with a welcome page. 

  3.1 Add this new method inside the _GameState class

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

You'll see that nothing changes in the screen. Why not? Because, in order to run the code in a 
method, you need to call it.

It needs to be part of the contents of the Container in the game() method, and flutter does this
with the child keyword, which you will use in the code below.

Look in the game() method, it returns a Container. 

   3.2 Edit the previous line:
    ```constraints: const BoxConstraints(maxWidth: 450)```
   add a comma at the end so it looks like this:
   ```constraints: const BoxConstraints(maxWidth: 450),```

   3.3 Add this new line below the comma:
   ```child: welcome()```

The result should look like this!

![img_2.png](img_2.png)

## 4. Start playing

The app needs a button to get the game started.

In the welcome() method you just created

4.1 Add a start button

4.1.1 What's with all these commas?

You're using commas quite a bit in this workshop, and here's a mini explanation. 

Many programming languages, including flutter and dart, when they want to collect a list of stuff, 
do it in what they call an array. An array looks like this:

[a, b, c, d]

To add another entry in the list, you could do this:

[a, b, c, d, e]

Or, when the contents get a bit longer, and to help see where each entry starts, you can split 
the contents over different lines:

[
  apple,
  banana,
  cherry,
  dinosaur,
  elephant
]

Which is what happens with the code in this workshop! Let's do it now.

4.1.2 Add a comma

Add a comma to the last SizedBox in the welcome method, like this:

```const SizedBox(height: 50),```

If you look around, you'll see it's in a list of things inside square array brackets [ ]

4.1.3 Add a start button

```Widgets.defaultButton(resetGame, "Start")```

Your IDE will show up with an error immediately! Why? What have you done?

You've told the app to add a button with a label "Start", and when you press it, it calls a method
"resetGame". But there is no resetGame method, or not yet! Add it now.

4.1.4 Add reset game method

A new method goes inside the _GameState class, but outside any other methods. It's a good idea to
put an empty line above and below every new method, so you can see where it starts and finishes.

The order of methods doesn't matter, but it helps to keep related methods nearer to each other.
When these instructions say "near", add the new code above or below the nearby method.

Add this near the game() method.

```
void resetGame() async {
  debugPrint("Reset");
}
```
This fixes the error, and you should have a green Start button now. What happens when you press it?

4.1.5 Debug

Look at the foot of your screen, in the console. In Android Studio, make sure it's on the Run tab
(TODO VS Code)

The method doesn't do anything yet - but you know it's working, because in the Run console, you 
see the word Reset.

That's because you added a line of debug, using the flutter call debugPrint. 

Developers use debug to work out what's going on in their code, and what's going wrong. Typically,
you turn off debug statements for production users. But at the moment, you're the only person seeing
this code, and debug statements are useful. 

We'll add a couple more in the workshop. Also, any time something doesn't work, you can add your
own debugPrint output.

4.2 Start the game

Time to get the game started!

At the moment, the game() method always returns the welcome page. Let's change it to return the 
game page when the user starts it.

4.2.1 Add pageContents() 

Add a new method:

```
  Widget pageContents() {
    if (_showContents == "start") {
      return gamePage();
    } else {
      return welcome();
    }
  } 
```

The IDE will show two errors now! Can you guess why?

Your code mentions two new things, _showContents, and gamePage(), and they don't exist yet. You 
will add them next.

By the way, it's absolutely normal to see errors while you work on code. They look scary, especially
if they are bright red. This workshop shows you some on purpose so that you get used to them. And
the debugPrint you have already seen is a useful way to work out what's wrong.

4.2.2 Call the new pageContents() method

In the build() method, change the Container child so it returns pageContents() instead of welcome(),
like this:

```child: pageContents()```

The page contents don't actually change yet, because you haven't change the value of _showContents.
You'll do that next.

4.3 Manage _showContents

Flutter uses _ to mark something as private. The app already has one private method, _GameState. 
Private just means you can only call it from inside the same class. 

We use private methods and variables to stop data from leaking into other bits of the app.

Although this showContents is a private variable, we want to use it in several different methods
in this class. If you declare a variable inside a method, only that method can use it. 

We want to use showContents in several methods, so it needs to be declared outside all of them.

By convention, we add class-wide variables at the top of the class, so anyone new to the class will
see them quickly.

At the top of the (private) _GameState class, above all the methods, add this line:

```String _showContents = "welcome";```

This should fix one error, but there's still one more.

4.4 Add gamePage()

Add the gamePage method near the pageContents and welcome methods, like this:

```
Row gamePage() {
  debugPrint("Game");
  
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("Game contents go here")    
    ]
  );
}
```

All the errors should be fixed, but there are still warnings. Ignore them for now, you will fix
them soon.

4.5 _showContents logic

You have code for two different bits of content: gamePage() and welcome(). But at the moment,
you can still only see the welcome page. Which is nice, but it would be handy to see the game
page too.

How do you fix this? 

First, let's try changing the value of _showContents

4.5.1 Change _showContents 

In the resetGame() method, add this line at the bottom:

```_showContents = "start";```

But... nothing happens!

What has gone wrong?

Remember the debugPrint? It's still there, and it shows you did call the resetGame() method,
each time you click the start button. (It's a good idea to check this, sometimes the
reason code isn't working is simply that you are not calling it.)

But debug shows you did call it, and there must be a different problem. 

4.5.2 Set _showContents in state

You don't just want to the change the value of _showContents, you also want to redraw the page 
contents. In flutter, the way to get the page to redraw is to change the state. 

Change the line you just added so that it sets the value of _showContents not just as a variable, but also in 
the app state, like this:

```setState(() => _showContents = "start");```

4.5.3 Does it work?

Click the Start button again. Now it shoudl work, and you see the "Game contents go here" text.

In the rest of this workshop, when you call a method, if it doesn't exist, you get
an error. But here, there's no error, and it just starts working. But you haven't written
a setState() method. How does this happen?

Look at the top of the class, it looks like this:

```class _GameState extends State<Game> {```

The State class you are extending includes the setState() method, which is why you don't need to 
build it. Someone else already built and supplied it to us!

It's called inheritance - you inherited the setState method from the parent State class.

This is why inheritance is so powerful. It means you can reuse your own or someone else's code.

5. Game page

Let's get some contents in the game page.

5.1 cards to choose

5.1.1 Call cardsToChoose

In the pageContents() method, change the Text line to call cardsToChoose()

    ```cardsToChoose()```

5.1.2 Implement cardsToChoose

  Near the pageContents() method, add a new cardsToChoose() method

```
  Column cardsToChoose() {
    return Column(
      children: [
        ImageHelpers.randomPictureLink(selectCard),
        const SizedBox(height: 10),
        ImageHelpers.randomPictureLink(selectCard),
        const SizedBox(height: 10),
        ImageHelpers.randomPictureLink(selectCard)
      ]
    );
  }

```
Ooops, the errors are just getting worse! You fixed the cardsToChoose() error, but now there are
three selectCard errors instead. 

Take a quick look in the image_helpers.dart file at the randomPictureLink method. A helpful
comment at the top says you need to provide a selectCard method. You'd better do that now!

5.2 selectCard

Add the selectCard() method now, near the cardsToChoose() method

```
selectCard(String cardName) {
  debugPrint("Select card " + cardName);
}
```

5.3 Does it work?

Your app should look like this now!

![img_3.png](img_3.png)

Remember the image generator is random, so your images will be different. But the layout should
be the same as this screenshot.

Look in the run tab for helpful debug, you should see a message like this:

"Select card assets/images/ImageName.svg"

The images are all in the assets/images folder. Thanks and credits to https://storyset.com

6. Game logic

6.1 

