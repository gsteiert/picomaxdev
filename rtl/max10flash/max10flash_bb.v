
module max10flash (
	clock,
	reset_n,
	avmm_data_addr,
	avmm_data_read,
	avmm_data_readdata,
	avmm_data_waitrequest,
	avmm_data_readdatavalid,
	avmm_data_burstcount);	

	input		clock;
	input		reset_n;
	input	[15:0]	avmm_data_addr;
	input		avmm_data_read;
	output	[31:0]	avmm_data_readdata;
	output		avmm_data_waitrequest;
	output		avmm_data_readdatavalid;
	input	[3:0]	avmm_data_burstcount;
endmodule
