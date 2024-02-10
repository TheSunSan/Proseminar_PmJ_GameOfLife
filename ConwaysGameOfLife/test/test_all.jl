using ConwaysGameOfLife
using Test

@testset "cell Tests" begin
    cell1 = ConwaysGameOfLife.Cell()
    cell2 = ConwaysGameOfLife.Cell()
    cell3 = ConwaysGameOfLife.Cell()
    cell4 = ConwaysGameOfLife.Cell()
    cell5 = ConwaysGameOfLife.Cell()

    # set 1, 2 and 3 alive
    ConwaysGameOfLife.set_alive(cell1)
    ConwaysGameOfLife.set_alive(cell2)
    ConwaysGameOfLife.set_alive(cell3)

    # set neighbours of 5
    ConwaysGameOfLife.set_neighbours(cell5, cell1)
    ConwaysGameOfLife.set_neighbours(cell5, cell2)
    ConwaysGameOfLife.set_neighbours(cell5, cell3)
    ConwaysGameOfLife.set_neighbours(cell5, cell4)

    @test ConwaysGameOfLife.get_living_neighbours(cell5) == 3
    @test ConwaysGameOfLife.should_update_cell_dead(cell5) == true
    @test ConwaysGameOfLife.should_update_cell_alive(cell5) == false
    @test ConwaysGameOfLife.should_update(cell5) == true

    # set 4 alive
    ConwaysGameOfLife.set_alive(cell4)

    @test ConwaysGameOfLife.get_living_neighbours(cell5) == 4
    @test ConwaysGameOfLife.should_update_cell_dead(cell5) == false
    @test ConwaysGameOfLife.should_update_cell_alive(cell5) == true
    @test ConwaysGameOfLife.should_update(cell5) == false

    # set 5 alive
    ConwaysGameOfLife.set_alive(cell5)
    @test ConwaysGameOfLife.get_living_neighbours(cell5) == 4
    @test ConwaysGameOfLife.should_update_cell_dead(cell5) == false
    @test ConwaysGameOfLife.should_update_cell_alive(cell5) == true
    @test ConwaysGameOfLife.should_update(cell5) == true

    # set 3 dead
    ConwaysGameOfLife.set_dead(cell3)
    
    @test ConwaysGameOfLife.get_living_neighbours(cell5) == 3
    @test ConwaysGameOfLife.should_update_cell_dead(cell5) == true
    @test ConwaysGameOfLife.should_update_cell_alive(cell5) == false
    @test ConwaysGameOfLife.should_update(cell5) == false

end

@testset "gameboard Tests" begin
    gameboard = ConwaysGameOfLife.Gameboard([0 1 0;
                                             1 1 1;
                                             0 1 0])

    @test gameboard.current_state[2,2].alive == false
    @test gameboard.current_state[3,3].alive == true
    @test gameboard.current_state[2,3].alive == true
    @test gameboard.current_state[2,4].alive == false

    # next iteration ([1 1 1; 1 0 1; 1 1 1])
    ConwaysGameOfLife.update_game(gameboard)

    @test gameboard.current_state[2,2].alive == true
    @test gameboard.current_state[3,3].alive == false
    @test gameboard.current_state[2,3].alive == true
    @test gameboard.current_state[2,4].alive == true

    # next iteration ([1 0 1; 0 0 0; 1 0 1])
    ConwaysGameOfLife.update_game(gameboard)

    @test gameboard.current_state[2,2].alive == true
    @test gameboard.current_state[3,3].alive == false
    @test gameboard.current_state[2,3].alive == false
    @test gameboard.current_state[2,4].alive == true
end