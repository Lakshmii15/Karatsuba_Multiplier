module karatsuba_16bit (
  input [15:0] A,
  input [15:0] B,
  output [31:0] Result
);

  reg [7:0] A1, A0, B1, B0;
  reg [15:0] P1, P2, P3;
  reg [7:0] I1;

  // Split the input numbers
  always @* begin
    {A1, A0} = A;
    {B1, B0} = B;
  end

  // Recursively compute three products
  always @* begin
    P1 = A1 * B1;
    P2 = A0 * B0;
    P3 = (A1 + A0) * (B1 + B0) - P1 - P2;
  end

  // Compute the intermediate term
 // always @* begin
   // I1 = P3[7:0] - P1[7:0] - P2[7:0];
  //end

  // Combine the results
  assign Result = {P1,P3,P2};

endmodule
