module railway(
    input clk,
    input reset,
    input train_detect,
    output reg gate,
    output reg signal
);

reg [1:0] state;

parameter IDLE = 2'b00,
          TRAIN_APPROACH = 2'b01,
          TRAIN_PASS = 2'b10;

always @(posedge clk or posedge reset) begin
    if (reset)
        state <= IDLE;
    else begin
        case(state)
            IDLE:
                if (train_detect)
                    state <= TRAIN_APPROACH;

            TRAIN_APPROACH:
                state <= TRAIN_PASS;

            TRAIN_PASS:
                state <= IDLE;
        endcase
    end
end

always @(*) begin
    case(state)
        IDLE: begin
            gate = 0;
            signal = 0;
        end
        TRAIN_APPROACH: begin
            gate = 1;
            signal = 1;
        end
        TRAIN_PASS: begin
            gate = 1;
            signal = 1;
        end
    endcase
end

endmodule
