/*
 *  PicoSoC - A simple example SoC using PicoRV32
 *
 *  Copyright (C) 2017  Claire Xenia Wolf <claire@yosyshq.com>
 *
 *  Permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 */

`ifdef PICOSOC_V
`error "picomax.v must be read before picosoc.v!"
`endif

module picomax (
	input clk,
	input user,

	output ser_tx,
	input ser_rx,

	output led0,
	output led1,
	output led2,
	output led3,
	output led4,
	output led5,
	output led6,
	output led7
);
	parameter integer MEM_WORDS = 4096;

	reg user_r;
	reg [7:0] reset_cnt;
	reg resetn;

	always @(posedge clk) begin
		user_r <= user;
		resetn <= !(|reset_cnt);
		if (user_r) begin
			if (|reset_cnt) begin
				reset_cnt <= reset_cnt -1;
			end
		end else begin
			reset_cnt <= 8'hFF;
		end
	end

	wire [7:0] leds;

	assign led0 = leds[0];
	assign led1 = leds[1];
	assign led2 = leds[2];
	assign led3 = leds[3];
	assign led4 = leds[4];
	assign led5 = leds[5];
	assign led6 = leds[6];
	assign led7 = leds[7];

	wire        iomem_valid;
	reg         iomem_ready;
	wire [3:0]  iomem_wstrb;
	wire [31:0] iomem_addr;
	wire [31:0] iomem_wdata;
	reg  [31:0] iomem_rdata;

	reg [31:0] gpio;
	assign leds = gpio;

	always @(posedge clk) begin
		if (!resetn) begin
			gpio <= 32'h69;
		end else begin
			iomem_ready <= 0;
			if (iomem_valid && !iomem_ready && iomem_addr[31:24] == 8'h C3) begin
				iomem_ready <= 1;
				iomem_rdata <= gpio;
				if (iomem_wstrb[0]) gpio[ 7: 0] <= iomem_wdata[ 7: 0];
				if (iomem_wstrb[1]) gpio[15: 8] <= iomem_wdata[15: 8];
				if (iomem_wstrb[2]) gpio[23:16] <= iomem_wdata[23:16];
				if (iomem_wstrb[3]) gpio[31:24] <= iomem_wdata[31:24];
			end
		end
	end

	picosoc #(
		.BARREL_SHIFTER(0),
		.ENABLE_MUL(0),
		.ENABLE_DIV(0),
		.ENABLE_FAST_MUL(1),
		.MEM_WORDS(MEM_WORDS)
	) soc (
		.clk          (clk         ),
		.resetn       (resetn      ),

		.ser_tx       (ser_tx      ),
		.ser_rx       (ser_rx      ),

		.irq_5        (1'b0        ),
		.irq_6        (1'b0        ),
		.irq_7        (1'b0        ),

		.iomem_valid  (iomem_valid ),
		.iomem_ready  (iomem_ready ),
		.iomem_wstrb  (iomem_wstrb ),
		.iomem_addr   (iomem_addr  ),
		.iomem_wdata  (iomem_wdata ),
		.iomem_rdata  (iomem_rdata )
	);

	fiftyfivenm_rublock rublock (
	  .clk(0),
      .shiftnld(0),
      .captnupdt(0),
      .regin(0),
      .rsttimer(0),
      .rconfig(0),
      .regout()
	);

endmodule
