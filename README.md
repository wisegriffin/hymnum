# Hymnum

Hymnum is a prototype of a music repertory manager designed especially for worship ministries in churches. As a christian and member of a local church who serves in the worship team myself, i have long noticed that most Brazillian churches rely on apps to organize their repertories. However, despite being really popular among musicians, these apps are not designed to be used in churches or sight-reading during worship.

Because of this, we have encountered lots of problems like:

* intrusive ads in worship environment
* desorganized repertories lists
* difficulty categorizing or searching for songs (title, author, tags)
* impossibility of transposing the ciphers offline
* limited synchronization and collaboration between ministry members
* no way to manually edit the lyrics of songs, that vary between congregations

To solve this problems in my local church and, possibly, for other churches as well, i designed the app to be fast, lightweight and focus on the real needs of church musicians:

* repertory collaboration between members of a ministry/church
* offline usage
* real time offline key transposing
* manual lyrics editing
* advanced search and song categorizing

For now, however, the app is in its minimal version, but it is structured to grow towards these objectives.

## Features already avalaible

* offline usage
* manual lyrics editing
* basic funciotionalities related to musics and repertories
* switch to dark/light theme

## Technologies & Architecture

I decided to use the Flutter framework by Google, as it is the modern standard for mobile development, has easy integration with Google services, seamless native development, and uses Dart, a safe strongly typed language.

To ensure scalability, readability and maintainability, the app is being built using MVVM + pragmatical Clean architecture.

### MVVM (Model, View, ViewModel) architecture

The app is divided in the domain layer (Model), and UI (View, ViewModel) layer.
The whole purpose of this architecture is to decople code in single responsability classes.

### Clean Architecture (implementation of Model layer)

There are lots of folders structures in the pure Clean Architecture, but as i am a solo dev, i am using only the most fundamental structure of the architecture: core, data, domain and presentation.  

To maintain the directory organized, the project is feature driven, this means the directory is organized via features, which each have its own Clean structure, data, domain and presentation related to that specific feature.
