include("cell.jl")

cell1 = Cell() # leere neighbour, alive
cell2 = Cell() # leere neighbour, alive

cell3 = Cell() # 3 neighbours davon 1 alive, alive
set_alive(cell3)
cell4 = Cell() # 3 neighbours davon 1 alive, alive
set_alive(cell4)
set_neighbours(cell4, cell1)
set_neighbours(cell4, cell2)
set_neighbours(cell4, cell3)
set_neighbours(cell3, cell1)
set_neighbours(cell3, cell2)
set_neighbours(cell3, cell4)
set_neighbours(cell2, cell1)
set_neighbours(cell2, cell3)
set_neighbours(cell2, cell4)
set_neighbours(cell1, cell2)
set_neighbours(cell1, cell3)
set_neighbours(cell1, cell4)

# for c in cell4.neighbours
#     @show c
# end
set_alive(cell2)
set_alive(cell1)

@show get_living_neighbours(cell3)

@show get_living_neighbours(cell4)

# set_alive(cell2)
# @show get_living_neighbours(cell4)