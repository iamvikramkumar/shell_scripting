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



# =========================================================================================== 

# #!/bin/bash

# # GitHub API URL
# API_URL="https://api.github.com"

# # GitHub username and personal access token
# USERNAME=$username
# TOKEN=$token

# # User and Repository information
# REPO_OWNER=$1
# REPO_NAME=$2

# # Function to make a GET request to the GitHub API
# function github_api_get {
#     local endpoint="$1"
#     local url="${API_URL}/${endpoint}"

#     # Send a GET request to the GitHub API with authentication
#     curl -s -u "${USERNAME}:${TOKEN}" "$url"
# }

# # Function to list users with read access to the repository
# function list_users_with_read_access {
#     local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

#     # Fetch the list of collaborators on the repository
#     response="$(github_api_get "$endpoint")"
#     echo "$response"  # Print the raw response for debugging

#     # Check for errors in the response
#     if echo "$response" | jq -e .message > /dev/null 2>&1; then
#         echo "Error: $(echo "$response" | jq -r .message)"
#         exit 1
#     fi

#     # Extract collaborators with read access
#     collaborators="$(echo "$response" | jq -r '.[] | select(.permissions.pull == true) | .login')"

#     # Display the list of collaborators with read access
#     if [[ -z "$collaborators" ]]; then
#         echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
#     else
#         echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
#         echo "$collaborators"
#     fi
# }

# # Main script
# echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}..."
# list_users_with_read_access

