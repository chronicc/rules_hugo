"""git_hugo_theme"""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")

DEFAULT_BUILD_FILE = """
filegroup(
    name = "files",
    srcs = glob(["**/*"]),
    visibility = ["//visibility:public"],
)
"""

def git_hugo_theme(name, remote, commit, **kwargs):
    """Download a hugo theme from Github.

    Args:
        name: The name of the rule.
        remote: The url to the git repository.
        commit: The full commit hash of the commit for which the theme will be downloaded.
        **kwargs: kwargs
    """

    if "build_file" not in kwargs and "build_file_content" not in kwargs:
        kwargs["build_file_content"] = DEFAULT_BUILD_FILE

    new_git_repository(
        name = name,
        commit = commit,
        remote = remote,
        **kwargs
    )
