# Quiz App

First Course Project for the Device-Agnostic Design Course.

## Description

The project is a simple quiz app that allows the user to

- add and edit questions
- view questions added
- take a quiz, i.e. answering questions in random order and see result of question
- view statistics

## Instructions

The app starts on the home page, which shows buttons to the main pages of the app, i.e. Quiz, Edit and Statistics.

First, the user should add questions to the app by navigating to the "Edit" page using e.g. the navigation bar (either on the side on bottom, depending on screen size).

There, the user is shown the list of questions added to the app, if any, and a button "Add New Question" for adding a new question.

Clicking the button opens a page with a form for adding a new question. It has fields for the question itself, 3 mandatory answer options, and a radio group for selecting which of the three options is the correct one. Clicking "Add question" adds the question and the user is taken back to the previous screen with the list of questions, showing also the new question.

With the question list, the user can either edit a question or delete a question using a the buttons after the question tile. Pressing the rubbish bin icon deleletes the question and the pen icon opens the same editor page, but now with the form prefilled with the exiting details. There, the user can change those details and then press "Save Changes" to save the changes.

With questions added, the user can now take a quiz. This happens by navigating to the Quiz page, using the navigation bar.
There, the user is shown first a screen indicating how many questions there are and a button for starting the quiz.

In the quiz, the user is shown a question and a list of answer options. The user chooses an option by pressing it, and then the user is shown whether the answer was correct or not. There are then also buttons for either going to another question or returning.

Finally, the user can go to the statistics page, using once again the navigation bar. There the user is shown various statistics related to the questions and answers.

## Project requirements

Requirements for the project and explanations on how the requirements have been fulfilled.

- The application idea is clear, the application has a clear purpose, and the application is easy to use.

Done.

The app is intuitive and simple to use with a clear purpose.

- The application is responsive. There are at least two breakpoints that influence the layout (e.g. mobile and tablet). In addition to the breakpoints, the application features a maximum width that is used to limit the width of the shown content on devices with a high resolution.

Done.

The app features two breakpoints and three layouts based on the size. This can for example be seen on the statistics page, where the layout grid changes based on width. Additionally, the navigation bar is a bottom bar on mobile and a navigation rail on tablet/desktop, where it is either expanded or not, based on width. The application also features a max width that limits the whole app to a certain width if the screen is too wide, and only uses the middle of the screen.

- The application has a form for entering information, and the application remembers (at least some of) the entered information between application restarts.

Done.

The application has the form for adding and editing a question that features multiple fields and a radio group.

All questions and answers are saved to the device using Hive, so the applications remembers those.

- Data entered through the form can be interacted with in some way, and the application has the functionality for showing statistics based on the data.

Done.

The questions created using the form can be interacted with by answering the questions. The user can take a quiz, which shows the question and the answer options, and then can choose an option, and then the user is shown if the answer was correct.

There is also a page for statistics, which show information based on the data, such as how many questions and answers there are, how many of the answers have been correct/incorrect, and how many questions there are that the user has been able to solve (i.e. answer correctly at least once).

- The application consists of a main screen and at least three distinct screens that can be navigated into in some way. At least one of the screens uses path variables that influence the shown content. The navigation is intuitive.

Done.

There is the home/main screen, quiz screen, viewing questions screen, adding/editing screen, and the statistics screen, so more than three distinct screen.

The edit path uses a path variable `/edit/:id`. When the user edits a question, they are taken to `/edit/:id` where `id` is the id of the question. The path variable determines, which question is being edited and which question's exiting information is shown to the user.

Navigation is intuitive and happens using the main navigation bar and clear and descriptive buttons.

- The application has been deployed to an online location, and the online location is shared in the project documentation. When accessing the online location with a modern web browser, the application can be used.

Done.

URL can be found above. The application can be used there.
