mutable struct Cell
    x::Int64
    y::Int64
    neighbours::Array
    alive::Bool
    function Cell(x, y, neighbours = [], alive = false)
        @assert(x ≥ 0, "x is negative")
        @assert(y ≥ 0, "y is negative")
        new(x, y, neighbours, alive)
    end
end

function get_living_neighbours(cell)
    count = 0
    for c in cell.neighbours
        if c.alive
            count +=1
        end
    end
end

function update_cell_alive(cell)
    count = get_living_neighbours(cell)
    if 2 ≤ count ≤ 3
        return cell.alive
    else
        cell.alive = false
        return cell.alive
    end
end

function update_cell_dead(cell)
    count = get_living_neighbours(cell)
    if count == 3
        cell.alive = true
        return cell.alive
    else
        return cell.alive
    end
end

function update_cell(cell)
    if cell.alive
        update_cell_alive(cell)
    else
        update_cell_dead(cell)
    end
end