---
title: Startpage
type: docs
---

# Bazel Rules for Hugo Static Site Generator

## Add Workspace Dependencies

Declare a dependency on `rules_hugo` in your `WORKSPACE`:

```python
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "rules_hugo",
    urls = ["https://github.com/chronicc/rules_hugo/archive/4afe44ba286fe3b389585d95dc272ab4d731176e.tar.gz"],
    strip_prefix = "rules_hugo-4afe44ba286fe3b389585d95dc272ab4d731176e",
    sha256 = "147a3e4c25425208b9246fb9cb50b75797780c72639e6253e23f13f68c6d8b0f",
)
```

Declare a dependency on the hugo binary as well as a theme in your `WORKSPACE`:

```python
load("@rules_hugo//hugo:rules.bzl", "github_hugo_theme", "hugo_repository")

hugo_repository(
    name = "hugo",
    extended = True,
)

github_hugo_theme(
    name = "hugo_papermod_theme",
    commit = "3a0a4811cbc07c0bea09ef55b3c1bfb39b48cddd",
    owner = "adityatelange",
    repo = "hugo-PaperMod",
)
```

## Build Rules

Create a build file for the site:

```python
load("@rules_hugo//hugo:rules.bzl", "hugo_site", "hugo_theme")

hugo_theme(
    name = "theme",
    srcs = [
        "@hugo_papermod_theme//:files",
    ],
    theme_name = "PaperMod",
)

hugo_site(
    name = "site",
    config = "config.toml",
    content = glob(["content/**"]),
    layouts = glob(["layouts/**"]),
    static = glob(["static/**"]),
    theme = ":theme",
)
```

## Generate

To build the site:

```bash
bazel build //site
```

Locally serve site:

```bash
bazel run //site:serve
```

Create a tarball:

```bash
tar -cvf bazel-out/site.tar -C $(shell bazel info bazel-bin)/site/site .
```
