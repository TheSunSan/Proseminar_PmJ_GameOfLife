include("cell.jl")

mutable struct Gameboard
    initial_state::Matrix
    current_state::Matrix
    gamesize::Tuple
    fig::Figure
    function Gameboard(initial_state)
        fig = Figure()
        alivecol = "black"
        deadcol = "white"
        boxsize = 25
        gamesize = size(initial_state)
        temp_size = (gamesize[1]+2, gamesize[2]+2)
        current_state = fill(Cell(), temp_size)
        for i in 1:gamesize[1]
            for j in 1:gamesize[2]
                if initial_state[i,j] == 1
                    set_alive(current_state[i+1,j+1])
                    set_button(current_state[i+1,j+1], Button(fig[i,j], label = "", width = boxsize, height = boxsize, buttoncolor = alivecol, strokecolor = "gray"))
                else
                    set_button(current_state[i+1,j+1], Button(fig[i,j], label = "", width = boxsize, height = boxsize, buttoncolor = deadcol, strokecolor = "gray"))
                end
                for k in 0:2
                    for l in 0:2
                        if k == 1 && l == 1
                            continue
                        end
                        set_neighbours(current_state[i+1,j+1], current_state[i+k,j+l])
                    end
                end
            end
        end
        map(i->rowsize!(fig.layout, i, boxsize), 1:gamesize[1])
        map(i->colsize!(fig.layout, i, boxsize), 1:gamesize[2])
        rowgap!(fig.layout, 0)
        colgap!(fig.layout, 0)
        new(initial_state, current_state, gamesize, fig)
    end
end

function update_game(Gameboard)
    gamesize = Gameboard.gamesize
    for i in 1:gamesize[1]
        for j in 1:gamesize[2]
            should_update(Gameboard.current_state[i+1,j+1])
        end
    end
    for i in 1:gamesize[1]
        for j in 1:gamesize[2]
            update_cell(Gameboard.current_state[i+1,j+1])
        end
    end
end