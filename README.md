<p align="center">
  <img src="https://s3.amazonaws.com/ohmyzsh/oh-my-zsh-logo.png" alt="Oh My Zsh">
</p>

Oh My Zsh is an open source, community-driven framework for managing your [zsh](http://www.zsh.org/) configuration.

This project is a vastly-reduced version of this framework, with lots of stuff
thrown over the side. There is support for Bash as well since this
slimmed down version is already mostly bash-compatible.

Once installed, your terminal shell will become the talk of the town _or your money back!_
With each keystroke in your command prompt, you'll take advantage of the ~~hundreds~~
few of powerful plugins ~~and beautiful themes~~ Strangers will come up to you in
cafés and ask you, _"that is amazing! are you some sort of genius?"_

Finally, you'll begin to get the sort of attention that you have always felt
you deserved. ...or maybe you'll use the time that you're saving to start flossing more often.

## Getting Started

### Prerequisites

__Disclaimer:__ _Oh My Zsh works best on macOS and Linux._

* Unix-like operating system (macOS or Linux)
* [Zsh](http://www.zsh.org) should be installed (v4.3.9 or more recent). If not pre-installed (`zsh --version` to confirm), check the following instruction here: [Installing ZSH](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)
* `curl` or `wget` should be installed
* `git` should be installed

### Basic Installation

Oh My Zsh is installed by running one of the following commands in your terminal. You can install this via the command-line with either `curl` or `wget`.

```shell
git clone git@github.com:elerch/oh-my-bash-zsh.git .oh-my-bash-zsh
```
Then add "source .oh-my-zsh/oh-my-bash-zsh.sh" to the bottom of your .zshrc file and .bashrc

## Using Oh My Zsh

### Plugins

Oh My Zsh comes with a shit load of plugins to take advantage of. **I've removed
them all**. If you want any, take a look at the [plugins](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins)
directory of the original project. Most of them are just a bunch of aliases and
stuff, but if you find something useful, throw them in the lib directory of 
your local clone. Please don't look at the [wiki](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins) -
read the source!

Copy what you want into the lib/ directory. Since I'll be avoiding adding too
much in there you probably won't get stepped on.

## Getting Updates

By default, you will **not** be prompted to check for upgrades every few weeks.
I've removed all that completely. If you want automatic upgrades, add a cron
job to do a git pull or something.

## Contributing

I'm far from being a [Zsh](http://www.zsh.org/) expert and suspect there are
many ways to improve – if you have ideas on how to make the configuration
easier to maintain (and faster), don't hesitate to fork and send pull requests!
I won't take anything releated to prompts (use [Liquidprompt](https://github.com/nojhan/liquidprompt)),
and most additions to lib will be rejected. I don't want this to be a plugin
dumpster for specific programs.

We also need people to test out pull-requests. So take a look through
[the open issues](https://github.com/elerch/oh-my-zsh/issues) and help where
you can.

## Contributors

Oh My Zsh has a vibrant community of happy users and delightful contributors. Without all the time and help from our contributors, it wouldn't be so awesome.

Thank you so much to the oh my zsh team for creating a base to work on!

## License

Oh My Zsh is released under the [MIT license](LICENSE.txt). I've maintained
that license.
