#!/bin/bash

# Step 1: Create the directory structure
mkdir -p ~/devops_project/{scripts,bin/tools,logs}

# Step 2: Create an empty deploy.sh file under scripts/
touch ~/devops_project/scripts/deploy.sh

# Step 3: Add shebang to deploy.sh
echo "#!/bin/bash" > ~/devops_project/scripts/deploy.sh

# Step 4: Add commands to save the size and permissions to logs/tree.txt
echo "du -h ~/devops_project/ > ~/devops_project/logs/tree.txt" >> ~/devops_project/scripts/deploy.sh
echo "ls -lR ~/devops_project/ >> ~/devops_project/logs/tree.txt" >> ~/devops_project/scripts/deploy.sh

# Step 5: Change the permissions to make the script executable by the owner only
chmod u+x ~/devops_project/scripts/deploy.sh

# Step 6: Create a compressed archive of the entire devops_project/ directory using tar
tar -czf ~/devops_project.tar.gz ~/devops_project/

