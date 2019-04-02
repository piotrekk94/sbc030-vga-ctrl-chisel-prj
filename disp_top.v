module disp_top(
  input         clk,
  input         rstn,
  input  [1:0]  mode,
  input  [15:0] data,
  output [12:0] addr,
  output        oe,
  output        rw,
  output        hsync,
  output        vsync,
  output        r,
  output        g,
  output        b,
  output        ri,
  output        gi,
  output        bi
);

wire [1:0] red;
wire [1:0] green;
wire [1:0] blue;

reg rst_d;
reg rst_dd;

always@(posedge clk) rst_d <= ~rstn;
always@(posedge clk) rst_dd <= rst_d;

assign r = red[1];
assign ri = red[0];
assign g = green[1];
assign gi = green[0];
assign b = blue[1];
assign bi = blue[0];

DisplayController ctrl (
	.clock(clk),
	.reset(rst_dd),
	.io_mode(mode),
	.io_data(data),
	.io_addr(addr),
	.io_oe(oe),
	.io_rw(rw),
	.io_hsync(hsync),
	.io_vsync(vsync),
	.io_red(red),
	.io_green(green),
	.io_blue(blue)
);

endmodule
