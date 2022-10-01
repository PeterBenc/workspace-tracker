#!/bin/bash

# Get total count of workspaces.
count=36

# Get current workspace number
current_num=$(xdotool get_desktop)

# Get existing workspace names
existing_names=$(gsettings get org.gnome.desktop.wm.preferences workspace-names | grep -oP '\[.*')

# Let python worry about the indexing to find the name of current workspace.
existing_name=$(python3 <<< "print ($existing_names[$current_num])" 2>/dev/null)

# Get the new name from the user. Exit the script if the user presses cancel.
new_name=$(zenity --entry --entry-text="$existing_name" --title="Workspace $((current_num+1)) label  " --text="New label:") || exit 0

# Again abuse python to fill the array correctly.
new_names=$(python3 << EOF
a = ($existing_names + [''] * $count)[:$count] # Create the array of sufficient size.
a[$current_num] = "$new_name" # Set the current workspace's name (Assumes that it does not contain special characters.)
print(a) # Print the array.
EOF
)

echo $new_names

# Set new array in gsettings.
gsettings set org.gnome.desktop.wm.preferences workspace-names "$new_names"