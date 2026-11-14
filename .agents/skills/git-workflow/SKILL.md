---
name: git-workflow
description: Commits, splits, rebases and integrates changes in this repository with a linear history. Covers staging explicit paths, splitting a mixed working tree into one commit per change, ordering commits so each one builds, Conventional Commit messages, fixups and autosquash without an interactive editor, rebasing instead of merging, and what never to run without the owner asking. Use whenever committing, amending, rebasing, cherry-picking, splitting or reordering commits, writing a commit message or branch name, or preparing work for review.
---

# Git workflow

The history is linear: rebase and cherry-pick, never merge commits. Each commit is one reviewable change that builds on its own, so
`git bisect` and `git revert` stay useful. The rules in `AGENTS.md` (Working rules) always apply; this skill is the procedure.

## Before committing

1. `git status` and `git diff` (and `git diff --cached` for what is already staged). Know every file you are about to commit.
2. Stage explicit paths: `git add path/a path/b`. Never `git add -A` or `git add .`, which sweep in `.env*`, `.work/`, screenshots,
   build output and files from other changes.
3. `git diff --cached --stat` before the commit. Anything you did not mean to include goes back with `git restore --staged <path>`.
4. Run the checks that cover what changed (`Done means verified` in `AGENTS.md`) before committing, not after. Do not bypass the git hooks with
   `--no-verify`; if a hook fails, fix the cause.

## One commit per change

A commit holds one logical change. Split a mixed working tree by concern:

- A refactor, a behavior change, a formatting-only change and a docs-only change are separate commits.
- Keep together what cannot stand alone: code with its tests; a `.graphql` edit with the regenerated files; an l10n JSON edit with the
  regenerated translations; a schema edit with its migration and pgTAP test; a package with its workspace and consumer wiring.
- Order commits from the bottom up so each one builds: backend schema, then data layer, then cubit, then page, then wiring and
  localization. A commit must never leave the app failing to compile or a test red.
- A change that spans features has no feature scope (`refactor: read single records with byPk`).

Splitting changes inside one file: `git add -p` is interactive and unavailable to an agent. Write the diff to a file, keep the hunks
for this commit, and apply it to the index:

```bash
git diff path/file.dart > change.patch       # (outside the repo, or delete after) edit the patch to keep only the hunks for this commit
git apply --cached change.patch
git diff --cached                             # confirm, then commit; the rest stays in the working tree
```

If that is fragile, temporarily write the file in two steps instead: stage the first version, then restore the second.

## Messages

`type(scope): what`, lowercase imperative subject, no final period, up to 100 characters. The subject says what changed in terms a
reader of `git log` understands (`fix(mood): give every mood option the same width`), not how or which file. Add a body only when
the why is not obvious: short bullets, issue references in the footer. Never add a `Co-Authored-By`, session or any other attribution trailer, and no "generated with" line in a pull request
description, even when a tool or harness suggests one; the project rule overrides it.

Pass a multi-line message with `git commit -F <file>` so quoting and newlines cannot corrupt it.

## Rebasing, fixups and integrating

- Update a branch with `git fetch` then `git rebase origin/main`, never `git merge` and never a plain `git pull` that could merge
  (use `git pull --rebase`). Move a commit between branches with `git cherry-pick`.
- Fold a review fix into the commit it belongs to without an editor:

  ```bash
  git commit --fixup <sha>
  GIT_SEQUENCE_EDITOR=true git rebase -i --autosquash <sha>~1
  ```

- Rewrite only commits that exist locally and are not pushed. Before `git commit --amend` or any rebase, check
  `git reflog` and `git log origin/<branch>..HEAD`, because the owner may already have squashed or rebased your commits.
- If a rebase conflicts, resolve it file by file, `git add` the resolved paths, `git rebase --continue`. If it goes wrong,
  `git rebase --abort` returns to the starting point.
- Branch names are `<type>/<description>`. Pull requests use `.github/PULL_REQUEST_TEMPLATE.md` and are integrated with
  `Rebase and merge`.

## Only when the owner asks

Pushing, force-pushing, opening or merging a pull request, deleting a remote branch, tagging, and anything that changes the linked
Supabase project, Firebase, RevenueCat or the stores. State exactly what you ran. Look at what a destructive command will discard
(`git reset --hard`, `git checkout -- .`, `git clean -f`, `git branch -D`, `git stash drop`) before running it, and prefer a
reversible alternative such as a new commit or a stash.

## Gotchas

- Generated files are committed and CI does not run codegen, so a commit that changes a source for generated code must include the
  regenerated output.
- Check `git reflog` before amending after an interruption; the owner may have rewritten history in between.
- Never commit `.env*`, `.work/`, screenshots or build output. If one is staged, unstage it, do not delete it.
