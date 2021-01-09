# Release Script
# Rever: Releaser of Versions
#   https://regro.github.io/rever-docs/tutorial.html

$PROJECT = 'IDS-skill'

from ids.ids_rever import release_docs, package_conda, update_conda, package_conda2, update_conda2

$ACTIVITIES = [
              'check',
              'version_bump',  # Changes the version number in various source files (setup.py, __init__.py, etc)
              #'tag',  # Creates a tag for the new version number
              #'push_tag',  # Pushes the tag up to the $TAG_REMOTE
              #'ghrelease',  # Creates a Github release entry for the new tag
              'package_conda',
              #'update_conda',
              #'release_docs',
               ]

$VERSION_BUMP_PATTERNS = [  # These note where/how to find the version numbers
                         ('docs/source/conf.py', r'release\s*=\'.*\'', "release = '$VERSION'"),
                         ('conda-recipe/meta.yaml', r'\{\%\s*set\s*version\s*=\s*\".*\"\s*\%\}', "{% set version = \"$VERSION\" %}"),
                         ('version',r'.*',"$VERSION"),
                         ]

$UPDATE_CONDA_ENVS = ["dev"]
