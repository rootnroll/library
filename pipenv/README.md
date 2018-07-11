**Pipenv** is a tool that aims to bring the best of all packaging worlds
(bundler, composer, npm, cargo, yarn, etc.) to the Python world.
*Windows is a first-class citizen, in our world.*

It automatically creates and manages a virtualenv for your projects, as
well as adds/removes packages from your `Pipfile` as you
install/uninstall packages. It also generates the ever-important
`Pipfile.lock`, which is used to produce deterministic builds.

You've got Python 3 and Pipenv already installed inside the box.

## Installing packages for your project

Pipenv manages dependencies on a per-project basis. To install packages,
change into your project's directory and run:

```
$ cd myproject
$ pipenv install requests
```

Pipenv will install the excellent [Requests](http://docs.python-requests.org)
library and create a `Pipfile` for you in your project's directory. The
Pipfile is used to track which dependencies your project
needs in case you need to re-install them, such as when you share your
project with others.
  
## Using installed packages

Now that Requests is installed you can create a simple `main.py` file to use it
(for the simplicity of this tutorial we've already created it for you):

```
import requests

response = requests.get('https://httpbin.org/ip')

print('Your IP is {0}'.format(response.json()['origin']))
```

Then you can run this script using `pipenv run`:

```
$ pipenv run python main.py
```

You should get output similar to this:

```
Your IP is 8.8.8.8
```

Using `$ pipenv run` ensures that your installed packages are available
to your script. It's also possible to spawn a new shell that ensures
all commands have access to your installed packages:

```
$ pipenv shell
```

## Next steps

Congratulations, you now know how to install and use Python packages! ✨ 🍰 ✨
Next, you can explore the official Pipenv [documentation](https://docs.pipenv.org/).

If you're interested in what kind of shell is used here, it's fish! You can play with
it in our [fish shell](https://rootnroll.com/d/fish-shell/) playground.

You can also improve this playground or create your own. Please send a PR or open
an issue in [github.com/rootnroll/library](https://github.com/rootnroll/library).
