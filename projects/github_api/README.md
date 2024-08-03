# GitHub Repository Collaborator Permissions Checker
- This script allows you to list the collaborators of a GitHub repository and their respective permissions (read, write, admin).
- It's useful for quickly auditing access control and permissions for your repositories.

## Features
- Lists Collaborators: Retrieves and lists all collaborators for a specified repository.
- Displays Permissions: Shows each collaborator's permissions (e.g., read, write, admin).
- Error Handling: Gracefully handles errors such as missing authentication or incorrect repository details.

## Prerequisites
- GitHub Personal Access Token: Required for authentication with the GitHub API.
- cURL: Used for making API requests.
- jq: A lightweight and flexible command-line JSON processor.

## Installation
1. Clone the repository:
```
git clone <repository of script file>
```
OR 

1. Download the script file directly from the repository else
You can create a script file using `nano` or `vim` editor also then copy the code from this repo and paste in your editor.

2. Create a script file `nano/vim [filename].sh`

```
#!/bin/bash


########
# Author: Vikram
# Date: 03-08-24
#
# Description: This script lists the collaborators of a specified GitHub repository
# and their respective permissions (read, write, admin). Useful for auditing access
# control and permissions for your repositories.
#######


# GitHub API URL
API_URL="https://api.github.com"

# GitHub username and personal access token
USERNAME=$username
TOKEN=$token

# User and Repository information
REPO_OWNER=$1
REPO_NAME=$2

# Function to make a GET request to the GitHub API
function github_api_get {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"

    # Send a GET request to the GitHub API with authentication
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# Function to list users with read access to the repository
function list_users_with_read_access {
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

    # Fetch the list of collaborators on the repository
    collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

    # Display the list of collaborators with read access
    if [[ -z "$collaborators" ]]; then
        echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
    else
        echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
        echo "$collaborators"
    fi
}

# Main script

echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}..."
list_users_with_read_access

```


## Install jq:

- Linux: sudo apt-get install jq
- macOS: brew install jq
- Windows: Download the jq executable from the official website.

## Usage
Set your GitHub username and personal access token as environment variables:
```
export USERNAME="your-github-username"
```
```
export TOKEN="your-github-token"
```
Run the script:
```
./script.sh <REPO_OWNER> <REPO_NAME>
```

```
./script.sh <GITHUB ORGANISATION OWNER> <REPO_NAME>
```
Replace <REPO_OWNER> with the owner of the repository and <REPO_NAME> with the name of the repository. For example:

```
./script.sh iamvikramkumar AI-SENTINEL
```

```
./script.sh vikram-s-team demo-repo
```
