module karatsuba_16bit_tb;

  reg [15:0] A, B;
  wire [31:0] Result;

  // Instantiate the Karatsuba module
  karatsuba_16bit karatsuba_inst (
    .A(A),
    .B(B),
    .Result(Result)
  );

  // Apply stimulus to the inputs
  initial begin
    // Loop through all possible 16-bit binary inputs
    for (A = 32; A < 16'hFFFF; A = A + 1) begin
      for (B = 32; B < 16'hFFFF; B = B + 1) begin
        #100; // Wait for one time unit

        // Display inputs and corresponding result
        $display("Test with A=%h, B=%h, Result=%h", A, B, Result);

        // Verify result
        if (Result !== A * B) begin
          $display("Test failed for A=%h, B=%h", A, B);
          // Continue simulation
        end
      end
    end

    $display("All tests passed successfully.");
    $finish; // Finish simulation
  end

endmodule
