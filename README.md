# Group 5


# Contents
[1. Team](#team)

[2. Introduction](#intro)

[3. Requirements](#requirements)

[4. Design](#design)

[5. Implementation](#imp)

[6. Evaluation](#eval)




//*use html tags to make links work* (markdown not interpreting normal links properly)


<h2 id="team">Team</h2>


| Name         | E-mail           | Github  |
| ------------- |:-------------:| :----:|
Hamza Boufous | ij23594@bristol.ac.uk | hamzamboufousm
Ming Liu | yi23835@bristol.uk | VegetableBirdB
Quillan Liu | zp23409@bristol.ac.uk | Quiilan-Liu
Jan Phillips | ls23767@bristol.ac.uk | ZathrasXI
Kisshan Sridhar | bg23463@bristol.ac.uk | kisshan-s



<h2 id="intro">Introduction</h2>
When we first started to think about what kind of game we wanted, we found that we had lots of ideas, and we needed to simplify our choices. The games that we thought would be viable turned out to have many features, a lot of which were not actually necessary. This caused us to turn our focus onto games that were simpler to produce but could be evolved to make a more entertaining product.

After sharing ideas for simpler games as a group, we settled on a game modelled after the popular flash game “copter”, which we believed would be much more viable to produce, as well as being a sort of “blank slate”, upon which that we could incorporate many new features and twists that would make the game much more enjoyable and interesting to play.





<h2 id="requirements">Requirements</h2>
This section relates to the requirements of our game, where we explore the essential parts needed in our game to provide the best use-case for the users. Through the creation of use-case diagrams and user stories, and the exploration of early-stage design and the ideation process, we finalised the acceptance criteria for a finished project. 

### Use Case Diagram

![alt text](https://github.com/UoB-COMSM0110/2024-group-5/blob/develop/docs/use-case-diagram.png)

The figure above shows our use-case diagram. We already had many ideas about what we could add into the game and what we would like to do, but we were unsure which ones to go ahead with. By pausing and thinking about the use cases in relation to the ideas we already had for the game, we were able to obtain a much clearer understanding of what features that we had thought of would be most suitable for the game. Not only did this help us organise our ideas and have a much more focused approach to building our game, but it also helped us to prioritise our workload, as we could see from understanding the use cases which features would be most important to the users. For example, when writing the use case for a player navigating the spaceship around the map to avoid obstacles, we had questions about how to implement certain mechanics of the game. “How are we going to cause the spaceship to fall?”, “How are we going to procedurally generate the map?”. Asking these questions and looking at the game from the perspective of the player brought the most pressing matters into focus and allowed us to tailor the gameplay experience specifically for the player.

From desigining a use-case diagram, we were able to distinguish between two types of player, a regular player and an experienced player. Fortunately, the simple nature of our game means that there is little difference in the two players, bar the experienced player being able to see their previous high score from the high score menu. With this in mind, we were able to go forward with the design process and similarly ensure the game catered to any type of player. For example, we originally had a tutorial level which would play every time the game was run. While this was great for new players as it would teach them the controls in a consequence-free setting, for experienced players it would be very tiring and possibly deter them from starting a new game if they had to go through the tutorial each time. Based on that, we implemented a simple panel which explained the controls that would show at the start of each game. The player could simply click to begin the game from then on. This was a non-intrusive way to showcase the controls and could be shown to both player types.

### User Stories
The creation of user stories in tandem with use-cases further bolstered our understanding of what features our game required, and in turn, which of our ideas were unnecessary for the final implementation. The user stories are as follows:

##### As a Player:
> I want to be able to open the game just by clicking on it.

> I want to be able to start the game by clicking Start Game.

> I want to be able to save my score.

> I want to move the spaceship using mouse left click.

> I want to be able to unlock new maps.

> I want to be able to view the controls.

> I want to be able to adjust volume.

> I want to be able to set the difficulty before I start the game.

> I want to be able to enter my name, see my score, and save my details when the game ends.

##### As an Experienced Player:

> I want to be able to view my previous high scores.

> I want to receive a ‘congratulations’ message for setting a new high score.

> I want to be able to unlock new enemies.

> I want to be able to unlock new weapons.

By delineating user actions, we gained insight into how our game mechanics should function in practice, enabling us to make more informed decisions on which of our ideas we should pursue and develop further. For example, it became clear that we should focus our efforts on core gameplay mechanics first, such as responsive controls. This allowed us to work efficiently and avoid wasting time on features that weren’t necessary. 

We were also able to gain a better understanding of the scope of the project. Again, helping us to avoid wasting time on ideas that weren’t feasible, the fact that we weren’t overcommitting to any one feature meant that we had streamlined ideas, and a project that could be completed within the time we had.

Overall, looking at the game through the lens of different types of users allowed us to uncover new features that were required, as well as ascertain which of our ideas would provide the most improvement to the experience of a certain user without hindering the experiences of other users, and therefore, has been crucial in the development of our game.




<h2 id="design">Design</h2>
This section explores the design aspects of our game. Thinking about system architecture, creating class and behaviour diagrams, and drawing on the previous information we learned from thinking about requirements, provided a roadmap for development. This ensured we can stay on track with our goals and ensure that the final product is able to meet the intended requirements.

### System Architecture
Reflecting on our game system’s core design, it was clear that the utilisation of an Object-Oriented Architecture (OOA) was incredibly useful in shaping the collaborative development process. The inherent benefit of OOA is in its ability to provide clear and structured organisation of classes, which assuaged the time wasted in team discussions on clarification of systems (Herbsleb, 2011). On top of helping to streamline collaboration, OOA also allowed team members to focus on their own tasks without affecting the work of others. 

Furthermore, its synergy with the agile development style is of great benefit, as it allowed members to make incremental enhancements to the code. The modular nature of OOA allows for the iterative and adaptive style of development embodied by the agile process (Beck, 2001), which allowed us to address challenges as and when they appeared.

### Class Diagram

![alt text](https://github.com/UoB-COMSM0110/2024-group-5/blob/develop/docs/class-diagram.png?raw=true)

The figure above illustrates the high-level class diagram for the game system. The main classes are `FixedObject`, `MoveObject`, and `Map`. Each encapsulating specific functionalities and attributes. Relationships between classes, such as associations and dependencies, are depicted to illustrate the interactions between objects.

#### Major Classes

+ *Spaceship*: represents the players spaceship, which will be equipped with health points and weapons. It has a central role in gameplay, as evidenced by the 1..1 relationship with the Player. It is also part of a composition relationship with an array of weapon objects.
+ *Enemy*: Abstracts various enemy types in the game, which can be extended into specialist enemy types.
+ *Map*, *Panel*, and *Obstacle*: Concerned with the game’s environment, UI, and difficulty, respectively.
  - `Map` creates moveable map objects.
  - `Panel` displays scores and statistics.
  - `Obstacle` checks for player collisions.
+ *MoveObject* and *FixedObject* - these are two main base classes for all objects within the game, and allows for the
  distinction to be made between moveable and static entities.\

Importantly, the creation of the class diagram itself provided clarity on the architecture. Creating the diagram involved thinking about multiplicity in class relationships, as well as inheritance and polymorphism, which allowed us to streamline our ideas. In addition to this, the diagram served as an effective communication tool amongst our team, and facilitated a shared understanding of the game’s overall design and structure, so everyone knew how the system worked.

Using the class diagram provided a clear and organised visual representation of the game’s architecture, making very complex relationships between classes more understandable. This proved invaluable when it came to development. Most notably, the diagram acted as a blueprint for the development process, guiding how we implemented our classes, their methods, and cross-class interactions.

The structure lended itself easily to modification, by identifying the core classes like `MovedObject` and `FixedObject` early, we were able to build upon and extend those classes into more specialised ones with specific responsibilities. The addition and removal of elements such as  weapons became easy to do without significant overhaul of the system due to the way each class was designed.

An example of the flexibility of the architecture lies in the `Enemy` system. When we first played the game, we found there was a lot of screen clutter because of the number of different enemies. The use of an `Enemy` subclass, where special enemy types can inherit from, allowed us to remove unnecessary classes without affecting the other enemy types.

A big challenge design was to balance the need for a comprehensive design (capturing all the necessary details of the game’s classes) with simplicity. Desigining our classes in a way where we specifiy a broad subclass (like `MoveObject`), and extend it further from there, we were able to create something that was interpretable by all members.



<h2 id="imp">Implementation</h2>

<h2 id="eval">Evaluation</h2>

This is the evaluations section, where we go through quantitative and qualitative evaluations, which we have used to make our game better. Here, we also describe the different methods of testing we employed in our code to ensure it was in working order.\

### Quantitative Evaluation: System Usability Scale

User | Lvl 1 | Lvl 2
---|:---:|:---:
1 | 77.5 | 70
2 | 82.5 | 85
3 | 85 | 78
4 | 90 | 88
5 | 57.5 | 52
6 | 77.5 | 80
7 | 55 | 42.5
8 | 87.5 | 82.5
9 | 57.5 | 55
10 | 72.5 | 67.5

<br>

### Qualitative Evaluation: NASA TLX Scores


User | Mental Demand | Physical Demand | Temporal Demand | Performance | Effort | Frustration | Score 
:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:
1 | 4 | 2 | 15 | 7 | 4 | 10 | 180
2 | 2 | 8 | 8 | 1 | 14 | 4 | 155
3 | 6 | 1 | 3 | 17 | 10 | 2 | 165
4 | 14 | 5 | 12 | 18 | 14 | 12 | 345
5 | 4 | 4 | 12 | 12 | 7 | 4 | 185
6 | 4 | 3 | 6 | 8 | 6 | 4 | 125
7 | 3 | 3 | 11 | 12 | 3 | 7 | 165
8 | 6 | 1 | 6 | 9 | 6 | 4 | 130
9 | 15 | 6 | 12 | 21 | 2 | 18 | 340
10 | 2 | 5 | 4 | 3 | 6 | 2 | 80

<br>

### Code Testing

#### JUnit Testing
<br>

#### Regression Testing
<br>

#### Integration Testing
<br>

#### Think Aloud Feedback

> Alex C.:
- Died quickly, first instinct was to use the keyboard to move
- Confused why spaceship shades out
- Confused about what damages health, e.g. crashing
- I really like how there are different backgrounds each time
- Not sure what these white things are (the minerals)
- I need instructions on what the aim of the game is,
- Need the boundaries need to be more clearly defined
- I don't know why I am dying
- I feel like I shouldn't die when I get to the edge of the screen
- I have to say I think it is too hard


> Alex E.:
- Sliders are an issue
- Continue button to a while to respond
- Aesthetics are pleasing
- It's not clear how to play the game, what is an obstacle, what is helpful
- It's not obvious that you can fire weapons


>Freya:
- Looking at the UI and seeing if any of the elements do anything/or if they are just graphics. e.g. is the "System Map" a button
- The UI for the setting menu is ugly
- "Continue" button when you die  doesn't do anything
- Unclear how to move
- The physics don't feel realistic, shouldn't fall in space
- Fewer hard to dodge obstacles would be good
- It needs to be clearer which obstacles are good/bad
- We need a tutorial
- Force field needs a battery/life line, it makes the game too easy if left unchecked
- Thruster needs to be on the bottom of the ship
- It's need to be more obvious what happens when crashes happen, e.g. a shake/path of spaceship changes
- Too many obstacles, the screen is too crowded


>Kelvin:
- The accuracy of the cursor is off
- Shooting too many missiles can break the computer 
- Pressing 'z' during the loading screen causes a NullPointerException


>Josh:
- Not informed
- Didn't know how the controls worked, no tutorial
- It's not clear that the top and bottom are boundaries
- Not clear you need to collect the minerals - not sure which obstacles weere good/bad
- Opening and starting the game was fine.
- There are bugs, but no helful ways to recover
- Really cool design, nice vibe :) Nice music
- Weapons are fun, lasercould be limited
- Felt like there were a few situations where there wasn't a safe route at all,
- Fun to play
- Should be an explosion when you die/crash


>Sophie:
- "I have no idea what I'm doing"
- I don't know what any of the things are
- Why there is the cursor a sword
- The aeasthetic is mis-matched, and confusing

>Pete:
- Too hard to start with 
- Fun once I understood the game
- The spaceship should have a thrust on it's underside that fires when you click to move
the ship upwards
- pressing a key during the loading screen causes the game to crash
- I think I'd prefer to use only the keyboard, e.g. spacebar to move the spaceship upwards




<br>

### Heuristic Evaluation

**How our game fares against Jaokb Nielsen's 10 general principles for interaction design.**

##### (1) Visibility of system status:
>The design should always keep users informed about what is going on, through appropriate feedback within a reasonable amount of time

Good points:
- Health points meter.
- Points tally.

Criticisms: 
- There is no tutorial, or narrative. It is not explain that you need to click to keep the spaceship from falling down, or that you have weapons, or how to fire the weapons.
- At the end of a game, the system appears unresponsive when you click "Continue".
<br>

##### (2) Match Between the System and the Real World: 
The design should speak the users' language. Use words, phrases, and concepts familiar to the user, rather than internal jargon. Follow-real world conventions, making information appear in a natural and logical order.

Good points:
- It is obvious that the goal is to navigate the spaceship through an asteroid belt. 

Criticisms:
- The text in the background image look like buttons or relevant bits of information, when they don't actually have any meaning.
- When the spaceship moves upwards there isn't a visual representation that explains how/why it is moving upwards, e.g. no thruster, or the angle or the ship doesn't tilt upwards
- The minerals that the user needs to collect look like asteroids that should be avoided
<br>

##### (3) User Control and Freedom: 
>Users often perform actions by mistake. They need a clearly marked "emergency exit" to leave the unwanted action without having to go through an extended process.

Good points:
- It is easy to end the game
<br>

##### (4) Consistency and Standards: 
>Users should not have to wonder whether different words, situations, or actions mean the same thing. Follow platform and industry conventions.

**Good points**:
- It is clear what each button on the main menu does

Criticisms:
- Some areas of the background image/gif look like they are buttons, or they have meaning, or that it is possible to interact with them in some way
- It's not obvious that left click will move the spaceship upwards, as opposed to the 'up' arrow
<br>

##### (5) Error Prevention: 
>Good error messages are important, but the best designs carefully prevent problems from occurring in the first place. Either eliminate error-prone conditions, or check for them and present users with a confirmation option before they commit to the action.

Criticisms:
- During the loading screen, some people press a key because they think that will allow them to skip it. This causes the game to crash.
<br>

##### (6) Recognition rather than recall: 
>Minimize the user's memory load by making elements, actions, and options visible. The user should not have to remember information from one part of the interface to another. Information required to use the design (e.g. field labels or menu items) should be visible or easily retrievable when needed.

Good points:
- Relatively low memory load for users, it is a simple game to play, when you know how to.

Criticisms:
- Without a tutorial it is impossible to know how to play. There is no tutorial.
<br>

##### (7) Flexibility and Efficency of use: 
>Shortcuts — hidden from novice users — may speed up the interaction for the expert user so that the design can cater to both inexperienced and experienced users. Allow users to tailor frequent actions.

Good points:
- Being able to set the difficulty level before the game begins would allow experienced players to skip the easy level, which they could find tedious.
<br>

##### (8) Aesthetic and Minimalist Design: 

>Interfaces should not contain information that is irrelevant or rarely needed. Every extra unit of information in an interface competes with the relevant units of information and diminishes their relative visibility.

Criticism:
- Some areas of the background image/gif look like they are buttons, or they have meaning, or that it is possible to interact with them in some way.
<br>

##### (9) Help Users Recognize, Diagnose, and Recover from Errors: 

>Error messages should be expressed in plain language (no error codes), precisely indicate the problem, and constructively suggest a solution.

Ciritcism:
- No error messages, e.g. when pressing a key during the loading screen, when clicking on LAN battle, when you die from crashing into the top of the screen.
- No cursor to represent "loading" state, e.g. at the end of the game it takes a long time for the game to respond to a click on "Continue" button.
<br>

##### (10) Help and documentation: 
>It’s best if the system doesn’t need any additional explanation. However, it may be necessary to provide documentation to help users understand how to complete their tasks.

Good points:
- The game is simple enough that it shouldn't need documentation. All of necessary information about the game could be covered in a tutorial.
<br>

### Addressing Feedback
#Things we could do to address the criticisms raised in the user feedback

#### Adding a tutorial panel
This would resolve the following issues with users:
- Dying immediately when the game begins
- Not knowing why they are dying
- Not understanding the aim of the game
- Not knowing what each element in the game is
- Not knowing how to play
- Not knowing that you have missiles and lazers
- Knowing which obstacles are good/bad

#### Increased testing to fix bugs
- The continue button (at the end of a game) takes too long to respond
- Sliders are difficult to use
- The image for the cursor is slightly too big, which means that sometimes the user thinks they are clicking on something, but they aren't the cursor is too big.
- Shooting as many missiles as possible can cause the computer to crash.
- Pressing 'z', perhaps other keys too, during the loading screen to crash because a NullPointerException is raised and not caught
- It's not possible to turn of the shield

#### Changing Features to Enhance Gameplay
- Weapons have limited ammo (currently there is no limit)
- One weapon can destroy an alien, and the other can destroy an asteroid (must be made clear in tutorial panel which does what)
- The shield must have limited time use
- Shooting an asteroid could reveal minerals/gems/aliens
- Can use the keyboard instead of the mouse to move the spaceship

#### UI improvements
- Change the background on the main menu, the text, labels and animations are misleading
- A cleaner look for the settings menu, a couple of people said that is ugly
- The spaceship has a thruster on it's underside, which fires everytime it moves upwards/replace the spaceship with an astronaut that has a booster pack.
- Make the minerals look less like asteroids, more like gems/something attractive



