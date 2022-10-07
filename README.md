# rules_hugo

[Bazel](https://bazel.build) rules for building static websites with [Hugo](https://gohugo.io).

## Workspace Rules

|                                    Name | Description                         |
| ----------------: | :---------------------------------- |
|   hugo_repository | Load hugo dependency for this repo. |
| github_hugo_theme | Load a hugo theme from github.      |

## Build Rules

|                      Name | Description           |
| ---------: | :-------------------- |
|  hugo_site | Declare a hugo site.  |
| hugo_theme | Declare a hugo theme. |

## Usage

### Add rules_hugo to your WORKSPACE and add a theme from github

```python
# Update these to latest
RULES_HUGO_COMMIT = "..."
RULES_HUGO_SHA256 = "..."

http_archive(
    name = "rules_hugo",
    url = "https://github.com/chronicc/rules_hugo/archive/%s.zip" % RULES_HUGO_COMMIT,
    sha256 = RULES_HUGO_SHA256,
    strip_prefix = "rules_hugo-%s" % RULES_HUGO_COMMIT
)

load("@rules_hugo//hugo:rules.bzl", "hugo_repository", "github_hugo_theme")

#
# Load hugo binary itself
#
# Optionally, load a specific version of Hugo, with the 'version' argument
hugo_repository(
    name = "hugo",
)

#
# This makes a filegroup target "@hugo_papermod_theme//:files"
# available to your build files
#
github_hugo_theme(
    name = "hugo_papermod_theme",
    commit = "3a0a4811cbc07c0bea09ef55b3c1bfb39b48cddd",
    owner = "adityatelange",
    repo = "hugo-PaperMod",
)
```

### Declare a hugo_site in your BUILD file

```python
load("@rules_hugo//hugo:rules.bzl", "hugo_site", "hugo_theme", "hugo_serve")

# Declare a theme 'PaperMod'.  
# When the `name` and `theme_name` are identical, `theme_name` can be omitted.
hugo_theme(
    name = "theme",
    srcs = [
        "@hugo_papermod_theme//:files",
    ],
    theme_name = "PaperMod",
)

# Declare a site. The config file is mandatory.
hugo_site(
    name = "site",
    config = "config.toml",
    content = glob(["content/**"]),
    layouts = glob(["layouts/**"]),
    static = glob(["static/**"]),
    theme = ":theme",
)

# Run local development server.
hugo_serve(
    name = "serve",
    dep = [":site"],
)

# Create a tar archive of the size.
pkg_tar(
    name = "site_tar",
    srcs = [":site"],
)
```

### Build the site

The `hugo_site` target emits the output in the `bazel-bin` directory.

```bash
$ bazel build //site
[...]
Target //site:site up-to-date:
  bazel-bin/site/site
[...]
```

```bash
$ tree bazel-bin/site/site
bazel-bin/site/site
├── 404.html
├── about
│   └── index.html
[...]
```

The `pkg_tar` target emits a `%{name}_tar.tar` file containing all the Hugo output files.

```bash
$ bazel build //site:site_tar
[...]
Target //site:site_tar up-to-date:
  bazel-bin/site_tar.tar
```
