"""github_hugo_theme"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

DEFAULT_BUILD_FILE = """
filegroup(
    name = "files",
    srcs = glob(["**/*"]),
    visibility = ["//visibility:public"],
)
"""

DEFAULT_GITLAB_HOST = "gitlab.com"

def gitlab_hugo_theme(name, project_id, repo, commit, sha256 = "", host = DEFAULT_GITLAB_HOST, **kwargs):
    """Download a hugo theme from Gitlab.

    Args:
        name: The name of the target.
        project_id: The unique id of the repository.
        repo: The name of the repository.
        commit: The full commit hash of the commit for which the theme will be downloaded.
        sha256: The sha256 sum hash of the commit archive.
        host: The domain of the Github server. Default: gitlab.com
        **kwargs: kwargs
    """

    url = "https://{host}/api/v4/projects/{project_id}/repository/archive.zip?sha={commit}".format(
        commit = commit,
        host = host,
        project_id = project_id,
    )
    strip_prefix = "{repo}-{commit}-{commit}".format(
        repo = repo,
        commit = commit,
    )

    if "build_file" not in kwargs and "build_file_content" not in kwargs:
        kwargs["build_file_content"] = DEFAULT_BUILD_FILE

    http_archive(
        name = name,
        auth_patterns = {
            host: "Bearer <password>",
        },
        url = url,
        strip_prefix = strip_prefix,
        sha256 = sha256,
        **kwargs
    )
