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


*# Use HTML tags to make links work (markdown not interpreting normal links properly)*


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

After sharing ideas for simpler games as a group, we settled on a game modelled after the popular flash game “Copter”, which we believed would be much more viable to produce, as well as being a sort of “blank slate”, upon which that we could incorporate many new features and twists that would make the game much more enjoyable and interesting to play.





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

<h2 id="eval">Evaluation</h2>

*This is the evaluations section, where we go through quantitative and qualitative evaluations, which we have used to make our game better. Here, we also describe the different methods of testing we employed in our code to ensure it was in working order.*

<h3 id="NASA">Quantitative Evaluation: NASA TLX Scores</h3>

For our quantitative evaluation, we used the NASA Task Load Index, which has been verified to provide valuable insights into users' subjective experiences and perceived workload when interacting with the system [^3]. In the interest of obtaining reliable data, we selected 10 users to fill out a [provided TLX form](docs/TLXScale.pdf) [^4]. We decided to use the **raw scores** rather than the weighted scores as it has a similar correlation, but are easier to analyse and more time-efficient [^5]. The TLX data can be found [here](docs/NASA_TLX.md).  The first level is our game's default easy mode (aimed at beginners) and the second level is our harder level for more experienced players:

<br>

![alt text](docs/tlxScores.png)

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

#### JUnit Testing
<br>

#### Regression Testing
<br>

#### Integration Testing
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
5. Hamza: **???** - Unfortunately, Hamza could not be assigned a role. Having exclusively turned up to one meeting at the start of the project, we could only hazard a guess as to where his strengths lay. Though frequent attempts were made to involve him, our calls fell on deaf ears. Hamza had no involvement in the work displayed here.

While we had our responsibilities, this did not mean we were left to our own devices. We frequently held 'Chorei' style meetings [^7], with each member informing the team what they were working on at the moment and how long it would take them. These meetings were short and held over the phone so that members could attend wherever they were. The efficiency and frequency of these meetings meant that even if a member was not present for one, they would not be out of the loop for long as another meeting shortly followed. These meetings allowed us to be aware of what other members were working on; with this awareness, members were able to collaborate on tasks more easily, as there was often overlap in our responsibilities. Furthermore, we made certain that our responsibilities did not impose restrictions on us, which meant that we could divert our attention to more pressing matters when the moment arose.  

<h3 id="tools-used">Tools Used</h3>

To assist us in collaboration, we employed a number of tools to ensure all members were on the same page:
- Github
    - Kanban Boards
- Pair Programming
- Planning Poker

<h4 id="git">GitHub</h4>

GitHub, of course, played a central role in team organisation. GitHub offered many tools to help us follow the Agile methodology, of which, the Kanban board especially was useful.

##### Kanban Board

The Kanban board was fundamental to monitoring our progress as a team. As studies have shown, Kanban's main benefits lie in work visibility, monitoring workflow, and control of project activities and tasks [^10]. Utilising the Kanban board allowed us to establish a clear, visual representation of our project status:  

![alt text](docs/GitHub kanban board screenshot.png)  

<br>

A benefit of using GitHub to store our Kanban board as opposed to other software was the synergy with GitHub's other features. We were able to combine issues on the Kanban board with GitHub issues, which, in turn, allowed us to assign issues to members and create branches for those issues to be solved:  


![alt text](docs/GitHub kanban board screenshot2.png)

We made it a point for users to apply changes to the code in their own branch, which was named after either an issue on the Kanban board or a problem that the member was trying to solve:  


![alt text](docs/gitlog.png)

Snapshot of our Git log  

We provided helpful documentation with each commit so members were aware of each other's progress. In addition, commits were tagged with comments by other members with strengths and/or recommendations so as to keep improving upon our work. Once a branch was deemed to be finished, the issue was moved from `in progress` to `in review` on the Kanban board and a pull request was made for the branch to be merged into branch `main` or `develop`. Once the code in the branch was validated to be working, it was either integrated into the final version of the game or deleted. This signified that the issue was closed, and the corresponding item was moved from `in review` to `done` on the board.

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
