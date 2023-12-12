include("cell.jl")

mutable struct Gameboard
    initial_state::Matrix
    current_state::Matrix
    size::Tuple
    function Gameboard(initial_state)
        size = size(initial_state)
        temp_size = (size[1]+1, size[2]+1)
        current_state = fill(Cell(), temp_size)
        for i in 1:size[1]
            for j in 1:size[2]
                if initial_state[i,j] == 1
                    set_alive(current_state[i,j])
                end
                for k in 0:2
                    for j in 0:2
                        if k == 1 && j == 1
                            continue
                        end
                        set_neighbours(current_state[i,j], current_state[i-1+k,j-1+j])
                    end
                end
            end
        end
        new(initial_state, current_state, size)
    end
end

function update_game(Gameboard)
    size = Gameboard.size
    for i in 2:size[1]
        for j in 2:size[2]
            should_update(Gameboard.current_state[i,j])
        end
    end
    for i in 2:size[1]
        for j in 2:size[2]
            update_cell(Gameboard.current_state[i,j])
        end
    end
end