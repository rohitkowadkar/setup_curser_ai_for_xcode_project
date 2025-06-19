#!/bin/bash

# This script automates the installation of command-line tools for Xcode development.
# It will guide you through the manual steps for installing Cursor and its extensions.

echo "Starting automated setup for Xcode development tools..."

# --- Step 1: Install Homebrew (if not already installed) ---
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add Homebrew to PATH for current session if it was just installed
    eval "$(/opt/homebrew/bin/brew shellenv)"
    echo "Homebrew installed successfully."
else
    echo "Homebrew is already installed. Updating Homebrew..."
    brew update
    echo "Homebrew updated."
fi

# --- Step 2: Install Xcode Command Line Tools ---
echo "Checking for Xcode Command Line Tools..."
if xcode-select -p &> /dev/null; then
    echo "Xcode Command Line Tools are already installed."
else
    echo "Installing Xcode Command Line Tools (this may require a GUI prompt)..."
    xcode-select --install
    echo "Please follow any on-screen prompts to complete the installation."
    read -p "Press any key to continue once Xcode Command Line Tools installation is complete..."
fi

# --- Step 3: Install Essential Command-Line Tools via Homebrew ---

# Function to check and install a Homebrew package
install_brew_package() {
    local package_name=$1
    local description=$2
    echo "Checking for $description ($package_name)..."
    if ! command -v "$package_name" &> /dev/null; then
        echo "Installing $description ($package_name)..."
        brew install "$package_name" || { echo "Failed to install $package_name. Please check for errors."; exit 1; }
    else
        echo "$description ($package_name) is already installed."
    fi
}

install_brew_package xcode-build-server "xcode-build-server"
install_brew_package xcbeautify "xcbeautify (Highly Recommended)"
install_brew_package swiftformat "swiftformat (Optional - for code formatting)"

echo "Command-line tools installation complete."

# --- Step 4: Manual Steps for Cursor and Extensions ---
echo ""
echo "--- Manual Steps Required ---"
echo "The following steps cannot be fully automated via this script and require your interaction:"
echo ""
echo "1. Install Cursor Application:"
echo "   - Download and install the Cursor application manually from: https://www.cursor.sh/"
echo "   - Launch Cursor after installation."
echo ""
echo "2. Install Essential Cursor Extensions:"
echo "   - In Cursor, go to the Extensions view (Cmd+Shift+X or Ctrl+Shift+X)."
echo "   - Search for and install these extensions one by one:"
echo "     - Swift Language Support"
echo "     - CodeLLDB"
echo "     - Sweetpad"
echo "     - SwiftLint (Optional, if you installed it via Homebrew)"
echo ""
echo "3. Open Your Xcode Project in Cursor:"
echo "   - In Cursor, go to File > Open Folder..."
echo "   - Navigate to the root directory of your Xcode project (containing .xcodeproj or .xcworkspace) and open it."
echo ""
echo "4. Generate Sweetpad's Build Server Configuration:"
echo "   - In Cursor, open the Command Palette (Cmd+Shift+P or Ctrl+Shift+P)."
echo "   - Type 'Sweetpad: Generate' and select 'Sweetpad: Generate Build Server Config'."
echo "   - This will create a 'buildServer.json' file in your project root."
echo ""
echo "5. Select Your Scheme and Destination & Run:"
echo "   - In Cursor's status bar (bottom of the window), click the scheme selector and choose your app's scheme."
echo "   - Click the destination selector and choose your desired simulator or connected device."
echo "   - Click the 'Run' or 'Play' button in the status bar to build and launch your application."
echo ""
echo "Setup complete! You are now ready to use Cursor AI with your Xcode projects."
