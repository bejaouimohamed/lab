#import "Class.typ": *


#show: ieee.with(
  title: [#text(smallcaps("Lab #4: ROS2 using RCLPY in Julia"))],
  /*
  abstract: [
    #lorem(10).
  ],
  */
  authors:
  (
    (
      name: "Mohamed Bejaoui",
      department: [Dept. of EE],
      organization: [ISET Bizerte --- Tunisia],
      profile: "bejaouimohamed",
    ),
    (
      name: "Jamila Gharbi",
      department: [Dept. of EE],
      organization: [ISET Bizerte --- Tunisia],
      profile: "Gharbijamila",
    ),
  )
  // index-terms: (""),
  // bibliography-file: "Biblio.bib",
)
= Introduction
In this report, we will explain how we have use Julia and ROS2 to create a basic ROS 2 communication setup where one node publishes messages and another node subscribes to those messages on a specified topic.
This allows for data exchange between different components of a robotic system or between multiple robotic systems.
= Creation of the publisher :
== Installation of ROS2 and writing code :
We begin first of all by sourcing our ROS2 installation by writing this command in the terminal :
```zsh
source /opt/ros/humble/setup.zsh
```
After that , we create a first julia file named *publisher* and we write this commands as shown in code below : 
#let publisher=read("../Codes/ros2/publisher.jl")
#let subscriber=read("../Codes/ros2/subscriber.jl")
#raw(publisher, lang: "julia")
This code essentially simulates a ROS 2 talker node in Julia, where it continuously publishes messages to a specific topic at a certain frequency.
== Explanation of the code :
In This part , we will explain what that code does from the begining to the end :
+ It imports the necessary modules from ROS 2 Python (rclpy and std_msgs.msg).
+ Initializes the ROS 2 runtime
+ Creates a ROS 2 node named *"my_publisher"*
+ Creates a publisher for the "infodev" topic with a message type of String.
+ Enters a loop to publish message to the topic in a range from 1 to 100.
+ Constructs the public message with the format *"Hello, ROS2 from Julia!"* where i is the current loop iteration.
+ Publishes the message to the topic.
+ Logs the published message using info .
+ Sleeps for 1 second before the next iteration
+ Cleans up by shutting down the ROS 2 runtime and destroying the node
Some of the commands can give us some informations about :
- The topic *"infodev"*
```zsh
pub  =  node.create_publisher(str.String,
"infodev", 10)```
- The name of publisher *"my_publisher"*:
```zsh
node = rclpy.create_node("my_publisher")
```
- Message published *"Hello, ROS2 from Julia!"*
```zsh
msg = str.String(data="Hello, ROS2 from Julia!
($(string(i)))")
```
= Creation of the subscriber :
== Writing code :
Now , we create a second julia file named subscriber and we write this commands as shown in code below : 
#raw(subscriber, lang: "julia")
This code creates a subscriber node in Julia that listens for messages on a specific topic in the ROS 2 system.
== Explanation of the code :
We will explain the code like we do with the first one :
- It imports the necessary ROS 2 modules (rclpy and std_msgs.msg) using PyCall and initializes the ROS 2 runtime environment.
- Creates a ROS 2 node named *"my_subscriber"*
- Defines a callback function named callback to process received messages. The function prepends *"[LISTENER] I heard: "* to the received message
- Sets up a subscription for the "infodev" topic, specifying the message type String and the callback function to handle received messages.
- Enters a loop that runs as long as the ROS 2 system is operational.
- When a message is received on the "infodev" topic, the 'callback' function is invoked to handle the message
- Once the loop exits (e.g., when the ROS 2 system shuts down), the node is destroyed to release its associated resources.
- Finally, the ROS 2 runtime environment is shut down.
without explain this command :
```zsh
node = rclpy.create_node("my_subscriber")
```
We can have the name of the subscriber which is *"my_subscriber"* 
= Running the two codes :
Firstly , we start by launching The graphical tool rqt_graph by writing down this line to let the data fow between the publisher and subscriber by link it bouth of them to a node called
“infodev” like showing figure 1
```zsh
source /opt/ros/humble/setup.zsh
rqt_graph
```
#figure(
	image("Images/rqt_graph.png", width: 100%),
	caption: "rqt_graph",
) <fig:rqt_graph>
After, opening and running the two codes "publisher.jl" and "subscriber.jl" in the correct way and we obtain this result in the terminal :
#figure(
	image("Images/pub-sub.png", width: 100%),
	caption: "Minimal publisher/subscriber in ROS2",
) <fig:pub-sub>
@fig:pub-sub shows the publication and reception of the message *_"Hello, ROS2 from Julia!"_* in this terminal. The left part of the terminal shows us the message being published, while the right part demonstrates how the message is being received and heard.
we also can have the numbers of publshing and receiving the message which is one hundred times .

