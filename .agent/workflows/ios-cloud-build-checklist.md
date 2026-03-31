# iOS Cloud Build Quick Start Checklist

## ✅ Pre-requisites (Complete these first)

### 1. Git Repository Setup
- [ ] Install Git (if not already installed)
- [ ] Initialize git in your project
- [ ] Create a repository on GitHub/GitLab/Bitbucket
- [ ] Push your code to the repository

### 2. Apple Developer Account
- [ ] Sign up for Apple Developer Program ($99/year)
  - URL: https://developer.apple.com/programs/
- [ ] Verify your account (can take 24-48 hours)
- [ ] Note your Team ID

### 3. Bundle Identifier
- [ ] Decide on your app's bundle identifier
  - Format: `com.yourcompany.vidhan`
  - Example: `com.sachin.vidhan`
- [ ] Update in `ios/Runner.xcodeproj/project.pbxproj` (or let Codemagic do it)

---

## 🚀 Codemagic Setup (Recommended Path)

### Step 1: Push to Git (if not done)
```bash
cd "d:\sachin\Projects\flutter projects\vidhan"
git init
git add .
git commit -m "Initial commit for iOS cloud build"

# Create a repo on GitHub, then:
git remote add origin https://github.com/YOUR_USERNAME/vidhan.git
git branch -M main
git push -u origin main
```

### Step 2: Sign Up for Codemagic
- [ ] Go to https://codemagic.io/signup
- [ ] Sign up with your Git provider (GitHub/GitLab/Bitbucket)
- [ ] Authorize Codemagic to access your repositories

### Step 3: Add Your App
- [ ] Click "Add application" in Codemagic dashboard
- [ ] Select your `vidhan` repository
- [ ] Choose "Flutter App" as project type
- [ ] Let Codemagic detect your project settings

### Step 4: Configure iOS Code Signing
- [ ] Go to "iOS code signing" in project settings
- [ ] Choose "Automatic code signing" (easiest)
- [ ] Connect your Apple Developer account
- [ ] Select your Team ID
- [ ] Enter your bundle identifier: `com.yourcompany.vidhan`

### Step 5: Configure Build Settings
- [ ] Update `codemagic.yaml` in your project:
  - Change `bundle_identifier` to your actual bundle ID
  - Change `your-email@example.com` to your email
  - Change `com.yourcompany.vidhan` to your package name
- [ ] Commit and push the changes

### Step 6: Trigger First Build
- [ ] In Codemagic, click "Start new build"
- [ ] Select branch: `main`
- [ ] Click "Start build"
- [ ] Wait 15-20 minutes for first build

### Step 7: Download IPA
- [ ] Once build succeeds, download the `.ipa` file
- [ ] Install on a physical iOS device for testing
- [ ] Or upload to TestFlight for distribution

---

## 📝 Important Files to Update

### 1. codemagic.yaml
```yaml
bundle_identifier: com.yourcompany.vidhan  # Change this!
PACKAGE_NAME: "com.yourcompany.vidhan"     # Change this!
recipients:
  - your-email@example.com                  # Change this!
```

### 2. ios/Runner/Info.plist
Already configured ✅

### 3. pubspec.yaml
Already configured ✅

---

## 🔐 Code Signing Options

### Option A: Automatic (Recommended)
- Codemagic manages certificates and profiles
- Easiest setup
- No manual certificate management
- **Choose this if**: You're new to iOS development

### Option B: Manual
- You manage certificates and provisioning profiles
- More control
- Requires Apple Developer Portal knowledge
- **Choose this if**: You have existing certificates

---

## 💰 Cost Breakdown

### Codemagic Free Tier
- 500 build minutes/month
- ~25-30 iOS builds per month (20 min/build average)
- Perfect for development and testing

### Apple Developer Program
- $99/year (required for App Store)
- Includes TestFlight access
- Unlimited app submissions

### Total First Year Cost
- **Development only**: $0 (Codemagic free tier)
- **App Store release**: $99 (Apple Developer)

---

## 🎯 Quick Commands Reference

### Check if Git is initialized
```bash
git status
```

### Initialize Git (if needed)
```bash
git init
git add .
git commit -m "Initial commit"
```

### Push to GitHub
```bash
git remote add origin YOUR_REPO_URL
git branch -M main
git push -u origin main
```

### Update and push changes
```bash
git add .
git commit -m "Update Codemagic configuration"
git push
```

---

## 🆘 Troubleshooting

### Build fails with "No provisioning profile found"
- Check Apple Developer account is connected
- Verify bundle identifier matches
- Try regenerating certificates in Codemagic

### Build fails with "Pod install failed"
- Check `ios/Podfile` is correct
- Verify Firebase configuration
- Check iOS deployment target (should be 13.0+)

### Build takes too long
- First build is always slower (downloads dependencies)
- Subsequent builds are faster (cached)
- Average: 15-20 minutes

---

## 📚 Helpful Resources

- Codemagic Docs: https://docs.codemagic.io/flutter/
- Flutter iOS Setup: https://docs.flutter.dev/deployment/ios
- Apple Developer: https://developer.apple.com/
- TestFlight Guide: https://developer.apple.com/testflight/

---

## ✨ Next Steps After First Successful Build

1. [ ] Test the IPA on a real iOS device
2. [ ] Set up TestFlight for beta testing
3. [ ] Configure automatic builds on push
4. [ ] Set up App Store deployment
5. [ ] Add build badges to your README

---

**Estimated Total Setup Time**: 1-2 hours (excluding Apple account verification)

**First Build Time**: 15-20 minutes

**Subsequent Builds**: 10-15 minutes
