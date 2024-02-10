
"""
  get_option(option)
Returns different matrixes to use as an init_state for Conways Game of Life depending on 'option'. May require a readline() to determine the size.
# Arguments
- `option::String`: String to get the corresponding option
# Examples
```julia
julia> option = get_option("Random")
julia> option
rand([0,1], y_size, x_size)
```
"""
function get_option(option)
    if option == "Own_Matrix"
        println("Please note, that the Matrix needs to have a minimal x-Dimension of 2 and cannot be written over multiple lines. For example this would be a valid matrix: [1 1 0; 1 1 0; 0 0 0]")
        println("But this would not be:\n [1 1 0;\n 1 1 0;\n 0 0 0]")
        print("Enter your own Matrix here: ")
        init_state = readline()
        init_state = Meta.parse(init_state) |> eval
        return init_state
    end
    if option == "Empty"
        y_size, x_size = get_size()
        init_state = zeros(y_size, x_size)
        return init_state
    end
    if option == "Random"
        y_size, x_size = get_size()
        init_state = rand([0,1], y_size, x_size)
        return init_state
    end
    if option == "Space-Cannon"
        init_state = space_cannon()
        return init_state
    end
    if option == "Pulsar"
        init_state = pulsar()
        return init_state
    end
end

function get_size()
    print("Please enter your desired size of the y-Dimension: ")
    y_size = readline()
    y_size = parse(Int, y_size)
    print("Please enter your desired size of the x-Dimension: ")
    x_size = readline()
    x_size = parse(Int, x_size)
    return (y_size, x_size)
end

"""
  space_cannon()
Returns a matrix of a glider cannon to use as an init_state for Conways Game of Life
"""
function space_cannon()
    return [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 1;
            0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 1;
            1 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            1 1 0 0 0 0 0 0 0 0 1 0 0 0 1 0 1 1 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
            ]
end

"""
  space_cannon()
Returns a matrix of a pulsar to use as an init_state for Conways Game of Life
"""
function pulsar()
    return [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 0 1 0 0 0 0 1 0 1 0 0 0 0 1 0 0;
            0 0 1 0 0 0 0 1 0 1 0 0 0 0 1 0 0;
            0 0 1 0 0 0 0 1 0 1 0 0 0 0 1 0 0;
            0 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 0;
            0 0 1 0 0 0 0 1 0 1 0 0 0 0 1 0 0;
            0 0 1 0 0 0 0 1 0 1 0 0 0 0 1 0 0;
            0 0 1 0 0 0 0 1 0 1 0 0 0 0 1 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
            ]
end