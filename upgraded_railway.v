module adaptive_railway (
    input clk,
    input reset,
    input sensor_A,
    input sensor_B,
    output reg gate,
    output reg signal
);

reg [2:0] state, next_state;
reg [3:0] timer;

parameter IDLE = 3'd0,
          APPROACH = 3'd1,
          PASSING = 3'd2,
          SAFETY_WAIT = 3'd3,
          CLEAR = 3'd4;

// State register
always @(posedge clk or posedge reset) begin
    if(reset)
        state <= IDLE;
    else
        state <= next_state;
end

// Timer logic
always @(posedge clk) begin
    if(state == SAFETY_WAIT)
        timer <= timer + 1;
    else
        timer <= 0;
end

// Next-state logic
always @(*) begin
    case(state)

        IDLE:
            next_state = sensor_A ? APPROACH : IDLE;

        APPROACH:
            next_state = PASSING;

        PASSING:
            next_state = sensor_B ? SAFETY_WAIT : PASSING;

        SAFETY_WAIT:
            next_state = (timer > 5) ? CLEAR : SAFETY_WAIT;

        CLEAR:
            next_state = IDLE;

        default:
            next_state = IDLE;
    endcase
end

// Output logic
always @(*) begin
    case(state)

        IDLE, CLEAR: begin
            gate = 0;
            signal = 0;
        end

        APPROACH, PASSING, SAFETY_WAIT: begin
            gate = 1;
            signal = 1;
        end
    endcase
end

endmodule
