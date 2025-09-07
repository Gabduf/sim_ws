# MIT License
FROM ros:humble
SHELL ["/bin/bash", "-c"]

# -----------------------------
# Setup ROS environment in bashrc
# -----------------------------
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
RUN echo "if [ -f /sim_ws/install/setup.bash ]; then source /sim_ws/install/setup.bash; fi" >> ~/.bashrc

RUN apt-get -o Acquire::ForceIPv4=true update --fix-missing

# -----------------------------
# Install system dependencies
# -----------------------------
RUN apt-get update --fix-missing && \
    apt-get install -y git \
                       nano \
                       vim \
                       python3-pip \
                       libeigen3-dev \
                       tmux \
                       ros-humble-rviz2 \
                       ros-humble-ackermann-msgs \
                       ros-humble-nav-msgs \
                       ros-humble-sensor-msgs \
                       ros-humble-geometry-msgs \
                       ros-humble-std-msgs \
                       ros-humble-tf2 \
                       ros-humble-tf2-ros \
                       ros-humble-tf2-geometry-msgs \
                       ros-humble-navigation2 \
                       ros-humble-nav2-bringup \
                       ros-humble-xacro \
                       x11-apps  # for X11 testing

# -----------------------------
# Install Python dependencies
# -----------------------------
RUN pip3 install transforms3d gym

# -----------------------------
# Clone the custom F1TENTH Gym
# -----------------------------

# -----------------------------
# Build the ROS workspace
# -----------------------------

# -----------------------------
# Setup entrypoint
# -----------------------------
ENTRYPOINT ["/sim_ws/src/scripts/entrypoint.sh"]
CMD ["bash"]


