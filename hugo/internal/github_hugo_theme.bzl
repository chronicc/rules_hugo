"""github_hugo_theme"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

DEFAULT_BUILD_FILE = """
filegroup(
    name = "files",
    srcs = glob(["**/*"]),
    visibility = ["//visibility:public"],
)
"""

DEFAULT_GITHUB_HOST = "github.com"

def github_hugo_theme(name, owner, repo, commit, sha256 = "", host = DEFAULT_GITHUB_HOST, **kwargs):
    """Download a hugo theme from Github.

    Args:
        name: The name of the rule.
        owner: The name of the owner of the repository.
        repo: The name of the repository.
        commit: The full commit hash of the commit for which the theme will be downloaded.
        sha256: The sha256 sum hash of the commit archive.
        host: The domain of the Github server. Default: github.com
        **kwargs: kwargs
    """

    url = "https://{host}/{owner}/{repo}/archive/{commit}.zip".format(
        owner = owner,
        repo = repo,
        commit = commit,
        host = host,
    )
    strip_prefix = "{repo}-{commit}".format(
        repo = repo,
        commit = commit,
    )

    if "build_file" not in kwargs and "build_file_content" not in kwargs:
        kwargs["build_file_content"] = DEFAULT_BUILD_FILE

    http_archive(
        name = name,
        url = url,
        strip_prefix = strip_prefix,
        sha256 = sha256,
        **kwargs
    )
