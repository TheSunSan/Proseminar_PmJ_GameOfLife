using GLMakie

function main()
    include("gameboard.jl")
    include("options.jl")

    println("Welcome to Conway's Game of Life. There are several start configurations to choose from.")
    println("Please note that you can freely edit the game in any of the start configurations, but the size is fixed.")
    println("")
    println("The options are: 'Empty', 'Random', 'Space-Cannon' and 'Pulsar'")
    println("")
    print("Please enter the option you want: ")
    option = readline()
    init_state = get_option(option)

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

    wait(display(gameboard.fig))
end