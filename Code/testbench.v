module testbench;
    reg clk;
    reg reset;
    reg car_entered;
    reg is_uni_car_entered;
    reg car_exited;
    reg is_uni_car_exited;
    wire [9:0] uni_parked_car;
    wire [9:0] parked_car;
    wire [9:0] uni_vacated_space;
    wire [9:0] vacated_space;
    wire uni_is_vacated_space;
    wire is_vacated_space;

    parking_management uut (
        .clk(clk),
        .reset(reset),
        .car_entered(car_entered),
        .is_uni_car_entered(is_uni_car_entered),
        .car_exited(car_exited),
        .is_uni_car_exited(is_uni_car_exited),
        .uni_parked_car(uni_parked_car),
        .parked_car(parked_car),
        .uni_vacated_space(uni_vacated_space),
        .vacated_space(vacated_space),
        .uni_is_vacated_space(uni_is_vacated_space),
        .is_vacated_space(is_vacated_space)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        car_entered = 0;
        is_uni_car_entered = 0;
        car_exited = 0;
        is_uni_car_exited = 0;

        // Apply reset
        #10 reset = 0;

        // Simulate car entry and exit
        #10 car_entered = 1; is_uni_car_entered = 1;
        #10 car_entered = 0;
        #10 car_entered = 1; is_uni_car_entered = 0;
        #10 car_entered = 0;
        #10 car_exited = 1; is_uni_car_exited = 1;
        #10 car_exited = 0;
        #10 car_exited = 1; is_uni_car_exited = 0;
        #10 car_exited = 0;

        // End simulation
        #50 $finish;
    end
endmodule
