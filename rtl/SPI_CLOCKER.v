`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CDAC Acts, Pune
// Date: August 2026
// Engineer: Pratik Jangale, Anshuman Singh, Om Thakur, Monesh Kamde, Aditya S
// Module Name: SPI_CLOCKER
// Project Name: AXI Lite to SPI Bridge 
// Description: SPI Clock Frequency generator for both SPI-Master and SPI-slaves.
// 
//////////////////////////////////////////////////////////////////////////////////

module SPI_CLOCKER
(
    input   wire    clkin,
    input   wire    reset,
    output  reg     clkout
);

    reg [2:0] counter;
    
    always @(posedge clkin  or  posedge reset)
    begin
        if(reset == 1)
        begin
            counter <= 0;
            clkout <= 0;
        end
        
        else if(clkin == 1)
        begin
            if(counter == 4)
            begin
                counter <= 0;
                clkout <= ~clkout;
            end
           
            else counter <= counter + 1;
        end
    end

endmodule
