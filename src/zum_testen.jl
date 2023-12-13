include("cell.jl")

initial_state = fill(1, 5, 5)
gamesize = size(initial_state)
temp_size = (gamesize[1]+2, gamesize[2]+2)
current_state = fill(Cell(), temp_size)
for i in 1:gamesize[1]
    for j in 1:gamesize[2]
        if initial_state[i,j] == 1
            set_alive(current_state[i+1,j+1])
        end
    end
end
neighbours = []
for k in 0:2
    for l in 0:2
        if k == 1 && l == 1
            continue
        end
        push!(neighbours, current_state[3+k,3+l])
        set_neighbours(current_state[3,3], current_state[3+k,3+l])
    end
end

@show initial_state
@show current_state[3,3].neighbours
@show get_living_neighbours(current_state[3,3])