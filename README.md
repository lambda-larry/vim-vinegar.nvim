# vinegar.nvim

Light lua reimplementation of [vim-vinegar][] by [tpope][].

[vim-vinegar]: https://github.com/tpope/vim-vinegar/
[tpope]: https://github.com/tpope

## Implemented features

* Press `-` in any buffer to hop up to the directory listing and seek to the
  file you just came from. Keep bouncing to go up, up, up. Having rapid
  directory access available changes everything.
* All that annoying crap at the top is turned off, leaving you with nothing but
  a list of files. This is surprisingly disorienting, but ultimately very
  liberating. Press `I` to toggle until you adapt.
* Press `~` to go home.

## Installation

Using [Packer][] as plugin manager.

```lua
use 'lambda-larry/vim-vinegar.nvim'
```

[Packer]: https://github.com/wbthomason/packer.nvim
