"""hugo_theme"""

HugoThemeInfo = provider(
    "A provider for a hugo theme.",
    fields = {
        "files": "A depset of files that belong to the theme.",
        "name": "The name of the theme.",
        "path": "The path to the theme.",
    },
)

def _hugo_theme_impl(ctx):
    return [HugoThemeInfo(
        name = ctx.attr.theme_name or ctx.label.name,
        path = ctx.label.package,
        files = depset(ctx.files.srcs),
    )]

hugo_theme = rule(
    attrs = {
        "theme_name": attr.string(),
        "srcs": attr.label_list(
            mandatory = True,
            allow_files = True,
        ),
    },
    implementation = _hugo_theme_impl,
)
