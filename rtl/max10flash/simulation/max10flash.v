// max10flash.v

// Generated using ACDS version 23.1 991

`timescale 1 ps / 1 ps
module max10flash (
		input  wire        clock,                   //    clk.clk
		input  wire [15:0] avmm_data_addr,          //   data.address
		input  wire        avmm_data_read,          //       .read
		output wire [31:0] avmm_data_readdata,      //       .readdata
		output wire        avmm_data_waitrequest,   //       .waitrequest
		output wire        avmm_data_readdatavalid, //       .readdatavalid
		input  wire [3:0]  avmm_data_burstcount,    //       .burstcount
		input  wire        reset_n                  // nreset.reset_n
	);

	altera_onchip_flash #(
		.INIT_FILENAME                       ("firmware.hex"),
		.INIT_FILENAME_SIM                   ("firmware.dat"),
		.DEVICE_FAMILY                       ("MAX 10"),
		.PART_NAME                           ("10M08SAU169C8G"),
		.DEVICE_ID                           ("08"),
		.SECTOR1_START_ADDR                  (0),
		.SECTOR1_END_ADDR                    (4095),
		.SECTOR2_START_ADDR                  (4096),
		.SECTOR2_END_ADDR                    (8191),
		.SECTOR3_START_ADDR                  (8192),
		.SECTOR3_END_ADDR                    (29183),
		.SECTOR4_START_ADDR                  (29184),
		.SECTOR4_END_ADDR                    (44031),
		.SECTOR5_START_ADDR                  (0),
		.SECTOR5_END_ADDR                    (0),
		.MIN_VALID_ADDR                      (0),
		.MAX_VALID_ADDR                      (44031),
		.MIN_UFM_VALID_ADDR                  (0),
		.MAX_UFM_VALID_ADDR                  (8191),
		.SECTOR1_MAP                         (1),
		.SECTOR2_MAP                         (2),
		.SECTOR3_MAP                         (3),
		.SECTOR4_MAP                         (4),
		.SECTOR5_MAP                         (0),
		.ADDR_RANGE1_END_ADDR                (44031),
		.ADDR_RANGE2_END_ADDR                (44031),
		.ADDR_RANGE1_OFFSET                  (512),
		.ADDR_RANGE2_OFFSET                  (0),
		.ADDR_RANGE3_OFFSET                  (0),
		.AVMM_DATA_ADDR_WIDTH                (16),
		.AVMM_DATA_DATA_WIDTH                (32),
		.AVMM_DATA_BURSTCOUNT_WIDTH          (4),
		.SECTOR_READ_PROTECTION_MODE         (31),
		.FLASH_SEQ_READ_DATA_COUNT           (2),
		.FLASH_ADDR_ALIGNMENT_BITS           (1),
		.FLASH_READ_CYCLE_MAX_INDEX          (4),
		.FLASH_RESET_CYCLE_MAX_INDEX         (3),
		.FLASH_BUSY_TIMEOUT_CYCLE_MAX_INDEX  (14),
		.FLASH_ERASE_TIMEOUT_CYCLE_MAX_INDEX (4200000),
		.FLASH_WRITE_TIMEOUT_CYCLE_MAX_INDEX (3660),
		.PARALLEL_MODE                       (1),
		.READ_AND_WRITE_MODE                 (0),
		.WRAPPING_BURST_MODE                 (0),
		.IS_DUAL_BOOT                        ("True"),
		.IS_ERAM_SKIP                        ("True"),
		.IS_COMPRESSED_IMAGE                 ("True")
	) onchip_flash_0 (
		.clock                   (clock),                                //    clk.clk
		.reset_n                 (reset_n),                              // nreset.reset_n
		.avmm_data_addr          (avmm_data_addr),                       //   data.address
		.avmm_data_read          (avmm_data_read),                       //       .read
		.avmm_data_readdata      (avmm_data_readdata),                   //       .readdata
		.avmm_data_waitrequest   (avmm_data_waitrequest),                //       .waitrequest
		.avmm_data_readdatavalid (avmm_data_readdatavalid),              //       .readdatavalid
		.avmm_data_burstcount    (avmm_data_burstcount),                 //       .burstcount
		.avmm_data_writedata     (32'b00000000000000000000000000000000), // (terminated)
		.avmm_data_write         (1'b0),                                 // (terminated)
		.avmm_csr_addr           (1'b0),                                 // (terminated)
		.avmm_csr_read           (1'b0),                                 // (terminated)
		.avmm_csr_writedata      (32'b00000000000000000000000000000000), // (terminated)
		.avmm_csr_write          (1'b0),                                 // (terminated)
		.avmm_csr_readdata       ()                                      // (terminated)
	);

endmodule
