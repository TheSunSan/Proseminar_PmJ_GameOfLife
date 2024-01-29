include("gameboard.jl")
include("options.jl")

println("Welcome to Conway's Game of Life. There are several start configurations to choose from.")
println("Please notice that you can freely edit the game in any of the start configurations, but the size is fixed.")
println("")
println("The options are: 'Empty', 'Space-Cannon' and 'Pulsar'")
println("")
print("Please enter the option you want: ")
option = readline()

if option == "Empty"
    print("Please enter your desired size of the y-Dimension: ")
    y_size = readline()
    y_size = parse(Int, y_size)
    print("Please enter your desired size of the x-Dimension: ")
    x_size = readline()
    x_size = parse(Int, x_size)
    init_state = zeros(y_size, x_size)
end
if option == "Space-Cannon"
    init_state = space_cannon()
end
if option == "Pulsar"
    init_state = pulsar()
end

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