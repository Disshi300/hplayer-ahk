# AutoHotkey Click Player

![License](https://img.shields.io/badge/license-MIT-blue.svg) 
![Version](https://img.shields.io/badge/version-1.0.2_B5.1-brightgreen.svg) 
![AutoHotkey](https://img.shields.io/badge/AutoHotkey-v1.1.33.02-blue.svg)

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [License](#license)

## Introduction
This is a **Click Player**, You feed the click data into it and it will replay it, You can choose for it to work everywhere or on a specific window, Recorder is included however not open source, You can choose to use another recorder for it.

## Features
- **Easy to Use**: Simple setup and configuration.
- **Customizable**: Adjust filters, scaling and more.
- **Lightweight**: Minimal resource usage.
- **Open Source**: Free to use and modify.

## Usage
To use the AutoHotkey Click Player, follow these steps:
1. **Download AutoHotkey V1.1**: [AutoHotkey V1.1 Download](https://www.autohotkey.com/download/ahk-install.exe)
2. **Clone this repository or download as a zip file.**:
    ```bash
    git clone https://github.com/Disshi300/hplayer-ahk.git
    ```
3. **Open the `Source.ahk` script in any text editor.**
4. **Modify the script as needed.**
5. **Save the changes and double-click the script to run it.**

## Configuration
You can customize the following parameters in the script:
- **Window Only**: Only works if the window title matches whatever you write here.
- **Force Toggle**: If you toggle the state off while still clicking, This will make sure to cut you off.
- **Hotkeys**: Assign hotkeys to start and stop, hide and show or exit.
- **Scaler**: Scales the delays in order to speed it up or slow it down.
- **Randomized Scaler**: Scales the delays in order to speed it up or slow it down but randomized between 2 values.
- **Filters**: Filter the click data to remove delays that are too high or too low, You can filter both as well.
- **Randomized Start Point**: Randomizes the start point. *(Recommended)*

## Contributing
Contributions are welcome! Please fork this repository and submit pull requests. For major changes, please open an issue first to discuss what you would like to change.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
