# Cloud-based iOS Build Services Comparison

## 1. Codemagic (Recommended for Flutter) ⭐

### Pros:
- ✅ Built specifically for Flutter/Dart
- ✅ Easiest setup for Flutter projects
- ✅ Automatic code signing
- ✅ Great free tier (500 min/month)
- ✅ Direct TestFlight/App Store deployment
- ✅ Excellent documentation

### Cons:
- ❌ Smaller community than GitHub Actions
- ❌ Less flexible for non-Flutter projects

### Pricing:
- **Free**: 500 build minutes/month
- **Pro**: $99/month - 3,000 minutes
- **Team**: Custom pricing

### Setup Time: ~30 minutes

---

## 2. GitHub Actions

### Pros:
- ✅ Free for public repos (2,000 min/month for private)
- ✅ Integrated with GitHub
- ✅ Huge community and marketplace
- ✅ Very flexible and customizable
- ✅ Works with any project type

### Cons:
- ❌ More complex setup for iOS
- ❌ Manual code signing configuration
- ❌ Requires more YAML knowledge

### Pricing:
- **Free**: 2,000 minutes/month (private repos)
- **Team**: $4/user/month - 3,000 minutes
- **Enterprise**: Custom pricing

### Setup Time: ~1-2 hours

---

## 3. Bitrise

### Pros:
- ✅ Good Flutter support
- ✅ Visual workflow builder
- ✅ Many pre-built integrations
- ✅ Good documentation

### Cons:
- ❌ Expensive compared to others
- ❌ Limited free tier (200 builds/month)
- ❌ Can be slow on free tier

### Pricing:
- **Hobby**: Free - 200 builds/month, 45 min/build
- **Developer**: $90/month - Unlimited builds
- **Team**: $270/month

### Setup Time: ~45 minutes

---

## 4. CircleCI

### Pros:
- ✅ Good performance
- ✅ Docker support
- ✅ Flexible configuration
- ✅ Good free tier

### Cons:
- ❌ Complex setup for iOS
- ❌ Requires more DevOps knowledge
- ❌ Limited macOS support on free tier

### Pricing:
- **Free**: 6,000 build minutes/month (Linux)
- **Performance**: $30/month
- **Scale**: Custom pricing

### Setup Time: ~2 hours

---

## 5. AppCenter (Microsoft)

### Pros:
- ✅ Free tier available
- ✅ Good analytics and crash reporting
- ✅ Distribution tools included
- ✅ Microsoft support

### Cons:
- ❌ Being deprecated (moving to GitHub Actions)
- ❌ Not recommended for new projects
- ❌ Limited future support

### Pricing:
- **Free**: Limited builds
- **Paid**: Varies

### Setup Time: ~1 hour

---

## Quick Comparison Table

| Service | Free Tier | Best For | Setup Difficulty | iOS Support |
|---------|-----------|----------|------------------|-------------|
| **Codemagic** | 500 min/month | Flutter apps | ⭐ Easy | ⭐⭐⭐ Excellent |
| **GitHub Actions** | 2,000 min/month | Any project | ⭐⭐ Medium | ⭐⭐ Good |
| **Bitrise** | 200 builds/month | Mobile apps | ⭐⭐ Medium | ⭐⭐⭐ Excellent |
| **CircleCI** | 6,000 min/month | Any project | ⭐⭐⭐ Hard | ⭐ Fair |
| **AppCenter** | Limited | Legacy apps | ⭐⭐ Medium | ⭐⭐ Good |

---

## Recommendation for Your Project

**Use Codemagic** because:
1. Your project is Flutter-based
2. You need iOS builds without a Mac
3. You want the easiest setup
4. Free tier is generous for getting started
5. Automatic code signing saves time

**Alternative: GitHub Actions** if:
1. Your code is already on GitHub
2. You want more control over the build process
3. You're comfortable with YAML configuration
4. You need builds for other platforms too

---

## Next Steps

1. Choose a service (Codemagic recommended)
2. Follow the setup guide in `.agent/workflows/codemagic-setup.md`
3. Push your code to Git if not already done
4. Connect your repository to the CI/CD service
5. Configure iOS code signing
6. Trigger your first build!
