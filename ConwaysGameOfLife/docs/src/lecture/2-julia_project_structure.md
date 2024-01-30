# Julia: Project Structure

This lecture focuses on the structure and management of Julia-specific projects. We will cover how to create a project using the Package Manager, the purpose of various directories and files, and best practices for maintaining a Julia project.


## Creating a Project Using Package Manager

- Using the Julia REPL and the Package Manager (`Pkg`)
- Example command:

```
julia> # Press `]` button to go to pkg mode
pkg> generate MyProject
```

## Key Folders in a Julia Project

### `src` Folder

- The `src` folder: Where the source code lives
- Structure and naming conventions for source files
- Can contain multiple files (modules)

### `docs` Folder

- Where the Documentation of the project lives
- Tools for generating documentation in Julia, e.g., `Documenter.jl`

### `examples` Folder

- The `examples` folder: Contains example scripts and notebooks
- Demonstrating usage and features of the project

### `test` Folder

- The folder containing unit tests in the file `runtests.jl`, explained later

## README File

- Every Git needs a `README.md` file, first starting point when someone opens the repo
- Key elements to include: project description, installation instructions, usage examples, contact info, ...

## Project.toml and Manifest.toml

- `Project.toml`: Managing project dependencies and environment settings
  - Activate ($\Leftrightarrow$ download and use all external packages from `Project.toml`)
```julia
using Pkg
Pkg.activate(".")  # or press "]" to go into pkg mode and then type "actiavate" and hit enter
# Activating project at `~/Desktop/gits/nmh/SustainableSoftwareEngineering.jl`
```
- `Manifest.toml`: Detailed state of the environment for reproducibility (not necessarily needed in Git)

### What, what is TOML?
TOML (Tom's Obvious, Minimal Language) is a simple, easy-to-read configuration file format. Designed by Tom Preston-Werner in 2013, it aims to be more human-readable and writable than formats like XML or JSON.
```toml
# This is a TOML document

title = "TOML Example"

[owner]  # a table => key-value pairs
name = "Tom Preston-Werner"
dob = 1979-05-27T07:32:00-08:00

[database]  # another table
enabled = true
ports = [ 8000, 8001, 8002 ]
data = [ ["delta", "phi"], [3.14] ]
temp_targets = { cpu = 79.5, case = 72.0 }

[servers]

[servers.alpha]
ip = "10.0.0.1"
role = "frontend"

[servers.beta]
ip = "10.0.0.2"
role = "backend"
```

## Optional Files

### LICENSE

- Adding a `LICENSE` file: Types of licenses and their implications

### CODE_OF_CONDUCT

- The importance of a `CODE_OF_CONDUCT.md` file
- Fostering an inclusive and respectful community

---

In conclusion, a well-structured Julia project not only facilitates development and collaboration but also ensures the reproducibility and integrity of the project. The use of `Project.toml` and `Manifest.toml` files in conjunction with the Julia Package Manager plays a crucial role in managing dependencies and maintaining a consistent project environment.

Consider this repository as template/good-practise!

For further reading and resources, refer to the [Julia documentation](https://docs.julialang.org/).

