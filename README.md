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
docker run --rm -it -v $PWD:/airship -p 9800-9828:9800-9828 -p 9001:9001 airshipcms/launcher
```

## Windows

Navigate to your airship project directory.

```sh
cd Projects\my-airship-project
```

Use one of the following commands in your airship project directory when using Windows.

### Command Shell (cmd.exe)

Use this command in the Command Shell `cmd.exe`.

```sh
docker run --rm -it -v %cd%:/airship -p 9800-9828:9800-9828 -p 9001:9001 airshipcms/launcher
```

### PowerShell

Use this command in PowerShell.

```sh
docker run --rm -it -v "$($PWD):/airship" -p 9800-9828:9800-9828 -p 9001:9001 airshipcms/launcher
```
