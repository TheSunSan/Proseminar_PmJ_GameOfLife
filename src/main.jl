include("gameboard.jl")

init_state = fill(1, 10, 10)

gameboard1 = Gameboard(init_state)
for i in 1:gameboard1.gamesize[1]
    for j in 1:gameboard1.gamesize[2]
        on(gameboard1.current_state[i+1,j+1].button.clicks) do n
            if gameboard1.current_state[i+1,j+1].button.buttoncolor.val == "black"
                gameboard11.current_state[i+1,j+1].button.buttoncolor.val = "white"
                set_dead(gameboard1.current_state[i+1,j+1])
            else
                gameboard1.current_state[i+1,j+1].button.buttoncolor.val = "black"
                set_alive(gameboard1.current_state[i+1,j+1])
            end
        end
    end
end
@show gameboard1.initial_state
@show size(gameboard1.initial_state)
@show size(gameboard1.current_state)
update_game(gameboard1)
@show gameboard1.current_state[5,5].alive
gameboard1.fig