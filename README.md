# RoboticsInfrastructure

Robots and tools useful for us and not included in the official ROS or Gazebo packages.

## How to contribute

**First of all** you have to know the infrastructure where you will develop your code:

- Gazebo version,
- ROS version
- Python version (if you develop in Python).

## How to add a new universe

To create the entry in **database/universes.sql**. This can be achieved in 2 ways, changing it directly on the database or using Django Web Admin:

1) Launch the docker as normal.
2) Access <http://127.0.0.1:7164/admin/> on a browser and log in with "user" and "pass".
3) Click on "add exercise" and fill the required fields specified below.
4) Open a shell in the universe_db docker: ```docker exec -it universe_db bash```
5) Dump the changes using ```./scripts/saveDb.sh```

A universe entry in the database must include the following data:

- ```name```: name to display on the universe list
- ```launch_file_path```: path to the launcher inside the docker. The Launcher folder is found in **/opt/jderobot/Launchers**.
- ```ros_version```: must be either **ROS1** or **ROS2**.
- ```visualization```: type of visualization, must be one of the following: **bt_studio**, **console**, **gazebo_gra**, **gazebo_rae**, **physic_gra** or **physic_rae**.
- ```world```: type of world, must be one of the following: **gazebo**, **drones** or **physical**.
