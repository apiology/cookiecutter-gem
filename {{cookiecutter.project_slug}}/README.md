# {{ cookiecutter.project_name }}

WARNING: This is not ready for use yet!

{{ cookiecutter.project_short_description }}

To publish new version as a maintainer:

```sh
git log "v$(bump current)..."
# Set type_of_bump to patch, minor, or major
bump --tag --tag-prefix=v ${type_of_bump:?}
rake release
```
