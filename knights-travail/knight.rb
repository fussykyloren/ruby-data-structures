class Knight
    def move(starting_location)
        valid_moves = [
            [starting_location[0] + 2, starting_location[1] - 1],
            [starting_location[0] + 2, starting_location[1] + 1],
            [starting_location[0] - 2, starting_location[1] - 1],
            [starting_location[0] - 2, starting_location[1] + 1],
            [starting_location[0] + 1, starting_location[1] - 2],
            [starting_location[0] + 1, starting_location[1] + 2],
            [starting_location[0] - 1, starting_location[1] - 2],
            [starting_location[0] - 1, starting_location[1]  + 2]
        ]
    end
end