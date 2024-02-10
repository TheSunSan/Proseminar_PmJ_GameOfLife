using ConwaysGameOfLife
import GLMakie

init_state = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
              0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
              0 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 0;
              0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
              0 0 1 0 0 0 0 1 0 1 0 0 0 0 1 0 0;
              0 0 1 0 0 0 0 1 0 1 0 0 0 0 1 0 0;
              0 0 1 0 0 0 0 1 0 1 0 0 0 0 1 0 0;
              0 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 0;
              0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
              0 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 0;
              0 0 1 0 0 0 0 1 0 1 0 0 0 0 1 0 0;
              0 0 1 0 0 0 0 1 0 1 0 0 0 0 1 0 0;
              0 0 1 0 0 0 0 1 0 1 0 0 0 0 1 0 0;
              0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
              0 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 0;
              0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
              0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]

gameboard = ConwaysGameOfLife.Gameboard(init_state)

for cell in gameboard.current_state[2:end-1,2:end-1]
    GLMakie.on(cell.button.clicks) do n
        if cell.button.buttoncolor.val == "black"
            cell.button.buttoncolor.val = "white"
            ConwaysGameOfLife.set_dead(cell)
        else
            cell.button.buttoncolor.val = "black"
            ConwaysGameOfLife.set_alive(cell)
        end
    end
end
GLMakie.on(gameboard.nextButton.clicks) do n
    ConwaysGameOfLife.update_game(gameboard)
end

wait(display(gameboard.fig))