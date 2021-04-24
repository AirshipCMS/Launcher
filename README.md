# Airship Launcher with Docker

Building Dockerfile pulls latest Linux64 bins from https://install.airshipcms.io

```sh
docker build -t airshipcms/launcher:latest .
```

# Running with Docker

Run airship in Docker, mounting the current working directory into the container, and listen on port 9001.
Wen you run `airship login <subdomain>` you will be asked to open a secured authentication url in your browser.
When you run `airship serve`, open http://localhost:9001 to view your site.

## OSX / Linux / WSL

Navigate to your airship project directory.

```sh
cd ~/Projects/my-airship-project
```

Use this command in your airship project directory when using OSX, Linux, or Windows Subsystem Linux.

```sh
docker run --rm -it \
  -v $PWD:/srv \
  -v ~/.airship-sessions:/home/.airship-sessions \
  -p 9800-9828:9800-9828 \
  -p 9001:9001 \
  airshipcms/launcher
```

## Windows

Navigate to your airship project directory.

```sh
cd Projects\my-airship-project
```

Use one of the following commands in your airship project directory when using Windows.

### PowerShell

Use this command in PowerShell.

```sh
docker run --rm -it `
  -v "$($PWD):/srv" `
  -v "$($PWD)\.airship-sessions:/home/.airship-sessions" `
  -p 9800-9828:9800-9828 `
  -p 9001:9001 `
  airshipcms/launcher
```

### Command Shell (cmd.exe)

Use this command in the Command Shell `cmd.exe`.

```sh
docker run --rm -it ^
  -v %cd%:/srv ^
  -v %cd%/.airship-sessions:/home/.airship-sessions ^
  -p 9800-9828:9800-9828 ^
  -p 9001:9001 ^
  airshipcms/launcher
```
# Explanation

Understand each option being used in the `docker` command.

```sh
docker run             # Run a command in a new container.

--rm                   # Automatically remove the container when it exits.

-it                    # Short for -i --interactive and -t --tty.
                       # -i keep STDIN open even if not attached.
                       # -t allocate a pseudo-TT.

-v $PWD:/srv           # Bind mount the current directory as a volume
                       # mounted in the container to /srv.
                       # This allows the container to read and write
                       # files in your airship project directory.

-v ~/.airship-sessions:/home/.airship-sessions
                       # Optional.
                       # Bind mount ~/.airship-sessions as a volume
                       # mounted in the container to /home/.airship-sessions.
                       # This is optional, though recommended.
                       # This enables you to preserve an active
                       # airship session after exiting the container.
                       # This also maintains compatibility with native
                       # airship launcher.

-p 9800-9828:9800-9828
                       # Publish the container's ports 9800-9828 to the host.
                       # This is required for secure authentication
                       # using `airship login`.

-p 9001:9001           # Publish the container's ports 9001:9001 to the host.
                       # This is required for browsing your airship site
                       # when using `airship serve`.
                       # You may configure this to bind to a different
                       # port on the host.
                       # For example, to listen on port 8080,
                       # use `-p 8080:9001` then navigate to
                       # http://localhost:8080.

airshipcms/launcher    # The docker image name to run.
                       # See https://hub.docker.com/r/airshipcms/launcher
``
