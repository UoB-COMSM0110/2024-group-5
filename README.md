# Group 5


# Contents
1. [Team](#team)  
2. [Introduction](#intro)  
3. [Requirements](#requirements)  
    1. [Use Case Diagram](#use-case-diagram)
    2. [User Stories](#user-stories)
4. [Design](#design)  
    1. [System Architecture](#system-architecture)
    2. [Class Diagram](#class-diagram)
5. [Implementation](#imp)  
6. [Evaluation](#eval)  
    1. [Quantitative Evaluation - NASA TLX](#NASA)
    2. [Qualitative Evaluation - Heuristic Evaluation](#HE)
    3. [Addressing Feedback](#addressing-feedback)
    4. [Testing](#testing)
7. [Process](#pro)  
    1. [Team Roles](#roles)
    2. [Tools Used](#tools-used)
        1. [GitHub](#git)
        2. [Pair Programming and Planning Poker](#pair-poker)

---

<h2 id="team">Team</h2>


| Name         | E-mail           | Github  |
| ------------- |:-------------:| :----:|
Hamza Boufous | ij23594@bristol.ac.uk | hamzamboufousm
Ming Liu | yi23835@bristol.uk | VegetableBirdB
Quillan Liu | zp23409@bristol.ac.uk | Quiilan-Liu
Jan Phillips | ls23767@bristol.ac.uk | ZathrasXI
Kisshan Sridhar | bg23463@bristol.ac.uk | kisshan-s


<h4>Team Photo</h4>

[!alt text](docs/IMG_1243.HEIC)

<h4>Video</h4>

Video can be found <a href="https://youtu.be/DYD5ojkcdww">here</a>




<h2 id="intro">Introduction</h2>

When we first started to think about what kind of game we wanted, we found that we had lots of ideas, and we needed to simplify our choices. The games that we thought would be viable turned out to have many features, a lot of which were not actually necessary. This caused us to turn our focus onto games that were simpler to produce but could be evolved to make a more entertaining product.

After sharing ideas for simpler games as a group, we settled on a game modelled after the popular flash game “Copter”, which we believed would be much more viable to produce, as well as being a sort of “blank slate”, upon which that we could incorporate many new features and twists that would make the game much more enjoyable and interesting to play.




Update README.md
<h2 id="requirements">Requirements</h2>

*This section relates to the requirements of our game, where we explore the essential parts needed in our game to provide the best use case for the users. Through the creation of use-case diagrams and user stories, and the exploration of early-stage design and the ideation process, we finalised the acceptance criteria for a finished project.*

<h3 id="use-case-diagram">Use Case Diagram</h3>

![alt text](docs/use-case-diagram.png)

The figure above shows our use-case diagram. We already had many ideas about what we could add to the game and what we would like to do, but we were unsure which ones to go ahead with. By pausing and thinking about the use cases in relation to the ideas we already had for the game, we were able to obtain a much clearer understanding of what features we had thought of would be most suitable for the game. Not only did this help us organise our ideas and have a much more focused approach to building our game, but it also helped us to prioritise our workload, as we could see from understanding the use cases which features would be most important to the users. For example, when writing the use case for a player navigating the spaceship around the map to avoid obstacles, we had questions about how to implement certain mechanics of the game. “How are we going to cause the spaceship to fall?”, “How are we going to procedurally generate the map?”. Asking these questions and looking at the game from the perspective of the player brought the most pressing matters into focus and allowed us to tailor the gameplay experience specifically for the player.

From designing a use-case diagram, we were able to distinguish between two types of players, a regular player and an experienced player. Fortunately, the simple nature of our game means that there is little difference in the two players, bar the experienced player being able to see their previous high score from the high score menu. With this in mind, we were able to go forward with the design process and similarly ensure the game catered to any type of player. For example, we originally had a tutorial level which would play every time the game was run. While this was great for new players as it would teach them the controls in a consequence-free setting, for experienced players it would be very tiring and possibly deter them from starting a new game if they had to go through the tutorial each time. Based on that, we implemented a simple panel which explained the controls that would show at the start of each game. The player could simply click to begin the game from then on. This was a non-intrusive way to showcase the controls and could be shown to both player types.

<h3 id="user-stories">User Stories</h3>

The creation of user stories in tandem with use-cases further bolstered our understanding of what features our game required, and in turn, which of our ideas were unnecessary for the final implementation. The user stories are as follows:

<details open>
<summary> As a Player: </summary>  


> I want to be able to open the game just by clicking on it.

> I want to be able to start the game by clicking Start Game.

> I want to be able to save my score.

> I want to move the spaceship using the mouse left click.

> I want to be able to unlock new maps.

> I want to be able to view the controls.

> I want to be able to adjust the volume.

> I want to be able to set the difficulty before I start the game.

> I want to be able to enter my name, see my score, and save my details when the game ends.

</details>

<details open>
<summary> As an Experienced Player: </summary>  


> I want to be able to view my previous high scores.

> I want to receive a ‘congratulations’ message for setting a new high score.

> I want to be able to unlock new enemies.

> I want to be able to unlock new weapons.

</details>


By delineating user actions, we gained insight into how our game mechanics should function in practice, enabling us to make more informed decisions on which of our ideas we should pursue and develop further. For example, it became clear that we should focus our efforts on core gameplay mechanics first, such as responsive controls. This allowed us to work efficiently and avoid wasting time on features that weren’t necessary. 

We were also able to gain a better understanding of the scope of the project. Again, this helped us to avoid wasting time on ideas that weren’t feasible, the fact that we weren’t overcommitting to any one feature meant that we had streamlined ideas, and a project that could be completed within the time we had.

Overall, looking at the game through the lens of different types of users allowed us to uncover new features that were required, as well as ascertain which of our ideas would provide the most improvement to the experience of a certain user without hindering the experiences of other users, and therefore, has been crucial in the development of our game.




<h2 id="design">Design</h2>

*This section explores the design aspects of our game. Thinking about system architecture, creating class and behaviour diagrams, and drawing on the previous information we learned from thinking about requirements, provided a roadmap for development. This ensured we could stay on track with our goals and ensure that the final product was able to meet the intended requirements.*

<h3 id="system-architecture">System Architecture</h3>

Reflecting on our game system’s core design, it was clear that the utilisation of an Object-Oriented Architecture (OOA) was incredibly useful in shaping the collaborative development process. The inherent benefit of OOA is in its ability to provide clear and structured organisation of classes, which assuaged the time wasted in team discussions on clarification of systems [^8]. On top of helping to streamline collaboration, OOA also allowed team members to focus on their own tasks without affecting the work of others. 

Furthermore, its synergy with the agile development style is of great benefit, as it allows members to make incremental enhancements to the code. The modular nature of OOA allows for the iterative and adaptive style of development embodied by the agile process [^9], which allowed us to address challenges as and when they appeared.

<h3 id="class-diagram">Class Diagram</h3>

![alt text](docs/class-diagram.png)

The figure above illustrates the high-level class diagram for the game system. The main classes are `FixedObject`, `MoveObject`, and `Map`. Each encapsulates specific functionalities and attributes. Relationships between classes, such as associations and dependencies, are depicted to illustrate the interactions between objects.

#### Major Classes

+ `Spaceship`: represents the player's spaceship, which will be equipped with health points and weapons. It has a central role in gameplay, as evidenced by the 1..1 relationship with the `Player`. It is also part of a composition relationship with an array of weapon objects.
+ `Enemy`: Abstracts various enemy types in the game, which can be extended into specialist enemy types.alt text
+ `Map`, *Panel*, and *Obstacle*: Concerned with the game’s environment, UI, and difficulty, respectively.
  - `Map` creates moveable map objects.
  - `Panel` displays scores and statistics.
  - `Obstacle` checks for player collisions.
+ `MoveObject` and `FixedObject` - these are two main base classes for all objects within the game and allow for the distinction to be made between moveable and static entities.

Importantly, the creation of the class diagram itself provided clarity on the architecture. Creating the diagram involved thinking about multiplicity in class relationships, as well as inheritance and polymorphism, which allowed us to streamline our ideas. In addition to this, the diagram served as an effective communication tool amongst our team and facilitated a shared understanding of the game’s overall design and structure, so everyone knew how the system worked.

Using the class diagram provided a clear and organised visual representation of the game’s architecture, making very complex relationships between classes more understandable. This proved invaluable when it came to development. Most notably, the diagram acted as a blueprint for the development process, guiding how we implemented our classes, their methods, and cross-class interactions.

The structure lent itself easily to modification, by identifying the core classes like `MovedObject` and `FixedObject` early, we were able to build upon and extend those classes into more specialised ones with specific responsibilities. The addition and removal of elements such as  weapons became easy to do without a significant overhaul of the system due to the way each class was designed.

An example of the flexibility of the architecture lies in the `Enemy` system. When we first played the game, we found there was a lot of screen clutter because of the number of different enemies. The use of an `Enemy` subclass, where special enemy types can inherit from, allowed us to remove unnecessary classes without affecting the other enemy types.

A big challenge design was to balance the need for a comprehensive design (capturing all the necessary details of the game’s classes) with simplicity. By designing our classes in a way where we specify a broad subclass (like `MoveObject`), and extend it further from there, we were able to create something interpretable by all members.



<h2 id="imp">Implementation</h2>  

Our game has many elements that move around the screen. We realised early on in the development process that it makes sense to have an object that stores all of the necessary data for moving an element around the game screen. This led to us creating `MoveObject`, it has attributes and methods for accessing co-ordinates, the value for speed, and the element’s image.

#### Challenge 1: Appropriate level of difficulty

We learned from the Think Aloud user feedback session that our game was:

1) too hard for first-time players

2) a couple of people said that it was too easy after you had become comfortable with the controls.

We implemented 2 solutions to address this feedback.

1) We created a tutorial that explains how to move the spaceship, the aim of the game, how to score points, and you can die. After completing this we asked classmates and friends who hadn’t played the game yet, to try it. Their feedback showed an improvement that we were satisfied with.

2) Create a system that gradually increases the difficulty of the game. Every 30 seconds various values are adjusted to make the game play more challenging.. There are many aspects of the game that when altered will increase or decrease the difficulty of the game:

- Health points.
- The speed that the enemy UFOs fly at you.
- The speed of the asteroid belts.
- The size of the space between the asteroid belts/the size of the space that you fly within.

We found that if we adjusted all of these aspects every 30 seconds then the game became too challenging too quickly, so we settled for a method ,`GameLevel1.increaseDifficulty()`, that at random increases 1 attribute and randomly adjusts the gap between the asteroid belts.

#### Challenge 2:

Processing does not have in-built support for when multiple keys are pressed at the same time. However, we needed this functionality in order to address a piece of user feedback - that it would be better if players could move the spaceship using the keyboard instead of the mouse. Initially this seemed like a straightforward feature to implement because the method for moving the spaceship was triggered by the `mousePressed` in-built boolean variable. We thought we could pass `keyPressed && key == ‘ ‘` into the `move()` method and this would be the completion of implementing this feature. Though this did move the spaceship, we discovered during testing that the spaceship would start falling whenever you pressed another key, e.g. to shoot a missile or use the shield, at the same time as moving the spaceship. This is because Processing only registers one key press at a time, and the most recent key press has precedence. There are a few complex solutions to this on Stack Overflow and the Processing forum, but in the end we found a simple solution to this problem - using a Hashmap to track the current key presses. Every time a key is pressed, the ASCII code for the key is added to the Hashmap, and when the key is released the ASCII code is removed. This meant that to trigger a method based on a keypress we pass the boolean value of whether the `HashMap` contains the relevant ASCII code, e.g. to move the spaceship we do `move(keysInUse.contains(32))`.

#### Challenge 3: The asteroid belts

The idea for the asteroid belts was a result of us reviewing our notes from our first qualitative user feedback session - a few players said that the game needed clearer boundaries, and that it was not clear why the spaceship would lose a health point every time it reached the bottom or top of the screen. Given the context of the game, asteroid belts seemed like ideal frames/boundaries for the screen. The first step towards creating an asteroid belt, to move an asteroid across the screen, was simple. Though after this step we faced a few challenges:

- The asteroid belt needs to be a continuous, random sequence of asteroids.
- The depth of the asteroid belts needs to be able to change dynamically.
- Refactoring the code base so that the paths of the enemy UFOs, minerals, and mystery boxes are all within the space between the asteroid belts.

The AsteroidBelt object inherits from `MoveObject`, and it procedurally generates the belt of asteroids based on the:

- number of asteroids defined, which determines the density of the belt.
- value given for the `range` of the belt, which limits the range of the belt against the Y-axis.
- Value given for the `speed`, which defines how quickly the asteroids move across the screen.

Being able to change these values allows us to adjust the difficulty of the game.

Changing the boundaries of the screen like this meant refactoring the code for the other moving elements in the game because they always need to be within the playable space of the screen, i.e., within the gap between the asteroid belts. Prior to this the paths for all of the moving elements were limited by the constant values of `height` and `width`. Changing the implementation for all of the moving objects so that their paths could be dynamically updated so to keep them between the asteroid belts required restructuring the code base to allow for the necessary values from `AsteroidBelts` object to be passed to the other moving objects.

<h2 id="eval">Evaluation</h2>

*This is the evaluations section, where we go through quantitative and qualitative evaluations, which we have used to make our game better. Here, we also describe the different methods of testing we employed in our code to ensure it was in working order.*

<h3 id="NASA">Quantitative Evaluation: NASA TLX Scores</h3>

For our quantitative evaluation, we used the NASA Task Load Index, which has been verified to provide valuable insights into users' subjective experiences and perceived workload when interacting with the system [^3]. In the interest of obtaining reliable data, we selected 10 users to fill out a [provided TLX form](docs/TLXScale.pdf) [^4]. We decided to use the **raw scores** rather than the weighted scores as it has a similar correlation, but are easier to analyse and more time-efficient [^5]. The TLX data can be found [here](docs/NASA_TLX.md).  The first level is our game's default easy mode (aimed at beginners) and the second level is our harder level for more experienced players:

<br>

![alt text](docs/tlxFINAL.png)

<br>  


Once we obtained the data, we performed a Wilcoxon signed-rank test using [this calculator](https://www.statology.org/wilcoxon-signed-rank-test-calculator/) and obtained a W-value of 0, indicating users found that the second level had a significant increase in perceived workload compared to the first. The dimension where users experienced the most notable workload increase was in the temporal demand, which was fortunate to see, as a large contributing factor to the increase in difficulty between the easier level and the harder one is the fact that the spaceship accelerates faster in the harder level, requiring faster reactions from the player to dodge obstacles.

<br>  


<h3 id="HE">Qualitative Evaluation: Heuristic Evaluation</h3>

For our qualitative evaluation, we utilised the Nielsen Group's heuristic evaluation guide[^6]. We first asked people to familiarise themselves with Jakob Nielsen's 10 usability heuristics for software projects [^1] and once they felt confident in their understanding, we asked them to play our game and examine it based on the heuristics in [this workbook](docs/Heuristic_Evaluation_Workbook_1_Fillable.pdf) [^2]. Collecting and collating [the responses](docs/heuristic evaluation.md) allowed us to obtain three valuable pieces of information per heuristic:
- What works well
- What issues prevented us from achieving the heuristic
- Recommendations for improving our software to attain the heuristic

Based on this information, we set about incorporating the following changes:

<h3 id="addressing-feedback">Addressing Feedback</h3>

*Things we could do to address the criticisms raised in the user feedback*

#### Adding a tutorial panel
This would resolve the following issues with users:
- Dying immediately when the game begins.
- Not knowing why they are dying.
- Not understanding the aim of the game.
- Not knowing what each element in the game is.
- Not knowing how to play.
- Not knowing that you have missiles and lasers.
- Knowing which obstacles are good/bad.

#### Increased testing to fix bugs
- The continue button (at the end of a game) takes too long to respond
- Sliders are difficult to use
- The image for the cursor is slightly too big, which means that sometimes the user thinks they are clicking on something, but they aren't.
- Shooting as many missiles as possible can cause the computer to crash.
- Pressing 'z', perhaps other keys too, during the loading screen to crash because a NullPointerException is raised and not caught
- It's not possible to turn off the shield

#### Changing Features to Enhance Gameplay
- Weapons have limited ammo (currently there is no limit)
- One weapon can destroy an alien, and the other can destroy an asteroid (must be made clear in the tutorial panel which does what)
- The shield must have limited time use
- Shooting an asteroid could reveal minerals/gems/aliens
- Can use the keyboard instead of the mouse to move the spaceship

#### UI improvements
- Change the background on the main menu, the text, labels and animations are misleading
- A cleaner look for the settings menu, a couple of people said that is ugly
- The spaceship has a thruster on its underside, which fires every time it moves upwards/replaces the spaceship with an astronaut with a booster pack.
- Make the minerals look less like asteroids, and more like gems/something attractive


<h3 id = "testing">Testing</h3>

We tested our game frequently during its development lifecycle. Our Git workflow made it easy for us to test each new feature - we had a branch per feature, and before merging the branch into the main branch we would manually test it against the current set of test cases. We wouldn’t merge the branch until it was passing all test cases. After merging the branch we would test the game again, but from the main branch because usually there had been changes to the main branch between the time the feature branch was created and when it was merged. The list of test cases grew as the game developed, here is an example of the test cases that we ran:

- Can start the game.
- The game doesn’t crash when a key is pressed during the loading screen.
- Can change the difficulty.
- Can play the game.
- When I crash into an asteroid or enemy, then I lose 1 health point.
- When I lose 3 health points I die.
- When I collect a mineral, my mineral count goes up.
- When I press ‘x’ the spaceship fires a laser, and it uses the minerals as ammo.
- When I hold ‘z’ the spaceship’s shield is activated, and it uses the minerals as fuel.
- When I hit an enemy with my laser, it dies.
- When I collect a mystery box, the rogue-style store opens.
- The powers from the rogue-style store work.
- The difficulty of the game increases every 30 seconds.
- When I die I am presented with my score and it is saved in the leaderboard.
- I can view the leaderboard.

We tested all of this manually, which was time-consuming, but it did give us a good grasp of the game (and made us excellent players of the game). Often whilst testing the game we would get ideas for improvements, for example, I think our solution for how to increase the difficulty of the game was inspired by us having played the game many times.

<br>

<h2 id="pro">Process</h2>

*This is the process section, where we discuss how we organised ourselves and coordinated with the team to produce the best result we can*

<h3 id="roles">Team Roles</h3>

As mentioned in the design section, our goal was to work according to the Agile approach, emphasising consistent collaboration and iterative development. 

In our first meeting as a team, we spoke about each other's past experiences and what aspect of the project they felt most confident in. This practice led us to assign members to the roles they felt the most comfortable in, which would allow them to play on their strengths. The responsibilities were assigned as follows:

1. Ming: **Lead Developer** - Ming has experience in processing, as such, he was instrumental in bringing the rest of the team up to speed with the language and validating the work members were doing on their branches.
2. Jan: **Project Manager** - Jan has experience working in software and has first-hand experience in how teams in industry manage tasks, this allowed him to perform the responsibilities of overseeing overall progress, making sure we were meeting our goals, and organising team meetings
3. Quillan: **Developer and Creative Lead** - Quillan frequently worked with Ming on improvements to the overall game, as well as designing the game art, UX, and story.
4. Kisshan: **Vice Project Manager and Documentation Lead** - Kisshan collaborated with Jan on managing the team, ensuring the team was working according to schedule, as well as gathering data, researching, and writing the report.

We frequently held 'Chorei' style meetings [^7], with each member informing the team what they were currently working on and how long it would take. These sessions were brief and held over the phone, allowing participants to participate from any location. Due to their brevity and regularity, even absent members could stay informed, as another meeting would soon follow. By fostering awareness of each member's activities, these sessions facilitated collaboration, often resulting in overlapping efforts and smoother project execution.

<h3 id="tools-used">Tools Used</h3>

To assist us in collaboration, we employed a number of tools to ensure all members were on the same page:
- Github
    - Kanban Boards
- Pair Programming
- Planning Poker

As well as online tools, we held weekly meetings on Mondays after each workshop, which provided a valuable opportunity for face-to-face discussions and to build up rapport within the team.

<h4 id="git">GitHub</h4>

GitHub, of course, played a central role in team organisation. GitHub offered many tools to help us follow the Agile methodology, of which, the Kanban board especially was useful.

##### Kanban Board

The Kanban board was fundamental to monitoring our progress as a team. As studies have shown, Kanban's main benefits lie in work visibility, monitoring workflow, and control of project activities and tasks [^10] :  

![alt text](docs/kanban-one.png)  
*Snapshot of Kanban board*

A benefit of using GitHub to store our Kanban board as opposed to other software was the synergy with GitHub's other features. We were able to combine issues on the Kanban board with GitHub issues, which, in turn, allowed us to assign issues to members and create branches for those issues to be solved:  

![alt text](docs/kanban-two.png)  

<br>  

##### Branches and Pull Requests  

We made it a point for users to apply changes to the code in their own branch, which was named after either an issue on the Kanban board or a problem that the member was trying to solve:  


![alt text](docs/gitlog.png)
*Snapshot of our Git log.*

<br>  


We provided helpful documentation with each commit so members were aware of each other's progress. In addition, commits were tagged with comments by other members with strengths and/or recommendations so as to keep improving upon our work. Once a branch was deemed to be finished, the issue was moved from `in progress` to `in review` on the Kanban board and a pull request was made for the branch to be merged into branch `main` or `develop`. Once the code in the branch was validated to be working, it was either integrated into the final version of the game or deleted. This signified that the issue was closed, and the corresponding item was moved from `in review` to `done` on the board. Overall, usage of GitHub was vital to our performance as a team, allowing us to streamline our development process, facilitating code sharing, and ensuring project transparency.  

<br>  

Overall, utilising the Kanban board allowed us to establish a clear, visual representation of our project status. Though useful, the Kanban board did not allow us to describe how time-consuming each issue would be or to grade the difficulty of each task to implement. Therefore, we decided to use Agile practices of pair programming and planning poker to bridge the gap.


<h4 id="pair-poker">Pair Programming & Planning Poker</h4>  


##### Planning Poker  

Once we populated the Kanban with issues to be solved, we held 'planning poker' sessions at weekly meetings, as it is proven to be helpful in cementing team understanding and estimating effort for items to be implemented [^11] . We found planning poker sessions to be incredibly informative to our collective understanding of the difficulty of a task, as well as being able to solve any misunderstandings between members. One such example was when we decided on the difficulty of adding a story to the game. Half the team thought this would be very easy, as it involved writing a short backstory which required very little effort, whereas the other half considered this to be much more effortful, as it would require a new button on the main menu that players could click on to view the story, which would require a redesign of the main UI. If we were using just a Kanban board, this misunderstanding would have caused issues in team flow, but through planning poker, we were able to plan with awareness of how each subteam viewed the difficulty of a task and allocate the proper time for it.




[^1]: Nielsen, J. (1994a). Enhancing the explanatory power of usability heuristics. Proc. ACM CHI'94 Conf. (Boston, MA, April 24-28), 152-158.
[^2]: Obtained from Nielsen Norman Group. Available at: https://media.nngroup.com/media/articles/attachments/Heuristic_Evaluation_Workbook_1_Fillable.pdf
[^3]: Hart, S. G. (2006). Nasa-Task Load Index (NASA-TLX); 20 Years Later. Proceedings of the Human Factors and Ergonomics Society Annual Meeting, 50(9), 904-908. https://doi.org/10.1177/154193120605000909
[^4]: Obtained from NASA. Available at: https://humansystems.arc.nasa.gov/groups/tlx/downloads/TLXScale.pdf
[^5]: Grier, R. A. (2015). How High is High? A Meta-Analysis of NASA-TLX Global Workload Scores. Proceedings of the Human Factors and Ergonomics Society Annual Meeting, 59(1), 1727-1731. https://doi.org/10.1177/1541931215591373
[^6]: Moran, K. and Gordon, K. (2024) Heuristic evaluations: How to conduct, Nielsen Norman Group. Available at: https://www.nngroup.com/articles/how-to-conduct-a-heuristic-evaluation/
[^7]: Sarandeska, I. (2019) Chorei: A Japanese morning business routine for a Productive Day, Kanban Zone - The Lean Software to do More with Less. Available at: https://kanbanzone.com/2019/chorei-japanese-routine-for-productivity/
[^8]: Herbsleb, James D. and Audris Mockus. “An Empirical Study of Speed and Communication in Globally Distributed Software Development.” IEEE Trans. Software Eng. 29 (2003): 481-494.
[^9]: Beck, Kent L. et al. “Manifesto for Agile Software Development.” (2013).
[^10]: dos Santos, P.S.M., Beltrão, A.C., de Souza, B.P. et al. On the benefits and challenges of using kanban in software engineering: a structured synthesis study. J Softw Eng Res Dev 6, 13 (2018). https://doi.org/10.1186/s40411-018-0057-1
[^11]:Cohn, M. (2024) Planning poker: An agile estimating and planning technique, Mountain Goat Software. Available at: https://www.mountaingoatsoftware.com/agile/planning-poker
