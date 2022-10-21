#!/usr/bin/env bash

# login
echo "Sign in to Microsoft 365..."
npx -p @pnp/cli-microsoft365 -- m365 login --authType browser

# create AAD app
echo "Creating AAD app..."
appId=$(npx -p @pnp/cli-microsoft365 -- m365 aad app add --name "Find meeting times" --multitenant --redirectUris "http://localhost,http://localhost/index.html" --platform spa --query "appId" -o text)

# write app to env.js
echo "Writing app to env.js..."
echo "const appId = '$appId';" > env.js

echo "DONE"