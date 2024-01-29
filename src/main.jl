include("gameboard.jl")

init_state = zeros(20, 20)

gameboard = Gameboard(init_state)

for cell in gameboard.current_state[2:end-1,2:end-1]
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
on(gameboard.nextButton.clicks) do n
    update_game(gameboard)
end

gameboard.fig