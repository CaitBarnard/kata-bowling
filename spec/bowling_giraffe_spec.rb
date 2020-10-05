class Bowling_Giraffe

    def initialize(board)
        @board = board
        @score = 0
    end

    def last_frame?(frame_key)
        frame_key == 10
    end

    def spare?(frame_key)
        @board[frame_key][0] + @board[frame_key][1] == 10
    end

    def strike?(frame_key)
        @board[frame_key][0] == 10
    end

    def scoring_points

        @board.each do |frame_key, rolls_value|

            if last_frame?(frame_key) == false
                if strike?(frame_key)
                    @score += @board[frame_key+1].sum
                elsif spare?(frame_key)
                    @score += @board[frame_key+1][0]
                end
            end
            @score += @board[frame_key].sum
        end
        @score
    end

end

describe "bowling_giraffe" do

    it "initializes an empty board" do
        board = { 
            1 => [0,0],
            2 => [0,0],
            3 => [0,0],
            4 => [0,0],
            5 => [0,0],
            6 => [0,0],
            7 => [0,0],
            8 => [0,0],
            9 => [0,0],
            10 => [0,0] }
            game = Bowling_Giraffe.new(board)
            expect(game.scoring_points).to eq(0)
    end
    
    it "returns score when first throw is 1" do
        board = { 
            1 => [1,0],
            2 => [0,0],
            3 => [0,0],
            4 => [0,0],
            5 => [0,0],
            6 => [0,0],
            7 => [0,0],
            8 => [0,0],
            9 => [0,0],
            10 => [0,0] }
            game = Bowling_Giraffe.new(board)
            expect(game.scoring_points).to eq(1)
    end

    it "returns score when first frame is 2" do
        board = { 
            1 => [1,1],
            2 => [0,0],
            3 => [0,0],
            4 => [0,0],
            5 => [0,0],
            6 => [0,0],
            7 => [0,0],
            8 => [0,0],
            9 => [0,0],
            10 => [0,0] }
            game = Bowling_Giraffe.new(board)
            expect(game.scoring_points).to eq(2)
    end

    it "returns score when multiple frames have points" do
        board = { 
            1 => [1,1],
            2 => [1,1],
            3 => [0,0],
            4 => [0,0],
            5 => [0,0],
            6 => [0,0],
            7 => [0,0],
            8 => [0,0],
            9 => [0,0],
            10 => [0,0] }
            game = Bowling_Giraffe.new(board)
            expect(game.scoring_points).to eq(4)
    end

    it "returns score when first frame is spare" do
        board = { 
            1 => [9,1],
            2 => [3,0],
            3 => [0,0],
            4 => [0,0],
            5 => [0,0],
            6 => [0,0],
            7 => [0,0],
            8 => [0,0],
            9 => [0,0],
            10 => [0,0] }
            game = Bowling_Giraffe.new(board)
            expect(game.scoring_points).to eq(16)
    end

    it "returns score when first frame is spare" do
        board = { 
            1 => [9,1],
            2 => [4,0],
            3 => [0,0],
            4 => [0,0],
            5 => [0,0],
            6 => [0,0],
            7 => [0,0],
            8 => [0,0],
            9 => [0,0],
            10 => [0,0] }
            game = Bowling_Giraffe.new(board)
            expect(game.scoring_points).to eq(18)
    end

    it "returns score when multiple spares" do
        board = { 
            1 => [9,1],
            2 => [1,9],
            3 => [1,0],
            4 => [0,0],
            5 => [0,0],
            6 => [0,0],
            7 => [0,0],
            8 => [0,0],
            9 => [0,0],
            10 => [0,0] }
            game = Bowling_Giraffe.new(board)
            expect(game.scoring_points).to eq(23)
    end

    it "returns score when spare in last frame" do
        board = { 
            1 => [0,0],
            2 => [0,0],
            3 => [0,0],
            4 => [0,0],
            5 => [0,0],
            6 => [0,0],
            7 => [0,0],
            8 => [0,0],
            9 => [0,0],
            10 => [9,1,0] }
            game = Bowling_Giraffe.new(board)
            expect(game.scoring_points).to eq(10)
    end

    it "returns score when spare in last frame" do
        board = { 
            1 => [0,0],
            2 => [0,0],
            3 => [0,0],
            4 => [0,0],
            5 => [0,0],
            6 => [0,0],
            7 => [0,0],
            8 => [0,0],
            9 => [0,0],
            10 => [9,1,3] }
            game = Bowling_Giraffe.new(board)
            expect(game.scoring_points).to eq(13)
    end

    it "returns score when strike" do
        board = { 
            1 => [10],
            2 => [2,2],
            3 => [0,0],
            4 => [0,0],
            5 => [0,0],
            6 => [0,0],
            7 => [0,0],
            8 => [0,0],
            9 => [0,0],
            10 => [0,0] }
            game = Bowling_Giraffe.new(board)
            expect(game.scoring_points).to eq(18)
    end

    it "returns score when multiple strikes" do
        board = { 
            1 => [10],
            2 => [10],
            3 => [2,2],
            4 => [0,0],
            5 => [0,0],
            6 => [0,0],
            7 => [0,0],
            8 => [0,0],
            9 => [0,0],
            10 => [0,0] }
            game = Bowling_Giraffe.new(board)
            expect(game.scoring_points).to eq(38)
    end

    it "returns score when multiple strikes" do
        board = { 
            1 => [0,0],
            2 => [0,0],
            3 => [0,0],
            4 => [0,0],
            5 => [0,0],
            6 => [0,0],
            7 => [0,0],
            8 => [0,0],
            9 => [0,0],
            10 => [10,2,3] }
            game = Bowling_Giraffe.new(board)
            expect(game.scoring_points).to eq(15)
    end

    it "returns score when 2 strikes in last frame" do
        board = { 
            1 => [0,0],
            2 => [0,0],
            3 => [0,0],
            4 => [0,0],
            5 => [0,0],
            6 => [0,0],
            7 => [0,0],
            8 => [0,0],
            9 => [0,0],
            10 => [10,10,3] }
            game = Bowling_Giraffe.new(board)
            expect(game.scoring_points).to eq(23)
    end

    xit "returns score when all strikes" do
        board = { 
            1 => [10],
            2 => [10],
            3 => [10],
            4 => [10],
            5 => [10],
            6 => [10],
            7 => [10],
            8 => [10],
            9 => [10],
            10 => [10,10,10] }
            game = Bowling_Giraffe.new(board)
            expect(game.scoring_points).to eq(300)
    end

end