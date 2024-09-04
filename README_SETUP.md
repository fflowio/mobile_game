# mobile_game

A workshop for beginners, where you get to build your own flutter game

## About Flutter

Flutter is a programming language that runs... anywhere! But most importantly, you can run
it on your mobile phone.

In this workshop, we'll provide you with the scaffolding to write your first flutter code.

This is the setup information. If you're looking for the main workshop information, it's here: 
https://github.com/fflowio/mobile-game 

# Setup

Even though you can run Flutter on a phone (or a phone emulator), you need to work on it first.
And to work on it, you need a computer.

## Computer

You need a computer to run this workshop. This could be a desktop or a laptop. And it needs to
meet minimum capabilities, specifically, it needs to have 4 cores and at least 8GB of RAM.

Or basically, as long as it's less than around 10 years old, it should be fine to write code.

You can work with any operating system, that is, any of:

- Windows
- Linux
- MacOS

The steps and instructions are slightly different for each operating system. You should use the
one your computer comes with.

## IDE

You work with flutter in a code editor called an IDE (integrated development editor). There are
several different IDEs, and it's kind of like deciding whether to buy a Tesla, an Audi or a Toyota.
Different people prefer different car makers, but they all get you to your destination.

Flutter supports

- VSCode
- Android Studio
- Intellij

If you already know and love one of these, we recommend you choose it.

If you're new to all IDEs, we (mostly) recommend VSCode, it's the one which is most widely used 
in schools and colleges, and supports all programming languages, for example python or C.

If you think you might do mostly mobile development in future, Android Studio, is optimised for 
flutter and other mobile languages. It's also the one that works best with the mobile emulator, 
if you're in a position to use one.

## Emulator

It's nice to run the workshop with a mobile emulator. This runs on your computer and pretends to
be a mobile phone, so that you can see what the app will look like.

But, there are some difficulties with an emulator, specifically:

- the hardware requirements are more significant, ideally 8 cores and 16 GB RAM, and only more expensive computers will meet these
- you need to install Android Studio
- you need to configure hardware acceleration

All this stuff is fairly complex on any computer. On a Windows computer, it's extra difficult. It's
slightly less difficult on Mac, but you still need a few hours and a lot of patience.

Honestly, we're experienced developers, and even we find this process *really* difficult.

So, we're going to recommend you skip the emulator for this workshop, unless you have a coder friend
who can set it up for you.

## Phone

You can also potentially run this workshop on an actual mobile phone.

But, there are challenges, specifically:

### iPhone

- to run on iPhone, you need to be building on a Mac (only)
- you also need to register as an iPhone developer, plus a bunch of other config, that can take weeks

Basically, unless you already have a working phone set up for development, we don't recommend this

### Android

- to run on Android, you need to set developer mode on the phone

For safety reasons, we do not recommend this for a phone that you use every day.

The good news is, even fairly old Android should work. The official minimum spec is
Android 13 or later, or Android SDK/API 21 or later. Most phones from about 7 or 8 years
ago should work. Make sure you have updated Android to the most recent version possible.

We only recommend testing on a mobile phone if you have an old Android that you have wiped using 
factory reset.

### Browser

If you don't use an emulator or a mobile phone, where do you test your code? The answer is: in
a browser.

## Preparation

Before you start, identify:

- which operating system your computer runs (Windows, Linux, or MacOS)
- if you already have an IDE installed
- if you already have android emulator installed and configured
- if you have a suitable phone (iPhone already set up for development, or factory reset Android)

Decide:

- which IDE to use
- if you will use an emulator (probably not, unless it's already working)
- if you will connect a mobile phone (probably not, unless you have an old Android)

## Install flutter

The flutter team have instructions for the install process for Windows, Linux, and MacOS, and
for VSCode, Android Studio, .

https://docs.flutter.dev/get-started/install

If you want to try installing the emulator, the instructions follow on from installing flutter.
But if it starts to affect your mental health, stop! You can manage without.

## Check flutter doctor

Run flutter doctor and make sure that most of it is passing, especially:

- one IDE, any of VSCode, Android Studio, or Intellij
- Flutter

If VisualCode or XCode are not working, you can ignore them: they are only needed if you want to
build for Windows (VisualCode) or Apple (XCode).

## Check git command line

To check git on the command line, open a terminal or command prompt, and type 

```
git -v
```

You might have installed git already as part of the flutter instructions.

If not, there are instructions at https://github.com/git-guides/install-git

## Clone the repository

```
git clone https://github.com/fflowio/mobile-game.git
```

## IDE

Open your chosen IDE, one of:

- VSCode
- Android Studio
- Intellij

Load the mobile-game repository into it. Open up lib/views/game.dart.

If you're planning this for students, we recommend you delete lib/views/solution.dart.

# Phew!

If you have got this far, you are ready to start coding.

If you're running this workshop for others, here's a good place to stop and hand over to the
students.

## More about Flutter

If you want to find out more about flutter, the product docs are great. Here are some links to
get you started.

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)


