<!--nologo-->

[Poetry](https://poetry.eustace.io/) is a tool for dependency management and packaging in Python. It allows you to declare the libraries your project depends on and it will manage (install/update) them for you.

For the basic usage introduction we will be installing `pendulum`, a datetime library.

## Project setup

First, let's create our new project, let's call it `poetry-demo`:

```bash
$ poetry new poetry-demo
```

This will create the `poetry-demo` directory with the following content:

```text
poetry-demo
├── pyproject.toml
├── README.rst
├── poetry_demo
│   └── __init__.py
└── tests
    ├── __init__.py
    └── test_poetry_demo.py
```

The `pyproject.toml` file is what is the most important here. This will orchestrate
your project and its dependencies. For now, it looks like this:

```toml
[tool.poetry]
name = "poetry-demo"
version = "0.1.0"
description = ""
authors = ["Sébastien Eustace <sebastien@eustace.io>"]

[tool.poetry.dependencies]
python = "*"

[tool.poetry.dev-dependencies]
pytest = "^3.4"
```

### Specifying dependencies

If you want to add dependencies to your project, you can specify them in the `tool.poetry.dependencies` section. You can use `nano` or `vim` to edit files in the terminal.

```toml
[tool.poetry.dependencies]
pendulum = "^1.4"
```

As you can see, it takes a mapping of **package names** and **version constraints**.

Poetry uses this information to search for the right set of files in package "repositories" that you register
in the `tool.poetry.repositories` section, or on [PyPI](https://pypi.org) by default.

Also, instead of modifying the `pyproject.toml` file by hand, you can use the `add` command.

```bash
$ poetry add pendulum
```

It will automatically find a suitable version constraint.

### Version constraints

In our example, we are requesting the `pendulum` package with the version constraint `^1.4`.
This means any version greater or equal to 1.4.0 and less than 2.0.0 (`>=1.4.0 <2.0.0`).

Please read [versions](/docs/versions/) for more in-depth information on versions, how versions relate to each other, and on version constraints.

## Installing dependencies

To install the defined dependencies for your project, just run the `install` command.

```bash
$ poetry install
```

When you run this command, one of two things may happen:

### Installing without `poetry.lock`

If you have never run the command before and there is also no `poetry.lock` file present,
Poetry simply resolves all dependencies listed in your `pyproject.toml` file and downloads the latest version of their files.

When Poetry has finished installing, it writes all of the packages and the exact versions of them that it downloaded to the `poetry.lock` file,
locking the project to those specific versions.
You should commit the `poetry.lock` file to your project repo so that all people working on the project are locked to the same versions of dependencies (more below).

### Installing with `poetry.lock`

This brings us to the second scenario. If there is already a `poetry.lock` file as well as a `pyproject.toml` file
when you run `poetry install`, it means either you ran the `install` command before,
or someone else on the project ran the `install` command and committed the `poetry.lock` file to the project (which is good).

Either way, running `install` when a `poetry.lock` file is present resolves and installs all dependencies that you listed in `pyproject.toml`,
but Poetry uses the exact versions listed in `poetry.lock` to ensure that the package versions are consistent for everyone working on your project.
As a result you will have all dependencies requested by your `pyproject.toml` file,
but they may not all be at the very latest available versions
(some of the dependencies listed in the `poetry.lock` file may have released newer versions since the file was created).
This is by design, it ensures that your project does not break because of unexpected changes in dependencies.

### Commit your `poetry.lock` file to version control

Committing this file to VC is important because it will cause anyone who sets up the project
to use the exact same versions of the dependencies that you are using.
Your CI server, production machines, other developers in your team,
everything and everyone runs on the same dependencies,
which mitigates the potential for bugs affecting only some parts of the deployments.
Even if you develop alone, in six months when reinstalling the project you can feel confident
the dependencies installed are still working even if your dependencies released many new versions since then.
(See note below about using the update command.)

*Note: For libraries it is not necessary to commit the lock file.*


## Updating dependencies to their latest versions

As mentioned above, the `poetry.lock` file prevents you from automatically getting the latest versions
of your dependencies.
To update to the latest versions, use the `update` command.

```!bash
$ poetry update
```

This will fetch the latest matching versions (according to your `pyproject.toml` file)
and update the lock file with the new versions.
(This is equivalent to deleting the `poetry.lock` file and running `install` again.)

*Note: Poetry will display a **Warning** when executing an install command if `poetry.lock` and `pyproject.toml` are not synchronized.*

## Poetry and virtualenvs

When you execute the `install` command (or any other "install" commands like `add` or `remove`),
Poetry will check if it's currently inside a virtualenv and, if not, will use an existing one
or create a brand new one for you to always work isolated from your global Python installation.

## What's next?

Next, you can explore the official Poetry [documentation](https://poetry.eustace.io/docs/).
You may also be interested in exploring another package manager that is Pipenv in the [Pipenv playground](https://rootnroll.com/d/pipenv/).

If you're interested in what kind of shell is used here, it's fish! You can play with
it in our [fish shell playground](https://rootnroll.com/d/fish-shell/).

You can also improve this playground or create your own. Please send a PR or open
an issue in [github.com/rootnroll/library](https://github.com/rootnroll/library).
