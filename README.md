# **PAC-MAN Assembly Project**

## **Overview**

This project is a recreation of the classic **PAC-MAN** game, developed entirely in **Assembly language**. It demonstrates the use of low-level programming concepts, sound integration, and graphical representation in a console environment.

The project is structured to run on **Windows**, leveraging **MASM** (Microsoft Macro Assembler) for compilation and execution.

---

## **Features**

- 🎮 **Game Levels**: Includes multiple levels with increasing difficulty.
- 👾 **Dynamic Gameplay**: Features ghosts, coins, and other elements like fruits and portals.
- 🏆 **Score Tracking**: Keeps track of the player's score and lives throughout the game.
- 🎵 **Custom Sounds**: Unique sound effects for game events (e.g., starting the game, eating coins, and game over).

---

## **Use of Irvine32 Library**

This project makes extensive use of the **Irvine32 library**, simplifying many common tasks in Assembly programming. Below are some of its uses:

1. **Sound Integration**:
   - The `PlaySound` function is used for playing custom sound effects, such as `start.wav`, `waka.wav`, and `DEATH.wav`.

2. **File Handling**:
   - The `Create_File` procedure uses Irvine32's file I/O functions to create and manage the `Scores.txt` file for storing game scores.

3. **Console Control**:
   - Functions like `SetConsoleTitle`, `Clrscr`, and `Gotoxy` are used for manipulating the console, including setting the title, clearing the screen, and positioning the cursor.

4. **Text Output**:
   - The `WriteString` and `WriteChar` functions are extensively used to display text on the screen, including game titles, menus, instructions, and score updates.

The **Irvine32 library** significantly simplifies the development of this Assembly project by providing high-level abstractions for these tasks, enabling a focus on game logic and design.

---

## **Project Structure**

The project directory contains the following key files:

- 📜 **`I222126_A_PROJECT.asm`**: The main Assembly code for the game. It includes the game logic, level design, and sound integration.
- 💻 **`I222126_A_PROJECT.vcxproj`**: A Visual Studio project file for building the game using MASM.
- 🎶 **Sound Files**: `.wav` files used in the game, such as:
  - `START.wav`
  - `DEATH.wav`
  - `WAKA.wav`
- 🗂️ **`Scores.txt`**: A placeholder file for storing game scores.

---

## **How to Run**

### **Prerequisites**

- **MASM** (Microsoft Macro Assembler) installed on your system.
- A **Windows environment** with Visual Studio set up for MASM integration.
- **Irvine32 Library**: Ensure the Irvine32 library is installed and configured on your system. You can download it [here](http://asmirvine.com).

### **Steps**

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/AliHamzaAzam/pacman_assembly.git
   ```
2. Open the `I222126_A_PROJECT.vcxproj` in **Visual Studio**.
3. Verify that the **Irvine32 library** is correctly installed and referenced in the project.
4. Build the project using the **Debug/Release** configuration.
5. Run the generated executable to play the game.

---

## **Gameplay Instructions**

- **Controls**: Use the `W`, `A`, `S`, `D` keys to move PAC-MAN.
- **Objective**: Collect all the coins while avoiding ghosts.
- **Pause**: Press `P` to pause the game.
- **Levels**: Progress through levels by collecting all coins in the current level.

---

## **Acknowledgements**

This project is developed as a demonstration of **Assembly language** capabilities and is not intended for commercial use. It is inspired by the original **PAC-MAN** game.
