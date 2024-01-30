# Conway's Game of Life
Conway's Game of Life is a cellular automaton created by John Horton Conway in 1970. It has the four following simple rules:
1. Any living cell with less than two living neighbouring cells dies.
2. Any living cell with two or three living neighbouring cells survives.
3. Any dead cell with three living neighbouring cells becomes alive.
4. Andy living cell with more than three living neighbouring cells dies.

## Installation

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/TheSunSan/Proseminar_PmJ_GameOfLife/edit/main/ConwaysGameOfLife/README.md
   ```
2. **Navigate to the Project Directory:**
   ```bash
   cd("Proseminar_PmJ_GameOfLife")
   cd("ConwaysGameOfLife")
   ```

## Running the Project

1. **Start Julia:**
   Open Julia REPL by running `julia` in your terminal.

2. **Activate and Instantiate the Project:**
   ```julia
   using Pkg
   Pkg.activate(".")
   Pkg.instantiate()
   ```

3. **Run the Project:**
   ```julia
   using SustainableSoftwareEngineering
   add(1,2)
   # 3
   ```

## Test the Project

1. **Start Julia:**
   Open Julia REPL by running `julia` in your terminal.

2. **Activate, Instantiate and Test the Project:**
   ```julia
   using Pkg
   Pkg.activate(".")
   Pkg.instantiate()
   Pkg.test()
   ```

## Build Documentation of Project

1. **Start Julia:**
   Open Julia REPL by running `julia` in your terminal.

2. **Activate, Instantiate and Test the Project:**
   ```julia
   using Pkg
   Pkg.activate(".")
   Pkg.instantiate()
   include("docs/make.jl")
   ```

3. **Open in browser**
   ```bash
   # e.g.
   firefox docs/build/index.html
   ```

## Troubleshooting

- Note that the following throws an error:
```julia
using SustainableSoftwareEngineering
add("a","b")
# ERROR: ...
```

## Example Files

- See [`examples` Folder](./examples)
