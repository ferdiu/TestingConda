
# TestingConda

This is a minimal working example on how to use Conda inside Julia modules.

This includes an example on how to install packages not available from the
main repository of `pip` (`skfeature` package).

### Notes

There are 2 main scenarios which depends on the value assigned to the env
variable in `ENV["PYTHON"]` in julia REPL:

1. to use Conda environment you need to set `ENV["PYTHON"] = ""` and then
(re)build `PyCall`;
2. to use the _main_ python environment you need to set
`ENV["PYTHON"] = "/usr/bin/python"` and then (re)build `PyCall` and the install
dependencies manually for you user using `pip` as you would normally do to
them in python.
