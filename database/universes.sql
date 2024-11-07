--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0 (Debian 17.0-1.pgdg120+1)
-- Dumped by pg_dump version 17.0 (Debian 17.0-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: universes; Type: TABLE; Schema: public; Owner: user-dev
--

CREATE TABLE public.universes (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    launch_file_path character varying(200) NOT NULL,
    ros_version character varying(4) NOT NULL,
    visualization character varying(50) NOT NULL,
    world character varying(50) NOT NULL
);


ALTER TABLE public.universes OWNER TO "user-dev";

--
-- Name: exercises_universe_id_seq; Type: SEQUENCE; Schema: public; Owner: user-dev
--

ALTER TABLE public.universes ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.exercises_universe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: universes; Type: TABLE DATA; Schema: public; Owner: user-dev
--

COPY public.universes (id, name, launch_file_path, ros_version, visualization, world) FROM stdin;
1	basic_vacuum_cleaner_ros2	/opt/jderobot/Launchers/vacuum_cleaner.launch.py	ROS2	gazebo_rae	gazebo
2	vacuum_cleaner_loc_ros2	/opt/jderobot/Launchers/vacuum_cleaner_loc.launch.py	ROS2	gazebo_rae	gazebo
3	global_navigation_ros2	/opt/jderobot/Launchers/taxi_navigator.launch.py	ROS2	gazebo_rae	gazebo
4	rescue_people_ros2	/opt/jderobot/Launchers/world.json	ROS2	gazebo_rae	drones
5	amazon_warehouse_ros2_world1	/opt/jderobot/Launchers/amazon_robot.launch.py	ROS2	gazebo_rae	gazebo
6	follow_line_default_ros2	/opt/jderobot/Launchers/simple_circuit.launch.py	ROS2	gazebo_rae	gazebo
7 	follow_line_montreal_ros2	/opt/jderobot/Launchers/montreal_circuit.launch.py	ROS2	gazebo_rae	gazebo
8	follow_person_ros2	/opt/jderobot/Launchers/follow_person.launch.py	ROS2	gazebo_rae	gazebo
9	follow_person_teleop	/opt/jderobot/Launchers/follow_person_teleop.launch.py	ROS2	gazebo_rae	gazebo
10	autoparking_simple_ackermann_ros2	/opt/jderobot/Launchers/prius_autoparking.launch.py	ROS2	gazebo_rae	gazebo
11	montecarlo_laser_loc_ros2	/opt/jderobot/Launchers/montecarlo_laser_loc.launch.py	ROS2	gazebo_rae	gazebo
12	obstacle_avoidance_ros2	/opt/jderobot/Launchers/simple_circuit_obstacles_followingcam.launch.py	ROS2	gazebo_rae	gazebo
13 	global_navigation_followingcam_ros2	/opt/jderobot/Launchers/taxi_navigator_followingcam.launch.py	ROS2	gazebo_rae	gazebo
14 	3d_reconstruction_ros2	/opt/jderobot/Launchers/3d_reconstruction.launch.py	ROS2	gazebo_rae	gazebo
15 	autoparking_battery_ackermann_ros2	/opt/jderobot/Launchers/prius_bateria.launch.py	ROS2	gazebo_rae	gazebo
16 	autoparking_gas_station_line_ackermann_ros2	/opt/jderobot/Launchers/gas_station_line_ackermann.launch.py	ROS2	gazebo_rae	gazebo
17 	autoparking_gas_station_battery_ackermann_ros2	/opt/jderobot/Launchers/gas_station_battery_ackermann.launch.py	ROS2	gazebo_rae	gazebo
18 	autoparking_gas_station_parking_ackermann_ros2	/opt/jderobot/Launchers/gas_station_parking_ackermann.launch.py	ROS2	gazebo_rae	gazebo
19 	amazon_warehouse_ros2_world1_ackermann	/opt/jderobot/Launchers/small_warehouse_with_ackermann_logistic_robot.launch.py	ROS2	gazebo_rae	gazebo
20 	amazon_warehouse_ros2_world2_ackermann	/opt/jderobot/Launchers/pallet_warehouse_with_ackermann_logistic_robot.launch.py	ROS2	gazebo_rae	gazebo
21 	amazon_warehouse_ros2_world2	/opt/jderobot/Launchers/pallet_warehouse.launch.py	ROS2	gazebo_rae	gazebo
22 	follow_line_montmelo_ros2	/opt/jderobot/Launchers/montmelo_circuit.launch.py	ROS2	gazebo_rae	gazebo
23 	follow_line_nurburgring_ros2	/opt/jderobot/Launchers/nurburgring_circuit.launch.py	ROS2	gazebo_rae	gazebo
24 	follow_line_nurburgring_ack_ros2	/opt/jderobot/Launchers/nurburgring_circuit_ackermann.launch.py	ROS2	gazebo_rae	gazebo
25 	follow_line_montmelo_ack_ros2	/opt/jderobot/Launchers/montmelo_circuit_ackermann.launch.py	ROS2	gazebo_rae	gazebo
26 	follow_line_montreal_ack_ros2	/opt/jderobot/Launchers/montreal_circuit_ackermann.launch.py	ROS2	gazebo_rae	gazebo
27 	follow_line_default_ack_ros2	/opt/jderobot/Launchers/simple_circuit_ackermann.launch.py	ROS2	gazebo_rae	gazebo
\.


--
-- Name: exercises_universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user-dev
--

SELECT pg_catalog.setval('public.exercises_universe_id_seq', 1, false);


--
-- Name: universes exercises_universes_name_key; Type: CONSTRAINT; Schema: public; Owner: user-dev
--

ALTER TABLE ONLY public.universes
    ADD CONSTRAINT exercises_universes_name_key UNIQUE (name);


--
-- Name: universes universes_pkey; Type: CONSTRAINT; Schema: public; Owner: user-dev
--

ALTER TABLE ONLY public.universes
    ADD CONSTRAINT universes_pkey PRIMARY KEY (id);


--
-- Name: exercises_universe_name_459df99a_like; Type: INDEX; Schema: public; Owner: user-dev
--

CREATE INDEX exercises_universe_name_459df99a_like ON public.universes USING btree (name varchar_pattern_ops);


--
-- PostgreSQL database dump complete
--

