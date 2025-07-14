# Contributing

- [Branch](#branch)
  - [Structure](#structure)
- [Commits](#commits)
  - [Structure](#structure-1)
    - [Header](#header)
    - [Body](#body)
    - [Footer](#footer)
  - [Examples](#examples)
- [Pull Requests](#pull-requests)
  - [Code Reviews](#code-reviews)

## Branch

Branch name should follow a simple format consisting of it's type and it's description. It's type can be: `onboarding`, `feat`, `fix`, `refactor`, `docs`, etc

### Structure

```
<type>/<description>
```

## Commits

Commits should follow the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) format. Add any relevant issue numbers to the bottom of the commit. (e.g. Closes #1)

Each commit message consists of a **header**, an optional **body** and an optional **footer**. The header has a special format that includes a **type**, an optional **scope** and a **subject**:

### Structure

```
<type>[optional scope]: <description>

[optional body]

[footer(s)]
```

#### Header

- The header is mandatory and the scope of the header is optional.
- Avoid committing lines longer than 100 characters: this allows the message to be easier to read on git tools

##### Type

Valid types are:

- **feat:** A new feature
- **fix:** A bug fix
- **docs:** Documentation only changes
- **style:** Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
- **refactor:** A code change that neither fixes a bug nor adds a feature
- **perf:** A code change that improves performance
- **test:** Adding missing or correcting existing tests
- **chore:** Changes to the build process or auxiliary tools and libraries such as documentation generation
- **ci:** Reserved to CI bot commits

##### Scope

The scope may represent anything impacted by the commit (e.g. a component, an epic). If it makes the message more helpful, use it.

##### Description

The description contains a succinct overview of the change:

- Use the imperative, present tense: "change" not "changed" nor "changes"
- Don't capitalize the first letter
  - There is a linting rule preventing this
- No period (.) at the end

#### Body

Body should ideally explain what is the commit's purpose and/or some rationale why the author has made the changes the commit is applying to the code base.

Write one or more lines as bullet points, for instance:

```
* do this
* do that
```

#### Footer

List the related GH issues in a single line (separated by spaces if multiple issues are affected), see examples below.

### Examples

```
chore(documentation): add basic documentation

* add pull request template
* add ADR section and folder structure
* add table of contents and relevant sections

Closes #1 #2
```

## Pull Requests

- Pull requests will follow the [PR Template](./github/PULL_REQUEST_TEMPLATE.md).
- Pull requests require 2 approvals prior to merging.
- Pull requests do not require a ticket number in the title.
- A number of `GitHub Actions` will be run against every PR opened against `main`. These actions will run tests, check types, and lint the codebase to offer a base level check of code quality.

### Code Reviews

During code reviews, you can commit changes derived from it by amending the original commit and
force-pushing back to the remote. Typically, a code review would follow:

1. Create the change
2. Identify the original commit that this change relates to
3. Create a new commit. The suggestion is to use fixup `git commit --fixup <SHA_OF_ORIGINAL_COMMIT>`
4. Then, rebase auto squashing to amend the fixup to the commit: `git rebase -i <SHA_OF_ORIGINAL_COMMIT> --autosquash`
5. Force push it back to remote

After pushing the changes, warn the author of the comment so that your changes are verified.
If everything looks good, **let the author of the comment resolve it**. If this process takes too
long  and you are blocked, it is acceptable for the PR author to resolve it. However, try to avoid
it.

Once all comments have been addressed in some form, merge the commit and delete your branch from the
remote.

Generally, the repository is set up to allow only one merge strategy. We typically use
`Rebase and merge`.
