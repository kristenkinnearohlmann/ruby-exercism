=begin
Write your code for the 'Minesweeper' exercise in this file. Make the tests in
`minesweeper_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/minesweeper` directory.
=end
class Board

    def self.transform(inp)
        # get location of mines
        # check non-mine squares and total
        out = []
        first_row_length = inp[0].length

        raise ArgumentError if inp[0] != inp[inp.length-1] 
        inp.each_with_index do |row, index|
            raise ArgumentError if row.length != first_row_length || row.match(/[^\s\*\+\|\-]/)
            row_nbr = index

            if row_nbr == 0 || row_nbr == inp.length-1
                out.push(row)
            else
                row_values = []
                row.split("").each_with_index do |position, index|
                    if position.match(/\s/)
                        chk_val = 0
                        # check clockwise
                        chk_val += 1 if inp[row_nbr-1][index] == "*"
                        chk_val += 1 if inp[row_nbr-1][index+1] == "*"
                        chk_val += 1 if inp[row_nbr][index+1] == "*"
                        chk_val += 1 if inp[row_nbr+1][index+1] == "*"
                        chk_val += 1 if inp[row_nbr+1][index] == "*"
                        chk_val += 1 if inp[row_nbr+1][index-1] == "*"
                        chk_val += 1 if inp[row_nbr][index-1] == "*"
                        chk_val += 1 if inp[row_nbr-1][index-1] == "*"
                        row_val = chk_val == 0 ? " " : chk_val.to_s
                    else
                        row_val = position
                    end
                    row_values.push(row_val)
                end
                out.push(row_values.join)
            end
        end
        out
    end

end