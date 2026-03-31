---
description: Setup Codemagic for iOS builds
---

# Codemagic Setup for iOS Builds

## Prerequisites
- GitHub/GitLab/Bitbucket account
- Apple Developer account (for App Store deployment)

## Step 1: Push Your Project to Git

1. Initialize git in your project (if not already done):
```bash
git init
git add .
git commit -m "Initial commit"
```

2. Create a repository on GitHub/GitLab/Bitbucket

3. Push your code:
```bash
git remote add origin <your-repo-url>
git branch -M main
git push -u origin main
```

## Step 2: Sign Up for Codemagic

1. Go to https://codemagic.io
2. Click "Sign up for free"
3. Sign in with your Git provider (GitHub/GitLab/Bitbucket)
4. Authorize Codemagic to access your repositories

## Step 3: Add Your Flutter Project

1. Click "Add application"
2. Select your repository from the list
3. Choose "Flutter App" as the project type
4. Codemagic will auto-detect your Flutter project

## Step 4: Configure iOS Build

1. In the project settings, go to "iOS code signing"
2. Choose one of these methods:

   **Method A: Automatic (Easier)**
   - Click "Enable automatic code signing"
   - Connect your Apple Developer account
   - Codemagic will handle certificates automatically

   **Method B: Manual**
   - Upload your provisioning profile
   - Upload your certificate (.p12 file)
   - Enter certificate password

## Step 5: Create Build Configuration

1. Go to "Workflow Editor"
2. Configure:
   - **Build triggers**: Choose when to build (on push, pull request, etc.)
   - **Environment variables**: Add any API keys or secrets
   - **Build settings**: 
     - Flutter version: Latest stable
     - Xcode version: Latest
     - CocoaPods version: Latest

## Step 6: Add Firebase Configuration (if needed)

1. In workflow editor, add environment variables:
   - Add your `GoogleService-Info.plist` as a file variable
   - Or add Firebase config as environment variables

## Step 7: Start Your First Build

1. Click "Start new build"
2. Select the branch to build
3. Click "Start build"
4. Wait for the build to complete (usually 10-20 minutes)

## Step 8: Download or Deploy

After successful build:
- Download the `.ipa` file for testing
- Or configure automatic deployment to TestFlight/App Store

## Free Tier Limits
- 500 build minutes/month
- macOS Standard VM
- Unlimited team members
- Unlimited apps

## Useful Links
- Codemagic Docs: https://docs.codemagic.io/flutter/
- Flutter iOS Setup: https://docs.codemagic.io/flutter-configuration/ios-code-signing/
