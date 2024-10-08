# Mission Control - just for fun

Part of my "Build One Thing a Week" series, Mission Control is a Ruby CLI game 
where a player controls satellite launches and manages mission details to achieve 
a successful space mission.

This game simulates the process of launching a satellite into low Earth orbit
including handling unexpected events like mission aborts and spontaenous combustions.


### Installation and Set Up

- Ruby (version 3.1.2 or newer recommended)
- Bundler (for managing dependencies)

**Clone the repository**:
  ```bash
    git clone https://github.com/gia-lexa/mission_control.git
  ```

**Navigate to Folder on Your Command Line**:
  ```bash
    cd mission_control/
  ```

**Run Tests**:
  ```bash
    rspec
  ```


## How to Play

To start the game, run the following command in Terminal:
```bash
  ruby main.rb
```

- Prompts will surface to lead you through each stage of the satellite launch, Captain.
- Make critical choices at each prompt to either proceed with the mission or abort it.
- Handle unexpected events like mission aborts and spontaneous combustions (watchout!).
- View the summary of each mission attempt and choose to run another mission or exit.
