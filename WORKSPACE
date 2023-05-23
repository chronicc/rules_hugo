workspace(name = "rules_hugo")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "rules_pkg",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_pkg/releases/download/0.9.1/rules_pkg-0.9.1.tar.gz",
        "https://github.com/bazelbuild/rules_pkg/releases/download/0.9.1/rules_pkg-0.9.1.tar.gz",
    ],
    sha256 = "8f9ee2dc10c1ae514ee599a8b42ed99fa262b757058f65ad3c384289ff70c4b8",
)

load("@rules_pkg//:deps.bzl", "rules_pkg_dependencies")

rules_pkg_dependencies()



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
