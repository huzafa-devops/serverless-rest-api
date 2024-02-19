#!/bin/bash

# # Get current branch name
# branch=$(git rev-parse --abbrev-ref HEAD)

# # Define the vpc value based on the branch
# if [ "$branch" = "main" ]; then
#   vpc="prod-vpc"
# else
#   vpc="dev-vpc"
# fi

# # Replace vpc value in serverless.yml
# sed -i 's/vpc:.*/vpc: $vpc/' serverless.yml



# Determine the branch name
branch_name=$(git rev-parse --abbrev-ref HEAD)

# Determine the new VPC value based on the branch
vpc_value="dev-vpc"  # Default value for non-main branches
if [[ "$branch_name" == "main" ]]; then
 vpc_value="prod-vpc"
fi

# Replace the 'vpc' value in serverless.yml
sed -i -e "s/vpc: .*/vpc: $vpc_value/" serverless.yml
rm serverless.yml-e

