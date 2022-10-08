# Build Rules

- [hugo_config](#hugo_config)
- [hugo_site](#hugo_site)
- [hugo_serve](#hugo_serve)
- [hugo_theme](#hugo_theme)

## hugo_config

```shell
hugo_config(name, params)
```

A rule that declares a hugo config file.

**Attributes**

| Name           | Description    | Type           | Mandatory      | Default        |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| name | A unique name for this target. | [name](https://bazel.build/docs/build-ref.html#name) | required | |
| params | Adds key value pairs to the params section of the config file. If the key already exists in the config, it is overwritten. | [Dictionary: String -> String](https://bazel.build/docs/skylark/lib/dict.html) | optional | |
| src | A hugo config file. Allowed file types are json, toml and yaml. | [Label](https://bazel.build/docs/build-ref.html#labels) | required | |

## hugo_site

```shell
hugo_site(name, archetypes, assets, base_url, build_drafts, config, content,
          data, hugo, i18n, images, layouts, params, quiet, static, verbose)
```

A rule that builds a hugo site.

**Attributes**

| Name           | Description    | Type           | Mandatory      | Default        |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| name | A unique name for this target. | [name](https://bazel.build/docs/build-ref.html#name) | required | |
| archetypes | Files to be included in the archetypes/ subdir. | [List of labels](https://bazel.build/docs/build-ref.html#labels) | optional | |
| assets | Files to be included in the assets/ subdir. | [List of labels](https://bazel.build/docs/build-ref.html#labels) | optional | |
| base_url | Optionally set the base_url as a hugo argument. | String | optional | |
| build_drafts | Build content marked as draft. | Boolean | optional | `False` |
| config | The output of a [hugo_config](#hugo_config) target. | [Label](https://bazel.build/docs/build-ref.html#labels) | required | |
| content | Files to be included in the content/ subdir. | [List of labels](https://bazel.build/docs/build-ref.html#labels) | optional | |
| data | Files to be included in the data/ subdir. | [List of labels](https://bazel.build/docs/build-ref.html#labels) | optional | |
| hugo | The hugo executable. | [Label](https://bazel.build/docs/build-ref.html#labels) | optional | "@hugo//:hugo" |
| i18n | Files to be included in the i18n/ subdir. | [List of labels](https://bazel.build/docs/build-ref.html#labels) | optional | |
| images | Files to be included in the images/ subdir. | [List of labels](https://bazel.build/docs/build-ref.html#labels) | optional | |
| layouts | Files to be included in the layouts/ subdir. | [List of labels](https://bazel.build/docs/build-ref.html#labels) | optional | |
| quiet | Emit quietly. | Boolean | optional | `True` |
| static | Files to be included in the static/ subdir. | [List of labels](https://bazel.build/docs/build-ref.html#labels) | optional | |
| verbose | Emit verbose. | Boolean | optional | `False` |

## hugo_serve

```shell
hugo_serve(name, hugo, dep, disable_fast_render, quiet, verbose)
```

A rule that serves a hugo site.

**Attributes**

| Name           | Description    | Type           | Mandatory      | Default        |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| name | A unique name for this target. | [name](https://bazel.build/docs/build-ref.html#name) | required | |
| dep | The output of a `hugo_site` target. | [Label](https://bazel.build/docs/build-ref.html#labels) | required | |
| hugo | The hugo executable. | [Label](https://bazel.build/docs/build-ref.html#labels) | optional | "@hugo//:hugo" |
| disable_fast_render | Disable fast render. | Boolean | optional | `False` |
| quiet | Emit quietly. | Boolean | optional | `True` |
| verbose | Emit verbose. | Boolean | optional | `False` |

## hugo_theme

```shell
hugo_serve(name, srcs, theme_name)
```

A rule that declares a hugo theme. Hugo themes can be consumed by [hugo_site](#hugo_site).

**Attributes**

| Name           | Description    | Type           | Mandatory      | Default        |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| name | A unique name for this target. | [name](https://bazel.build/docs/build-ref.html#name) | required | |
| srcs | The list of files which are part of the theme. | [List of labels](https://bazel.build/docs/build-ref.html#labels) | required | |
| theme_name | The name of the theme. Must be exactly the same name as used in the hugo config file. If `name` and `theme_name` are identical, this attribut can be omitted. | String | optional | |
