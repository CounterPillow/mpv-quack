quack
=====

quack is an mpv script to temporarily reduce the volume after a seek, in order to lessen the effect
of any dramatic Hollywood audio mixing (read: ear damage) when scrubbing through a movie.

The volume is linearly increased back up to its original level. Repeated seeks before the
transition is done work as well.


Installation
------------

Drop `quack.lua` into your scripts directory.


Configuration
-------------

There are two options which can be adjusted either by creating a `script-opts/quack.conf` with
`optionname=value` inside or by passing `--script-opts=quack-optionname=value` on the command line.

- `ducksecs`: Number of seconds that the effect should continue for (default: 2)
- `duckratio`: A value from 0.0 to 1.0 as a multiplier for how quiet the initial volume level
should be. For example, a value of `0.5` would start the reduced volume out at half the original
volume. (default: 0.5)


License
-------

GPLv3 because I can. See the file `LICENSE` for the full license text, which is larger than the
code it covers.
