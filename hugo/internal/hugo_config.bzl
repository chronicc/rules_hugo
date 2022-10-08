def _hugo_config_impl(ctx):
    """Declares a hugo config file."""
    out = ctx.actions.declare_file(ctx.file.src.basename)
    params = ctx.attr.params
    src = ctx.file.src
    tool = ctx.executable._tool

    args = [src.path] + [out.path]

    ctx.actions.run(
        mnemonic = "ShConfig",
        arguments = args,
        executable = tool,
        inputs = [src],
        outputs = [out],
    )

    return [DefaultInfo(files = depset([out]))]

hugo_config = rule(
    attrs = {
        "_tool": attr.label(
            allow_files = True,
            cfg = "exec",
            default = Label("//hugo/config:update_toml"),
            executable = True,
        ),
        "params": attr.string_dict(
            allow_empty = True,
            doc = """Adds key value pairs to the params section of the config file.
                If the key already exists in the config, it is overwritten.
            """,
            mandatory = False,
        ),
        "src": attr.label(
            allow_single_file = [
                ".toml",
                ".yaml",
                ".yml",
                ".json",
            ],
            doc = "A hugo config file. Allowed file types are json, toml and yaml.",
            mandatory = True,
        ),
    },
    implementation = _hugo_config_impl,
)
