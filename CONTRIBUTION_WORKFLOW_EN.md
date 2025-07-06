# 🚀 Contribution Workflow – stadata_flutter_sdk

Welcome to the **stadata_flutter_sdk** contribution workflow! This document aims to make collaboration and tracking easier, ensuring every contribution runs smoothly from planning to PR merge.

---

## 🧭 Task Status

| Status           | When to Use                                        | Example Usage                |
| ---------------- | -------------------------------------------------- | ---------------------------- |
| **Backlog**      | Feature/bug not yet scheduled or still an idea.    | "Add dark mode"              |
| **Ready**        | Task has been prioritized and is ready to work on. | "Fix typo in README"         |
| **In Progress**  | Developer is currently working on the task.        | "Implement API endpoint"     |
| **Open PR**      | Implementation done, PR is opened.                 | "PR #42: Add search feature" |
| **In Review**    | PR is being reviewed by codeowner/maintainer.      | "Review by @maintainer"      |
| **Need Changes** | PR needs revision, goes back to In Progress.       | "Fix failing tests"          |
| **Done**         | PR has been merged or closed.                      | "Feature is live"            |

---

## 🔄 Contribution Workflow

```mermaid
flowchart TD
  A[Backlog 🗂️] --> B[Ready ✅]
  B --> C[In Progress 🔧]
  C --> D[Open Pull Request 🔁]
  D --> E[In Review 👀]
  E --> F{Need Changes?}
  F -- Yes --> C
  F -- No --> G{PR Merged or Closed?}
  G -- Yes --> H[Done 🎉]
  G -- No --> E
```

**Explanation:**  
Each task starts from Backlog, moves to Ready, is worked on (In Progress), then a PR is opened. After review, if revisions are needed it goes back to In Progress, if approved and merged, the status becomes Done.

---

## 📝 Standard Task Format (Optional)

```markdown
📌 Title: Add search feature to StadataView
👤 Assignee: @username (optional)
📂 Branch: feature/search-stadata-view (required)
🏷️ Status: In Progress (required)
📈 Story Point: 3 (optional)
🔥 Priority: P1 (optional)
📬 PR: #42 (fill after PR is created)
```

---

## 📊 Story Point & Priority

| Story Point | Estimated Effort |
| ----------- | ---------------- |
| 1           | Very light       |
| 2           | Light            |
| 3           | Medium           |
| 4           | Complex          |
| 5           | Very complex     |

> **Tips:**  
> Assign story points based on complexity, not just time required.

| Priority | Description                       |
| -------- | --------------------------------- |
| **P0**   | Must be done immediately (urgent) |
| **P1**   | High priority                     |
| **P2**   | Medium priority                   |
| **P3**   | Nice to have / can be postponed   |

---

## 🛠️ Tools & Automation

- Use GitHub Projects for status automation.
- Use `CODEOWNERS` to auto-assign reviewers.
- Use CI/CD (e.g., GitHub Actions, Bitrise) for automatic PR validation.

---

## 📋 Issue Templates

Use the appropriate issue template when creating a new issue:

### 🐛 Bug Report
```markdown
**Bug Description**
A clear and concise description of what the bug is.

**To Reproduce**
Steps to reproduce the behavior:
1. Go to '...'
2. Click on '....'
3. Scroll down to '....'
4. See error

**Expected Behavior**
A clear and concise description of what you expected to happen.

**Screenshots**
If applicable, add screenshots to help explain your problem.

**Environment:**
- OS: [e.g. iOS 17, Android 14]
- Flutter Version: [e.g. 3.16.0]
- Package Version: [e.g. 1.0.0]
```

### ✨ Feature Request
```markdown
**Is your feature request related to a problem? Please describe.**
A clear and concise description of what the problem is.

**Describe the solution you'd like**
A clear and concise description of what you want to happen.

**Describe alternatives you've considered**
A clear and concise description of any alternative solutions or features you've considered.

**Additional context**
Add any other context or screenshots about the feature request here.
```

---

## 🎯 Contribution Checklist

### Before Starting
- [ ] Read [Contribution Guidelines](CONTRIBUTING.md)
- [ ] Choose an issue or create a new one
- [ ] Discuss approach in the issue
- [ ] Fork repository and set up locally

### During Development
- [ ] Follow [Clean Architecture](CLAUDE.md)
- [ ] Write tests for changes
- [ ] Update documentation if needed
- [ ] Test in example app
- [ ] Run `melos format` and `melos analyze`

### Before Submitting PR
- [ ] All tests passing
- [ ] Test coverage sufficient
- [ ] Example app working properly
- [ ] Documentation up-to-date
- [ ] Commit messages follow convention
- [ ] Squash commits if necessary

### After Submitting PR
- [ ] Respond to review feedback
- [ ] Update PR if changes requested
- [ ] Merge after approval

---

## 👏 Happy Contributing

Don't hesitate to ask if anything is unclear. Every contribution you make is valuable to the community!

### 🤝 Let's Build Together

STADATA Flutter SDK is an open source project that grows with contributions from the community. Together we can create better tools for accessing Indonesian statistical data.

**Thank you for being part of this community!** 🙏
