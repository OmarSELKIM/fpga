#
# Copyright 2016 Ettus Research
#

#-------------------------------------------------
# Top-of-Makefile
#-------------------------------------------------
# Define BASE_DIR to point to the "top" dir
BASE_DIR = $(abspath ../../..)
# Include viv_sim_preample after defining BASE_DIR
include $(BASE_DIR)/../tools/make/viv_sim_preamble.mak

#-------------------------------------------------
# Design Specific
#-------------------------------------------------
# Define part using PART_ID (<device>/<package>/<speedgrade>)
ARCH = kintex7
PART_ID = xc7k410t/ffg900/-2

#-------------------------------------------------
# IP Specific
#-------------------------------------------------
# If simulation contains IP, define the IP_DIR and point
# it to the base level IP directory
IP_DIR = ../../ip

# Include makefiles and sources for all IP components
# *after* defining the IP_DIR
include $(IP_DIR)/ddr3_32bit/Makefile.inc
include $(IP_DIR)/axi_intercon_2x64_128_bd/Makefile.inc
include $(IP_DIR)/fifo_short_2clk/Makefile.inc
include $(IP_DIR)/fifo_4k_2clk/Makefile.inc
include $(IP_DIR)/axi4_dualport_sram/Makefile.inc

DESIGN_SRCS += $(abspath \
$(IP_DDR3_32BIT_SRCS) \
$(IP_AXI_INTERCON_2X64_128_BD_SRCS) \
$(IP_FIFO_4K_2CLK_SRCS) \
$(IP_FIFO_SHORT_2CLK_SRCS) \
$(IP_AXI4_BRAM_SRCS) \
)

#-------------------------------------------------
# Testbench Specific
#-------------------------------------------------
# Define only one toplevel module
SIM_TOP = noc_block_axi_dma_fifo_tb
SIM_RUNTIME_US = 150000

# Add test bench, user design under test, and
# additional user created files
SIM_SRCS = \
$(abspath noc_block_axi_dma_fifo_tb.sv) \
$(abspath axis_dram_fifo_dual.sv) \
$(LIB_DIR)/rfnoc/noc_block_axi_dma_fifo.v \
$(IP_DDR3_32BIT_SIM_OUTS)

#-------------------------------------------------
# Bottom-of-Makefile
#-------------------------------------------------
# Include all simulator specific makefiles here
# Each should define a unique target to simulate
# e.g. xsim, vsim, etc and a common "clean" target
include $(BASE_DIR)/../tools/make/viv_simulator.mak
