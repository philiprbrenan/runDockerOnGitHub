#  Use Docker to isolate a Github Action on a local runner

Run a bash script inside a Docker container inside a Github action.  If you are
using a local runner this gives you a clean environment each time you run your
action regardless of whether you are running on a normal Github hosted runner
or your own locally hosted runner.
