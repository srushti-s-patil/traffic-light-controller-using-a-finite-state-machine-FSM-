module tb_traffic_light;
    reg clk, reset;
    wire [1:0] NS_light, EW_light;

    traffic_light_controller uut(.clk(clk), .reset(reset),
        .NS_light(NS_light), .EW_light(EW_light));

    always #5 clk = ~clk;

    initial begin
        $dumpfile("traffic_light.vcd");
        $dumpvars(0, tb_traffic_light);
        $monitor("At time %t, NS_light = %b, EW_light = %b", $time, NS_light, EW_light);
        clk = 0; reset = 1;
        #10 reset = 0;
        #200 $finish;
    end
endmodule