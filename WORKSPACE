workspace(name = "rules_hugo")

load("@rules_hugo//hugo:rules.bzl", "github_hugo_theme", "gitlab_hugo_theme", "hugo_repository")

hugo_repository(
    name = "hugo",
    extended = True,
)

github_hugo_theme(
    name = "hugo_papermod_theme_github",
    commit = "3a0a4811cbc07c0bea09ef55b3c1bfb39b48cddd",
    owner = "adityatelange",
    repo = "hugo-PaperMod",
)

gitlab_hugo_theme(
    name = "hugo_papermod_theme_gitlab",
    commit = "3a0a4811cbc07c0bea09ef55b3c1bfb39b48cddd",
    project_id = "40058961",
    repo = "hugo-PaperMod",
    sha256 = "b3121eaca6fea68d51acd3b59c48ebb8333250e7a47a9c40d890d3bfb70ca080",
)

gitlab_hugo_theme(
    name = "hugo_geekdoc_theme_gitlab",
    commit = "78ed88918085f72e47388b917848a9622b03cf30",
    project_id = "40046611",
    repo = "hugo-geekdoc",
    sha256 = "dfd4473f8815701bfa518621511bba9128919e9e746c2be09edbab0fad5cbd0d",
)
