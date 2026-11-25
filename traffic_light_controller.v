module traffic_light_controller(
    input clk, input reset,
    output reg [1:0] NS_light,  // 00 Red, 01 Yellow, 10 Green
    output reg [1:0] EW_light
);
    localparam S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
    reg [1:0] state, next_state;

    always @(posedge clk or posedge reset)
        if (reset) state <= S0;
        else       state <= next_state;

    always @(*) begin
        case (state)
            S0: next_state = S1;
            S1: next_state = S2;
            S2: next_state = S3;
            S3: next_state = S0;
            default: next_state = S0;
        endcase
    end

    always @(*) begin
        case (state)
            S0: begin NS_light = 2'b10; EW_light = 2'b00; end
            S1: begin NS_light = 2'b01; EW_light = 2'b00; end
            S2: begin NS_light = 2'b00; EW_light = 2'b10; end
            S3: begin NS_light = 2'b00; EW_light = 2'b01; end
            default: begin NS_light = 2'b00; EW_light = 2'b00; end
        endcase
    end
endmodule