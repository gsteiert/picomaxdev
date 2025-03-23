
CROSS=riscv64-unknown-elf-
CFLAGS=

# ---- MAX1000 Board ----

max1000_sections.lds: picomax.lds
	$(CROSS)cpp -P -DMAX10M08 -o $@ $^

max1000_fw.elf: max1000_sections.lds start.s firmware.c
	$(CROSS)gcc $(CFLAGS) -DMAX1000 -mabi=ilp32 -march=rv32ic -Wl,-Bstatic,-T,max1000_sections.lds,--strip-debug -ffreestanding -nostdlib -o max1000_fw.elf start.s firmware.c

max1000_fw.hex: max1000_fw.elf
	$(CROSS)objcopy -O ihex max1000_fw.elf max1000_fw.hex

max1000_fw.bin: max1000_fw.elf
	$(CROSS)objcopy -O binary max1000_fw.elf max1000_fw.bin

# ---- AnalogMAX Board ----

analogmax_sections.lds: picomax.lds
	$(CROSS)cpp -P -DMAX10M08 -o $@ $^

analogmax_fw.elf: analogmax_sections.lds start.s firmware.c
	$(CROSS)gcc $(CFLAGS) -DMAX1000 -mabi=ilp32 -march=rv32ic -Wl,-Bstatic,-T,analogmax_sections.lds,--strip-debug -ffreestanding -nostdlib -o analogmax_fw.elf start.s firmware.c

analogmax_fw.hex: analogmax_fw.elf
	$(CROSS)objcopy -O ihex analogmax_fw.elf analogmax_fw.hex

analogmax_fw.bin: analogmax_fw.elf
	$(CROSS)objcopy -O binary analogmax_fw.elf analogmax_fw.bin

# ---- MAX10M08EVK Board ----

max10m08evk_sections.lds: picomax.lds
	$(CROSS)cpp -P -DMAX10M08 -o $@ $^

max10m08evk_fw.elf: max10m08evk_sections.lds start.s firmware.c
	$(CROSS)gcc $(CFLAGS) -DMAX10M08EVK -mabi=ilp32 -march=rv32ic -Wl,-Bstatic,-T,max10m08evk_sections.lds,--strip-debug -ffreestanding -nostdlib -o max10m08evk_fw.elf start.s firmware.c

max10m08evk_fw.hex: max10m08evk_fw.elf
	$(CROSS)objcopy -O ihex max10m08evk_fw.elf max10m08evk_fw.hex

max10m08evk_fw.bin: max10m08evk_fw.elf
	$(CROSS)objcopy -O binary max10m08evk_fw.elf max10m08evk_fw.bin

# ---- Clean ----

clean:
	rm -f max1000_fw.elf max1000_fw.hex max1000_fw.bin
	rm -f analogmax_fw.elf analogmax_fw.hex analogmax_fw.bin
	rm -f max10m08evk_fw.elf max10m08evk_fw.hex max10m08evk_fw.bin

