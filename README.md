## Setup and Usage Guide: Xcode Development with Cursor AI & Sweetpad

This guide outlines the streamlined process for setting up Cursor AI for iOS/macOS development, leveraging the Sweetpad extension to directly build, run, and debug Xcode projects.

---

### Prerequisites

Before you begin, ensure you have the following installed on your macOS system:

* **macOS:** An Apple computer running macOS.
* **Xcode:** Download and install Xcode from the Mac App Store. Sweetpad and the underlying tools rely heavily on Xcode's capabilities.
* **Xcode Command Line Tools:** Open your Terminal and run:
    ```bash
    xcode-select --install
    ```
* **Homebrew:** If not already installed, Homebrew simplifies the installation of necessary command-line tools. Install it from [brew.sh](https://brew.sh/).

---

### Steps to Configure Cursor AI & Run Xcode Project Directly

Follow these steps for a seamless development experience:

1.  **Install Cursor**
    * Download and install the Cursor application from the [official Cursor website](https://www.cursor.sh/).

2.  **Install Essential Command-Line Tools**
    * Open your Terminal application (`Applications/Utilities/Terminal.app`).
    * Install `xcode-build-server`: This crucial tool enables Cursor to understand and interact with Xcode's build system.
        ```bash
        brew install xcode-build-server
        ```
    * Install `xcbeautify` (Highly Recommended): This utility dramatically improves the readability of Xcode build output in your terminal.
        ```bash
        brew install xcbeautify
        ```
    * Install `swiftformat` (Optional - for code formatting): If you want automated Swift code formatting, install this.
        ```bash
        brew install swiftformat
        ```

3.  **Install Essential Cursor Extensions**
    * Open Cursor.
    * Navigate to the Extensions view (click the square icon in the sidebar or press `Cmd+Shift+X`).
    * Search for and install the following extensions:
        * **Swift Language Support:** Provides core language features (syntax highlighting, completion, navigation).
        * **CodeLLDB:** Integrates the LLDB debugger, allowing you to debug your Swift code within Cursor.
        * **Sweetpad:** The primary extension for Xcode project integration, enabling direct build, run, and debug capabilities.
        * **SwiftLint (Optional):** If you use SwiftLint for code style enforcement, install this extension after installing SwiftLint via Homebrew (`brew install swiftlint`).

4.  **Open Your Xcode Project in Cursor**
    * In Cursor, go to `File` > `Open Folder...`
    * Navigate to the **root directory** of your Xcode project (the folder containing your `.xcodeproj` or `.xcworkspace` file). Select this folder and click "Open".

5.  **Generate Sweetpad's Build Server Configuration**
    * This step allows Sweetpad to properly configure itself for your specific Xcode project.
    * Open the Command Palette in Cursor: Press `Cmd+Shift+P` (macOS) or `Ctrl+Shift+P` (Windows/Linux).
    * Type "Sweetpad: Generate" and select the command: **"Sweetpad: Generate Build Server Config"**.
    * Sweetpad will create a `buildServer.json` file in your project's root, which is essential for Cursor's intelligent features (e.g., auto-completion, jump-to-definition).

6.  **Select Your Scheme and Destination**
    * After Sweetpad is configured, look for its controls in Cursor's **status bar** (at the bottom of the window).
    * Click on the **scheme selector** (e.g., "YourAppScheme") and choose the appropriate scheme for your application.
    * Click on the **destination selector** (e.g., "Generic iOS Device" or an iPhone simulator name) and select the desired simulator or connected physical device.

7.  **Build and Run Your Project Directly**
    * With your scheme and destination chosen in the status bar, locate the "Run" or "Play" button (often a triangle icon) provided by Sweetpad in the status bar.
    * Click this **"Run" button**.
    * Sweetpad will automatically initiate the build process (if needed) and then launch your application on the selected simulator or device.
    * Build output and runtime logs will appear in Cursor's integrated terminal, enhanced by `xcbeautify` for better readability.

8.  **Start Debugging (Recommended)**
    * Set breakpoints directly in your Swift code files within Cursor.
    * When you run your app using Sweetpad's "Run" button, the debugger will automatically attach. When execution reaches a breakpoint, Cursor will pause, allowing you to inspect variables, step through code, and interact with the debugger console.

---

### Tips for an Optimal Workflow

* **Leverage Cursor AI:**
    * Use `Cmd+K` (or `Ctrl+K`) for inline code suggestions, refactoring, and code generation.
    * Utilize the chat panel to ask questions about your code, generate new components, or get explanations.
    * Consider creating a `.cursorrules` file in your project root to provide specific instructions and context to Cursor's AI, making its suggestions more tailored to your project.
* **Keyboard Shortcuts:** Explore Cursor's keyboard shortcut settings (`Cmd+K Cmd+S`) to bind Sweetpad commands (like "Build" or "Build and Run") to custom shortcuts for increased efficiency.
* **Project Synchronization:** While Sweetpad handles building and running, Xcode remains the primary tool for managing project settings (e.g., capabilities, signing, build phases, adding asset catalogs). If you add new files in Cursor, you might occasionally need to open the project in Xcode to ensure they are properly added to targets, or consider using tools like [XcodeGen](https://github.com/XcodeGen/xcodegen) for larger projects to manage project file generation.
