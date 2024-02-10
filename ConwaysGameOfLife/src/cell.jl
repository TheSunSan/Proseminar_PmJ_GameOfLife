using GLMakie

"""
This mutable struct initializes and contains all the information needed to simulate a single cell in Conways Game of Life

# Fields
- 'neighbours::Array': An array with all neighbours of the cell
- 'alive::Bool': A bool stating whether the cell is alive or note
- 'update::Bool': A bool stating wheter the cell should be updated in the next iteration
- 'button::Button': A GLMakie button to visualize the cell
"""
mutable struct Cell
    neighbours::Array
    alive::Bool
    update::Bool
    button::Button
    function Cell(neighbours = [], alive = false)
        update = false
        new(neighbours, alive, update)
    end
end

"""
  set_dead(cell)
Sets the alive attribute of 'cell' to false
# Arguments
- `cell::Cell`: The cell to be set dead
# Examples
```julia
julia> cell = Cell()
julia> set_dead(cell)
julia> cell.alive
false
```
"""
function set_alive(cell)
    cell.alive = true
    return cell.alive
end

"""
  set_alive(cell)
Sets the alive attribute of 'cell' to true
# Arguments
- `cell::Cell`: The cell to be set alive
# Examples
```julia
julia> cell = Cell()
julia> set_alive(cell)
julia> cell.alive
true
```
"""
function set_dead(cell)
    cell.alive = false
    return cell.alive
end

"""
  set_neighbours(cell, neighbours)
Appends a 'neighbours' to the neighbours array of 'cell'
# Arguments
- `cell::Cell`: The cell to change the button
- `neighbours::Cell`: The cell to be added to neighbours
# Examples
```julia
julia> cell = Cell()
julia> cell_new = Cell()
julia> set_neighbours(cell,cell_new)
julia> cell.neighbours
Array([cell_new])
```
"""
function set_neighbours(cell, new_neighbours)
    cell.neighbours = push!(cell.neighbours, new_neighbours)
    return cell.neighbours
end

"""
  set_button(cell, button)
Sets the button attribute of 'cell' to 'button'. The button is from the GLMakie package
# Arguments
- `cell::Cell`: The cell to change the button
- `button::Button`: The button to be set to the cell
# Examples
```julia
julia> cell = Cell()
julia> fig = Figure()
julia> green_button = Button(fig[1,1], buttoncolor = green)
julia> set_button(cell,button)
julia> cell.button
green_button
```
"""
function set_button(cell, button)
    cell.button = button
    return cell.button
end

"""
  get_living_neighbours(cell)
Returns the number of living cells in the neighbours Array of 'cell'
# Arguments
- `cell::Cell`: The cell to be checked
# Examples
```julia
julia> cell = Cell()
julia> cell1 = Cell()
julia> set_alive(cell1)
julia> cell2 = Cell()
julia> set_dead(cell2)
julia> set_neighbours(cell,cell1)
julia> set_neighbours(cell,cell2)
julia> get_living_neighbours(cell)
1
```
"""
function get_living_neighbours(cell)
    count = 0
    for c in cell.neighbours
        if c.alive
            count +=1
        end
    end
    return count
end

"""
  should_update_cell_alive(cell)
Checks whether 'cell' should be updated for the next iteration of Conways Game of Life assuming 'cell.alive = true' 
# Arguments
- `cell::Cell`: The cell to be checked
# Examples
```julia
julia> should_update_cell_alive(cell_with_four_living_neighbours)
true
```
```julia
julia> should_update_cell_alive(cell_with_three_living_neighbours)
false
```
```julia
julia> should_update_cell_alive(cell_with_one_living_neighbour)
true
```
"""
function should_update_cell_alive(cell)
    count = get_living_neighbours(cell)
    if 2 ≤ count ≤ 3
        return false
    else
        return true
    end
end

"""
  should_update_cell_dead(cell)
Checks whether 'cell' should be updated for the next iteration of Conways Game of Life assuming 'cell.alive = false'
# Arguments
- `cell::Cell`: The cell to be checked
# Examples
```julia
julia> should_update_cell_dead(cell_with_four_living_neighbours)
false
```
```julia
julia> should_update_cell_dead(cell_with_three_living_neighbours)
true
```
```julia
julia> should_update_cell_dead(cell_with_two_living_neighbour)
false
```
"""
function should_update_cell_dead(cell)
    count = get_living_neighbours(cell)
    if count == 3
        return true
    else
        return false
    end
end

"""
  should_update_cell(cell)
Checks whether 'cell' should be updated for the next iteration of Conways Game of Life
# Arguments
- `cell::Cell`: The cell to be checked
# Examples
```julia
julia> should_update_cell(living_cell_with_four_living_neighbours)
false
```
```julia
julia> should_update_cell(dead_cell_with_three_living_neighbours)
true
```
```julia
julia> should_update_cell(living_cell_with_two_living_neighbour)
false
```
"""
function should_update(cell)
    if cell.alive
        if should_update_cell_alive(cell)
            cell.update = true
            return cell.update
        else
            cell.update = false
            return cell.update
        end
    else
        if should_update_cell_dead(cell)
            cell.update = true
            return cell.update
        else
            cell.update = false
            return false
        end
    end
end

"""
  update_cell(cell)
Updates the 'color' and 'alive' attribute of 'cell' if the 'update' attribute is true. White, dead cells will become black, alive cells and vice versa.
# Arguments
- `cell::Cell`: The cell to be updated
# Examples
```julia
julia> update_cell(white_dead_cell_update_true)
true
```
```julia
julia> update_cell(white_dead_cell_update_false)
false
```
```julia
julia> update_cell(black_alive_cell_update_true)
true
```
"""
function update_cell(cell)
    if cell.update
        if cell.alive
            set_dead(cell)
            cell.button.buttoncolor = "white"
        else
            set_alive(cell)
            cell.button.buttoncolor = "black"
        end
        return true
    end
    return false
end