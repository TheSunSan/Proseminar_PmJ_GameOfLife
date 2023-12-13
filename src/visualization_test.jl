using GLMakie

# state = [1 0 1
#          1 0 0
        #  1 0 0]
state = rand(Bool , 5, 5)

fig = Figure()

# ax = Axis(fig[1, 1])
# fig[2, 1] = buttongrid = GridLayout(tellwidth = false)

# counts = Observable([1, 4, 3, 7, 2])

# buttonlabels = [lift(x -> "Count: $(x[i])", counts) for i in 1:5]

# buttons = buttongrid[1, 1:5] = [Button(fig, label = l) for l in buttonlabels]

# for i in 1:5
#     on(buttons[i].clicks) do n
#         counts[][i] += 1
#         notify(counts)
#     end
# end

# barplot!(counts, color = cgrad(:Spectral)[LinRange(0, 1, 5)])
# ylims!(ax, 0, 20)

# heatmap(state)

# for i=1:3

alivecol = "black"
deadcol = "white"
boxsize = 25

colormatrix = [state[i,j] ? alivecol : deadcol for i=1:size(state)[1], j=1:size(state)[2]]

buttonlist = [
  Button(fig[i,j], label = "", width=boxsize, height=boxsize, buttoncolor=colormatrix[i,j], strokecolor="gray") for i=1:size(state)[1], j=1:size(state)[2]
]





for but in buttonlist
  on(but.clicks) do n
    println("click")
    if but.buttoncolor.val == alivecol
      but.buttoncolor = deadcol
    else
      but.buttoncolor = alivecol
    end
  end
end

map(i->rowsize!(fig.layout, i, boxsize), 1:size(state)[1])
map(i->colsize!(fig.layout, i, boxsize), 1:size(state)[2])
rowgap!(fig.layout, 0)
colgap!(fig.layout, 0)
fig