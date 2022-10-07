workspace(name = "rules_hugo")

load("@rules_hugo//hugo:rules.bzl", "github_hugo_theme", "gitlab_hugo_theme", "hugo_repository")

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

gitlab_hugo_theme(
    name = "hugo_geekmod_theme",
    commit = "78ed88918085f72e47388b917848a9622b03cf30",
    project_id = "40046611",
    repo = "hugo-geekdoc",
    sha256 = "dfd4473f8815701bfa518621511bba9128919e9e746c2be09edbab0fad5cbd0d",
)
