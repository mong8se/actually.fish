# Actually.fish

![A cat saying "umm... actually" and pushing up its nerd glasses](https://media.giphy.com/media/RMwZypp489fuGBI0Ti/giphy.gif)

## What is it?

Idea shamelessly stolen from:
[EinfachToll/DidYouMean](https://github.com/EinfachToll/DidYouMean) and
applied to changing directories in fish shell.

## What it do?

Let's say you want to change directory to `somedir`, so you type:

```fish

$ cd some<TAB><CR>

```

But! You forgot about the existence of `some_other_dir`! (heck maybe
there is even a `some_forgotten_dir`)
After the `<TAB>` the shell prompted you to disambiguate ... but you
already swiftly hit `<CR>` so you get an error:
`cd: The directory “some” does not exist`
... womp womp

But wait! With this plugin you'll get a prompt asking you if you
actually want to choose `somedir` or `some_other_dir` (or however many
matches)

But don't worry, you can cancel if none of it is what you wanted.

![a demo of the plugin in action](https://i.imgur.com/Alvjz3R.gif)

## How I install?

The regular way.

```fish
fisher install "mong8se/actually.fish"
```

## How I configure

Ain't none.

## Dependencies?

Hard dependency on `find` command.

Soft dependency on [fzf](https://github.com/junegunn/fzf) (if you don't have it, it'll fall back to a
fish `read` prompt)

Even softer on [lsd](https://github.com/Peltoche/lsd) (if you have fzf, it'll preview the directories
with `lsd` if you have it but fallback to `ls` if not)

## Also

If you like this you might also like
[actually.nvim](https://github.com/mong8se/actually.nvim) which is the
same concept but for opening files in nvim from the command line.


TODO: Cleanup
TODO: Windows Operating System!?
