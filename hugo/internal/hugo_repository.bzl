"""hugo_repository"""

HUGO_BUILD_FILE = """
package(default_visibility = ["//visibility:public"])
exports_files( ["hugo"] )
"""

def _hugo_repository_impl(ctx):
    hugo = "hugo"
    if ctx.attr.extended:
        hugo = "hugo_extended"

    os_arch = ctx.attr.os_arch

    os_name = ctx.os.name.lower()
    if os_name.startswith("mac os"):
        os_arch = "macOS-64bit"
    elif os_name.find("windows") != -1:
        os_arch = "Windows-64bit"
    else:
        os_arch = "Linux-64bit"

    url = "https://github.com/gohugoio/hugo/releases/download/v{version}/{hugo}_{version}_{os_arch}.tar.gz".format(
        hugo = hugo,
        os_arch = os_arch,
        version = ctx.attr.version,
    )

    ctx.download_and_extract(
        url = url,
        sha256 = ctx.attr.sha256,
    )

    ctx.file("BUILD.bazel", HUGO_BUILD_FILE)

hugo_repository = repository_rule(
    _hugo_repository_impl,
    attrs = {
        # When updating the version, also update the version in documentation/workspace_rules.md
        "version": attr.string(
            default = "0.101.0",
            doc = "The hugo version to use.",
        ),
        "sha256": attr.string(
            doc = "The sha256 hash of the binary.",
        ),
        "os_arch": attr.string(
            doc = "The operating system architecture. Leave empty for autodetect.",
        ),
        "extended": attr.bool(
            doc = "If set to true, the extended hugo version is used.",
        ),
    },
)
