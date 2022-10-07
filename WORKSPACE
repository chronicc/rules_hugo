workspace(name = "rules_hugo")

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
