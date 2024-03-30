# Group 5


# Contents
[1. Team](#team)

[2. Introduction](#intro)

[3. Requirements](#requirements)

[4. Design](#design)

[5. Implementation](#imp)





<h2 id="team">Team</h2>


| Name         | E-mail           | Github  |
| ------------- |:-------------:| :----:|
Ming Liu | yi23835@bristol.uk | VegetableBirdB
Quillan Liu | zp23409@bristol.ac.uk | Quiilan-Liu
Jan Phillips | ls23767@bristol.ac.uk | ZathrasXI
Hamza Boufous | ij23594@bristol.ac.uk | hamzamboufousm
Kisshan Sridhar | bg23463@bristol.ac.uk | kisshan-s



<h2 id="intro">Introduction</h2>
<h2 id="requirements">Requirements</h2>
This section relates to the requirements of our game, where we explore the essential parts needed in our game to provide the best use-case for the users. Through the creation of use-case diagrams and user stories, and the exploration of early-stage design and the ideation process, we finalised the acceptance criteria for a finished project. 

### Use Case Diagram

![alt text](https://github.com/UoB-COMSM0110/2024-group-5/blob/develop/docs/use-case-diagram.png)






Overall, looking at the game through the lens of different types of users allowed us to uncover new features that were required, as well as ascertain which of our ideas would provide the most improvement to the experience of a certain user without hindering the experiences of other users, and therefore, has been crucial in the development of our game.

//use html tags to make links work (markdown not interpreting normlal links properly)



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
  distinction to be made between moveable and static entities.

Importantly, the creation of the class diagram itself provided clarity on the architecture. Creating the diagram involved thinking about multiplicity in class relationships, as well as inheritance and polymorphism, which allowed us to streamline our ideas. In addition to this, the diagram served as an effective communication tool amongst our team, and facilitated a shared understanding of the game’s overall design and structure, so everyone knew how the system worked.

Using the class diagram provided a clear and organised visual representation of the game’s architecture, making very complex relationships between classes more understandable. This proved invaluable when it came to development. Most notably, the diagram acted as a blueprint for the development process, guiding how we implemented our classes, their methods, and cross-class interactions.

The structure lended itself easily to modification, by identifying the core classes like `MovedObject` and `FixedObject` early, we were able to build upon and extend those classes into more specialised ones with specific responsibilities. The addition and removal of elements such as  weapons became easy to do without significant overhaul of the system due to the way each class was designed.

An example of the flexibility of the architecture lies in the `Enemy` system. When we first played the game, we found there was a lot of screen clutter because of the number of different enemies. The use of an Enemy subclass, where special enemy types can inherit from, allowed us to remove unnecessary classes without affecting the other enemy types.

A big challenge design was to balance the need for a comprehensive design (capturing all the necessary details of the game’s classes) with simplicity. Desigining our classes in a way where we specifiy a broad subclass (like MoveObject), and extend it further from there, we were able to create something that was interpretable by all members.



<h2 id="imp">Implementation</h2>
