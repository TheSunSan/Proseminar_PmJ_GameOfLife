using GLMakie

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

function set_alive(cell)
    cell.alive = true
    return cell.alive
end

function set_dead(cell)
    cell.alive = false
    return cell.alive
end

function set_neighbours(cell, new_neighbours)
    cell.neighbours = push!(cell.neighbours, new_neighbours)
    return cell.neighbours
end

function set_button(cell, button)
    cell.button = button
    return cell.button
end

function get_living_neighbours(cell)
    count = 0
    for c in cell.neighbours
        if c.alive
            count +=1
        end
    end
    return count
end

function should_update_cell_alive(cell)
    count = get_living_neighbours(cell)
    if 2 ≤ count ≤ 3
        return false
    else
        return true
    end
end

function should_update_cell_dead(cell)
    count = get_living_neighbours(cell)
    if count == 3
        return true
    else
        return false
    end
end

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

function update_cell(cell)
    if cell.update
        if cell.alive
            cell.button.buttoncolor.val = "white"
            set_dead(cell)
        else
            cell.button.buttoncolor.val = "black"
            set_alive(cell)
        end
        return true
    end
    return false
end