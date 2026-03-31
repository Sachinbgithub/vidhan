# Git Branch Strategy for Codemagic Builds

## Your Current Setup

- **Current branch**: `v2.0`
- **Remote**: Connected to origin
- **Status**: Up to date with origin/v2.0

## ✅ Good News: You Can Use v2.0 Branch!

Codemagic works with **any branch** you configure. You don't need to use `main` at all.

---

## 🎯 Recommended Options

### Option 1: Build from v2.0 Only (Recommended for You)

**Configuration**: Already set in your `codemagic.yaml`

```yaml
triggering:
  events:
    - push
  branch_patterns:
    - pattern: 'v2.0'
      include: true
```

**Workflow**:
1. Make changes on `v2.0` branch
2. Commit and push to `v2.0`
3. Codemagic automatically builds
4. No need to touch `main` branch

**Best for**: 
- Development on a specific version branch
- Keeping main branch stable
- Your current workflow

---

### Option 2: Build from Multiple Branches

**Configuration**: Already set in your `codemagic.yaml`

```yaml
branch_patterns:
  - pattern: 'v2.0'
    include: true
  - pattern: 'main'
    include: true
  - pattern: 'develop'
    include: true
```

**Workflow**:
1. Push to any configured branch
2. Codemagic builds automatically
3. Different branches can have different configs

**Best for**:
- Multiple developers
- Feature branches
- Testing different versions

---

### Option 3: Manual Builds Only

**Configuration**: Remove triggering section or set to manual

```yaml
triggering:
  events: []  # No automatic triggers
```

**Workflow**:
1. Push code whenever
2. Manually trigger builds in Codemagic UI
3. Select which branch to build

**Best for**:
- Saving build minutes
- Building only when ready
- Testing specific commits

---

## 📋 Current Configuration

Your `codemagic.yaml` is configured to build from:
- ✅ `v2.0` branch (your current branch)
- ✅ `main` branch (if you use it)

**Triggers**:
- ✅ On push to these branches
- ✅ On pull requests to these branches

---

## 🚀 What to Do Now

### Keep Using v2.0 Branch:

```bash
# You're already on v2.0, just commit and push
git add .
git commit -m "Add Codemagic configuration"
git push origin v2.0
```

**Result**: Codemagic will automatically build from `v2.0` ✅

---

### If You Want to Use Main Branch:

```bash
# Switch to main
git checkout main

# Merge v2.0 into main
git merge v2.0

# Push to main
git push origin main
```

**Result**: Codemagic will build from `main` ✅

---

## 🎨 Branch Strategy Recommendations

### For Solo Development:
```
v2.0 (development) → Build & test here
  ↓
main (stable) → Merge when ready for release
```

### For Team Development:
```
feature/* (features) → Individual features
  ↓
develop (integration) → Merge features here
  ↓
v2.0 (release candidate) → Test before release
  ↓
main (production) → Only stable releases
```

---

## 🔧 Customizing Branch Patterns

### Build only from v2.0:
```yaml
branch_patterns:
  - pattern: 'v2.0'
    include: true
```

### Build from all version branches:
```yaml
branch_patterns:
  - pattern: 'v*'  # Matches v1.0, v2.0, v3.0, etc.
    include: true
```

### Build from everything except test branches:
```yaml
branch_patterns:
  - pattern: '*'
    include: true
  - pattern: 'test/*'
    include: false
```

### Build from specific patterns:
```yaml
branch_patterns:
  - pattern: 'main'
    include: true
  - pattern: 'release/*'
    include: true
  - pattern: 'hotfix/*'
    include: true
```

---

## 💡 Pro Tips

### 1. Save Build Minutes
- Don't build on every commit
- Use manual triggers for development
- Auto-build only on important branches

### 2. Branch Protection
- Keep `main` for stable releases only
- Do all development on `v2.0` or feature branches
- Merge to `main` only when tested

### 3. Multiple Workflows
You can create different workflows for different branches:

```yaml
workflows:
  dev-workflow:
    triggering:
      branch_patterns:
        - pattern: 'v2.0'
    # Fast builds, no deployment
    
  production-workflow:
    triggering:
      branch_patterns:
        - pattern: 'main'
    # Full builds, deploy to App Store
```

---

## ✅ Summary

**Answer**: You can absolutely keep using `v2.0` branch!

**Your configuration**:
- ✅ Builds from `v2.0` automatically
- ✅ Also builds from `main` if you use it
- ✅ No need to change branches

**Next step**:
```bash
git add .
git commit -m "Configure Codemagic for v2.0 branch"
git push origin v2.0
```

Codemagic will detect the push to `v2.0` and start building! 🚀

---

## 🆘 Troubleshooting

### "Build not triggering on v2.0"
- Check branch pattern in `codemagic.yaml`
- Verify webhook is set up in repository settings
- Try manual build first

### "Want to change default branch"
- Update `branch_patterns` in `codemagic.yaml`
- Commit and push
- Next push will use new pattern

### "Need different configs per branch"
- Create multiple workflows
- Each with different `branch_patterns`
- Different build scripts per workflow
