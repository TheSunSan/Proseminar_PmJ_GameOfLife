
# Julia: Testing



## Importance of Testing

- Why testing is crucial in software development: Have working version in Git, document intended behavior of functions
- Types of tests: Unit tests, integration tests, etc.

## Unit Tests in Julia

- Using the `Test` standard library.

### Writing Unit Tests

- Basic structure of a unit test: Valid Julia code with macro annotations (`@`)
- Assertions: `@test`, `@test_throws`, `@testset`, etc.

### Example: Unit Test Tutorial

Let's create a simple function and write tests for it:

#### The Function

```julia
function add(a, b)
    return a + b
end
```

#### Test File

Create a file named `test_add.jl`:

```julia
using Test
using SustainableSoftwareEngineering

@testset "Addition Tests" begin
    @test add(2, 2) == 4
    @test add(-1, 1) == 0
    @test add(0, 0) == 0
    @test_throws DomainError add("a", "b")
end
```

This example demonstrates basic unit testing by checking various scenarios for the `add` function.

## Invoking the Written Tests

### Running Tests Locally

Once you have written your tests, it's important to know how to run them to check if your code behaves as expected.

#### Using Julia's Interactive Session (REPL)

1. **Start Julia's REPL**: Open a terminal and run `julia` to start the interactive session.
2. **Activate the Project**: If your project has a specific environment, activate it by using `using Pkg; Pkg.activate("path_to_your_project")`.
3. **Run the Tests**: Use `Pkg.test()` to run all tests in the test directory of the project.

#### Using the Command Line

Alternatively, you can run your tests directly from the command line without entering the REPL:

- Navigate to your project directory.
- Run `julia --project=@. -e 'using Pkg; Pkg.test()'` (`@.` means to search for a folder with a `Project.toml` btw)

This command will execute all tests defined in your project's `test` directory.

#### An example output

The above testing file would yield a successful output:
```julia
julia> include("test/runtests.jl")
# Test Summary:  | Pass  Total  Time
# Addition Tests |    4      4  0.0s
```

However, changing the above test file to:

```julia
using Test
using SustainableSoftwareEngineering

@testset "Addition Tests" begin
    @test add(2, 2) == 4
    @test add(-1, 1) == 0
    @test add(0, 0) == 1  # changed 🚨
    @test_throws DomainError add("a", "b")
end
```

would result in an error:

```julia
# Addition Tests: Test Failed at XXX/gits/nmh/SustainableSoftwareEngineering.jl/test/test_add.jl:7
#   Expression: add(0, 0) == 1
#    Evaluated: 0 == 1
#
# Stacktrace:
#  [1] macro expansion
#    @ /usr/local/Cellar/julia/1.9.3/share/julia/stdlib/v1.9/Test/src/Test.jl:478 [inlined]
#  [2] macro expansion
#    @ ~/Desktop/gits/nmh/SustainableSoftwareEngineering.jl/test/test_add.jl:7 [inlined]
#  [3] macro expansion
#    @ /usr/local/Cellar/julia/1.9.3/share/julia/stdlib/v1.9/Test/src/Test.jl:1498 [inlined]
#  [4] top-level scope
#    @ ~/Desktop/gits/nmh/SustainableSoftwareEngineering.jl/test/test_add.jl:5
# Test Summary:  | Pass  Fail  Total  Time
# Addition Tests |    3     1      4  0.8s
```

## Optional

### Test Coverage
- Adding coverage metrics to your test suite.
- Interpreting coverage reports to improve test quality.

### Automatic Testing with Continuous Integration
- Using CI for automatic testing whenever a commit happened in Git

## Further reading

- For more detailed information, you can refer to the [Julia documentation on testing](https://docs.julialang.org/en/v1/stdlib/Test/).
