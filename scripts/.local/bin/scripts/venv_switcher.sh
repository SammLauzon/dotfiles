#!/bin/bash
baseName=$(echo $(basename $PWD))
reposDir=~/repo
dirMatch=$reposDir/$baseName
# Handle when we are already in a venv.
if [ ! -z "$VIRTUAL_ENV" ]; then
    venvBaseName=$(echo $(basename $VIRTUAL_ENV))
    repoName=$reposDir/$venvBaseName
    # Do nothing if PWD is a subfolder of the virtualenv associated folder.
    if [[ "$PWD" == "$repoName"* ]]; then
        return
    # If not a subfolder, deactivate.
    else
        pyenv deactivate
    fi
fi

# Early exit if the current directory is not in repos.
if [ "$PWD" != "$dirMatch" ]; then
    return
fi
# Find if the current directory contains python files.
pythonFile=$(find $PWD -type f -name '*.py')
if [ -z "$pythonFile" ]; then
    # If no files found, do nothing and exit.
    return
fi

# Match the folder base name to a venv. If a match happened, activate the venv.
pythonVersion=$(< ~/.pyenv/version)
venvDirectory=~/.pyenv/versions/$pythonVersion/envs/$baseName
if [ -d "$venvDirectory" ]; then
    pyenv activate "$baseName"
# If no match, prompt the user to create one!
else
    echo "No virtual environment was found for $baseName."
    # vared -p "Would like to create one? (Y/N) " -c CONT
    read "CONT? Would like to create one? (Y/N): "
    if [[ "$CONT" == 'Y' || "$CONT" == 'y' ]]; then
        pyenv virtualenv "$baseName"
    fi
fi
