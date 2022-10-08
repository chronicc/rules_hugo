# Workspace Rules

- [hugo_repository](#hugo_repository)
- [github_hugo_theme](#github_hugo_theme)
- [gitlab_hugo_theme](#gitlab_hugo_theme)

## hugo_repository

```shell
hugo_repository(name, version, sha256, os_arch ,extended)
```

A rule that downloads the hugo binary and sets it up to be used by build rules.

**Attributes**

| Name           | Description    | Type           | Mandatory      | Default        |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| name | A unique name for this target. | [name](https://bazel.build/docs/build-ref.html#name) | required | |
| version | The version of the hugo binary. | String | optional | "0.101.0" |
| sha256 | The sha256 hash of the hugo binary. | String | optional | |
| os_arch | The operating system architecture. | String | optional | autodetect |
| extended | When set to true, the extended hugo version is used. | Boolean | optional | `False` |

## github_hugo_theme

```shell
github_hugo_theme(name, commit, host, owner, repo, sha256, **kwargs)
```

A rule that downloads a hugo theme from Github.

**Attributes**

| Name           | Description    | Type           | Mandatory      | Default        |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| name | A unique name for this target. | [name](https://bazel.build/docs/build-ref.html#name) | required | |
| commit | The commit which will be downloaded. | String | required | |
| host | The domain of the Github host from which the archive will be downloaded. | String | optional | "github.com" |
| owner | The owner of the repository. | String | required | |
| repo | The name of the repository. | String | required | |
| sha256 | The sha256 hash of the downloaded archive. | String | optional | |

## gitlab_hugo_theme

```shell
gitlab_hugo_theme(name, commit, host, project_id, repo, sha256, **kwargs)
```

A rule that downloads a hugo theme from Gitlab.

**Attributes**

| Name           | Description    | Type           | Mandatory      | Default        |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| name | A unique name for this target. | [name](https://bazel.build/docs/build-ref.html#name) | required | |
| commit | The commit which will be downloaded. | String | required | |
| host | The domain of the Gitlab host from which the archive will be downloaded. | String | optional | "gitlab.com" |
| project_id | The project id of the repository. | String | required | |
| repo | The name of the repository. | String | required | |
| sha256 | The sha256 hash of the downloaded archive. | String | optional | |
