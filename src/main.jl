include("gameboard.jl")

init_state = rand([0,1], 5, 5)

gameboard1 = Gameboard(init_state)
# for i in 1:gameboard1.gamesize[1]
#     for j in 1:gameboard1.gamesize[2]
#         on(gameboard1.current_state[i+1,j+1].button.clicks) do n
#             if gameboard1.current_state[i+1,j+1].button.buttoncolor.val == "black"
#                 gameboard1.current_state[i+1,j+1].button.buttoncolor.val = "white"
#                 set_dead(gameboard1.current_state[i+1,j+1])
#             else
#                 gameboard1.current_state[i+1,j+1].button.buttoncolor.val = "black"
#                 set_alive(gameboard1.current_state[i+1,j+1])
#             end
#         end
#     end
# end
for cell in gameboard1.current_state[2:end-1,2:end-1]
    on(cell.button.clicks) do n
        if cell.button.buttoncolor.val == "black"
            cell.button.buttoncolor.val = "white"
            set_dead(cell)
        else
            cell.button.buttoncolor.val = "black"
            set_alive(cell)
        end
    end
end
on(gameboard1.nextButton.clicks) do n
    update_game(gameboard1)
end



# strut Test2
# end
# Test = Test2



# for cell in gameboard1.current_state[2:end-1,2:end-1]
# @info ce

@show gameboard1.initial_state
@show size(gameboard1.initial_state)
@show size(gameboard1.current_state)
# update_game(gameboard1)
@show gameboard1.current_state[2,2].neighbours
@show get_living_neighbours(gameboard1.current_state[4,4])
@show gameboard1.current_state[2,2].alive
gameboard1.fig