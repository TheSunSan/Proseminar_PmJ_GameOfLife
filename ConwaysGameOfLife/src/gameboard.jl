include("cell.jl")


"""
This mutable struct initializes and contains all the information needed to simulate Conways Game of Life

# Fields
- 'initial_state::Matrix': Matrix filled with 0's and 1's. 0's are initialized as dead cells and 1's as living cells on their respective position in the matrix.
- 'current_state::Matrix': A matrix of the current_iteration of the game. Every entry is of type 'Cell' and contains the relevant information for the next iteration.
- 'game_size::Tuple': A tuple with the dimensions of 'initial_state' in form of (y,x)
- 'fig::Figure': A GLMakie 'Figure' to visualize the game
- 'nextButton::Button': A GLMakie 'Button' to initialize the next iteration
"""
mutable struct Gameboard
    initial_state::Matrix
    current_state::Matrix
    gamesize::Tuple
    fig::Figure
    nextButton::Button
    function Gameboard(initial_state)
        fig = Figure()
        alivecol = "black"
        deadcol = "white"
        boxsize = 25
        gamesize = size(initial_state)
        temp_size = (gamesize[1]+2, gamesize[2]+2)
        current_state = fill(Cell(), temp_size)
        nextButton = Button(fig[gamesize[1]+1, gamesize[2]+1], label = "Next", width = 40, height = boxsize, buttoncolor = "white", strokecolor = "black")
        for i in 1:temp_size[1]
            current_state[i,1] = Cell()
            current_state[i,temp_size[2]] = Cell()
        end
        for i in 1:temp_size[2]
            current_state[1,i] = Cell()
            current_state[temp_size[1],i] = Cell()
        end
        for i in 2:gamesize[1]+1
            for j in 2:gamesize[2]+1
                if initial_state[i-1,j-1] == 1
                    current_state[i,j] = Cell()
                    set_alive(current_state[i,j])
                    set_button(current_state[i,j], Button(fig[i-1,j-1], label = "", width = boxsize, height = boxsize, buttoncolor = alivecol, strokecolor = "gray"))
                else
                    current_state[i,j] = Cell()
                    set_button(current_state[i,j], Button(fig[i-1,j-1], label = "", width = boxsize, height = boxsize, buttoncolor = deadcol, strokecolor = "gray"))
                end
                for k in 0:1
                    for l in 0:2
                        if k == 1 && l > 0
                            continue
                        end
                        set_neighbours(current_state[i,j], current_state[i+k-1,j+l-1])
                    end
                end
                set_neighbours(current_state[i,j-1], current_state[i,j])
                set_neighbours(current_state[i-1,j], current_state[i,j])
                set_neighbours(current_state[i-1,j-1], current_state[i,j])
                set_neighbours(current_state[i-1,j+1], current_state[i,j])
            end
        end
        map(i->rowsize!(fig.layout, i, boxsize), 1:gamesize[1])
        map(i->colsize!(fig.layout, i, boxsize), 1:gamesize[2])
        rowgap!(fig.layout, 0)
        colgap!(fig.layout, 0)
        new(initial_state, current_state, gamesize, fig, nextButton)
    end
end

"""
  update_game(gameboard)
initializes the next iteration of Conways Game of Life
# Arguments
- `gameboard::Gameboard`: The current iteration of the gameboard
"""
function update_game(gameboard)
    gamesize = gameboard.gamesize
    for i in 1:gamesize[1]
        for j in 1:gamesize[2]
            should_update(gameboard.current_state[i+1,j+1])
        end
    end
    for i in 1:gamesize[1]
        for j in 1:gamesize[2]
            update_cell(gameboard.current_state[i+1,j+1])
        end
    end
end