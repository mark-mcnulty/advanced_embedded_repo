#################################################################################
#Simulator TCL starts in: C:/Users/Chris/AppData/Roaming/Xilinx/Vivado
# cd C:/Users/Chris/Dropbox/Mycourses/EENG498/VHDL/lab03AcquireToHDMI    -- home
# cd C:/Users/coulston/Dropbox/Mycourses/EENG498/VHDL/lab03AcquireToHDMI -- office
# source acquireToHDMI_tbWaveSetup.tcl
#################################################################################
restart


add_wave  -color green /acquireToHDMI_tb/uut/clk
add_wave  -color green /acquireToHDMI_tb/uut/resetn

set groupColor YELLOW
set TOP_ID [add_wave_group "topLevelIO"]
add_wave -into $TOP_ID -color $groupColor -radix unsigned /acquireToHDMI_tb/uut/btn                                             
add_wave -into $TOP_ID -color $groupColor /acquireToHDMI_tb/uut/triggerCh1                                                      
add_wave -into $TOP_ID -color $groupColor -name "firstCh1dataStdLogicVector" -radix hex /acquireToHDMI_tb/uut/datapath_inst/ch1_reg_1_q
add_wave -into $TOP_ID -color $groupColor -name "secondCh1dataStdLogicVector" -radix hex /acquireToHDMI_tb/uut/datapath_inst/ch1_reg_2_q
add_wave -into $TOP_ID -color $groupColor -name "firstCh1GreaterThanTrigger" /acquireToHDMI_tb/uut/datapath_inst/ch1_compare_1_gt
add_wave -into $TOP_ID -color $groupColor -name "secondCh1LessThanTrigger" /acquireToHDMI_tb/uut/datapath_inst/ch1_compare_2_lt
add_wave -into $TOP_ID -color $groupColor /acquireToHDMI_tb/uut/conversionPlusReadoutTime                                      
add_wave -into $TOP_ID -color $groupColor /acquireToHDMI_tb/uut/sampleTimerRollover                                             

add_wave   -color aqua /acquireToHDMI_tb/uut/control_inst/state                                                                                      

set groupColor PURPLE
set COUNT_ID [add_wave_group "Counters"]
add_wave -into $COUNT_ID -color $groupColor -radix unsigned /acquireToHDMI_tb/uut/datapath_inst/shortDelayCounterOut               
add_wave -into $COUNT_ID -color $groupColor -radix unsigned /acquireToHDMI_tb/uut/datapath_inst/longDelayCounterOut                
add_wave -into $COUNT_ID -color $groupColor -radix unsigned /acquireToHDMI_tb/uut/datapath_inst/periodCounterOut    
add_wave -into $COUNT_ID -color $groupColor -radix unsigned /acquireToHDMI_tb/uut/datapath_inst/wrAddr         

set groupColor ORANGE
set AD7606_ID [add_wave_group "AD7606 Interface"]
add_wave -into $AD7606_ID -color $groupColor /acquireToHDMI_tb/uut/an7606reset                                                         
add_wave -into $AD7606_ID -color $groupColor /acquireToHDMI_tb/uut/an7606convst                                                 
add_wave -into $AD7606_ID -color $groupColor /acquireToHDMI_tb/uut/an7606cs                                                                       
add_wave -into $AD7606_ID -color $groupColor /acquireToHDMI_tb/uut/an7606rd                                                     
add_wave -into $AD7606_ID -color $groupColor /acquireToHDMI_tb/uut/an7606busy                                                    
add_wave -into $AD7606_ID -color $groupColor -radix hex	/acquireToHDMI_tb/uut/an7606data                                        

set groupColor YELLOW
set BRAM_ID [add_wave_group "BRAM Interface"]
add_wave -into $BRAM_ID -color $groupColor -radix unsigned -name "Ch1 Write Address" /acquireToHDMI_tb/uut/datapath_inst/dataStorage_ch1/addra
add_wave -into $BRAM_ID -color $groupColor /acquireToHDMI_tb/uut/datapath_inst/dataStorage_ch1/inst/native_mem_module.blk_mem_gen_v8_4_5_inst/memory[0]
add_wave -into $BRAM_ID -color $groupColor /acquireToHDMI_tb/uut/datapath_inst/dataStorage_ch1/inst/native_mem_module.blk_mem_gen_v8_4_5_inst/memory[1]
add_wave -into $BRAM_ID -color $groupColor /acquireToHDMI_tb/uut/datapath_inst/dataStorage_ch1/inst/native_mem_module.blk_mem_gen_v8_4_5_inst/memory[2]
add_wave -into $BRAM_ID -color $groupColor /acquireToHDMI_tb/uut/datapath_inst/dataStorage_ch1/inst/native_mem_module.blk_mem_gen_v8_4_5_inst/memory[3]


set groupColor BLUE
set HDMI_ID [add_wave_group "Video Interface"]
add_wave -into $HDMI_ID -color $groupColor -radix unsigned /acquireToHDMI_tb/uut/datapath_inst/vsg/h_cnt
add_wave -into $HDMI_ID -color $groupColor -radix unsigned /acquireToHDMI_tb/uut/datapath_inst/vsg/pixelHorz
add_wave -into $HDMI_ID -color $groupColor -radix unsigned /acquireToHDMI_tb/uut/datapath_inst/hs
add_wave -into $HDMI_ID -color $groupColor -radix unsigned /acquireToHDMI_tb/uut/datapath_inst/vsg/v_cnt
add_wave -into $HDMI_ID -color $groupColor -radix unsigned /acquireToHDMI_tb/uut/datapath_inst/vsg/pixelVert
add_wave -into $HDMI_ID -color $groupColor -radix unsigned /acquireToHDMI_tb/uut/datapath_inst/vs
add_wave -into $HDMI_ID -color $groupColor -radix unsigned /acquireToHDMI_tb/uut/datapath_inst/de
add_wave -into $HDMI_ID -color red -radix unsigned /acquireToHDMI_tb/uut/datapath_inst/red
add_wave -into $HDMI_ID -color green -radix unsigned /acquireToHDMI_tb/uut/datapath_inst/green
add_wave -into $HDMI_ID -color blue -radix unsigned /acquireToHDMI_tb/uut/datapath_inst/blue

set groupColor MAROON
set SW_ID [add_wave_group "Status Word"]
add_wave -into $SW_ID -color $groupColor -name "BUSY SW" 		/acquireToHDMI_tb/uut/sw[9]
add_wave -into $SW_ID -color $groupColor -name "SINGLE SW" 		/acquireToHDMI_tb/uut/sw[8]
add_wave -into $SW_ID -color $groupColor -name "FORCED SW" 		/acquireToHDMI_tb/uut/sw[7]
add_wave -into $SW_ID -color $groupColor -name "STORE SW" 		/acquireToHDMI_tb/uut/sw[6]
add_wave -into $SW_ID -color $groupColor -name "BRAM FULL SW" 		/acquireToHDMI_tb/uut/sw[5]
add_wave -into $SW_ID -color $groupColor -name "TRIGGER CH2 SW" 		/acquireToHDMI_tb/uut/sw[4]
add_wave -into $SW_ID -color $groupColor -name "TRIGGER CH1 SW" 		/acquireToHDMI_tb/uut/sw[3]
add_wave -into $SW_ID -color $groupColor -name "SAMPLE DELAY DONE SW" 		/acquireToHDMI_tb/uut/sw[2]
add_wave -into $SW_ID -color $groupColor -name "LONG DELAY DONE SW" 		/acquireToHDMI_tb/uut/sw[1]
add_wave -into $SW_ID -color $groupColor -name "SHORT DELAY DONE SW" 		/acquireToHDMI_tb/uut/sw[0]

set groupColor LIME
set CW_ID [add_wave_group "Control Word"]
add_wave -into $CW_ID -color $groupColor -name "CLEAR_STORE_FLAG_CW_BIT_INDEX" /acquireToHDMI_tb/uut/cw[21]
add_wave -into $CW_ID -color $groupColor -name "SET_STORE_FLAG_CW_BIT_INDEX" /acquireToHDMI_tb/uut/cw[20]
add_wave -into $CW_ID -color $groupColor -name "TRIG_CH2_WRITE_CW_BIT_INDEX" /acquireToHDMI_tb/uut/cw[19]
add_wave -into $CW_ID -color $groupColor -name "TRIG_CH1_WRITE_CW_BIT_INDEX" /acquireToHDMI_tb/uut/cw[18]
add_wave -into $CW_ID -color $groupColor -name "CONVERSION_PLUS_READOUT_CW_BIT_INDEX" /acquireToHDMI_tb/uut/cw[17]
add_wave -into $CW_ID -color $groupColor -name "SAMPLE_TIMER_ROLLOVER_CW_BIT_INDEX" /acquireToHDMI_tb/uut/cw[16]
add_wave -into $CW_ID -color $groupColor -name "DATA_STORAGE_CH1_WRITE_CW_BIT_INDEX" /acquireToHDMI_tb/uut/cw[15]
add_wave -into $CW_ID -color $groupColor -name "DATA_STORAGE_CH2_WRITE_CW_BIT_INDEX" /acquireToHDMI_tb/uut/cw[14]
add_wave -into $CW_ID -color $groupColor -name "CONVST_CW_BIT_INDEX" /acquireToHDMI_tb/uut/cw[13]
add_wave -into $CW_ID -color $groupColor -name "RD_CW_BIT_INDEX" /acquireToHDMI_tb/uut/cw[12]
add_wave -into $CW_ID -color $groupColor -name "CS_CW_BIT_INDEX" /acquireToHDMI_tb/uut/cw[11]
add_wave -into $CW_ID -color $groupColor -name "RESET_AD7606_CW_BIT_INDEX" /acquireToHDMI_tb/uut/cw[10]
add_wave -into $CW_ID -color $groupColor -name "1 DATA_STORAGE_COUNTER_CW_BIT_INDEX" /acquireToHDMI_tb/uut/cw[9]
add_wave -into $CW_ID -color $groupColor -name "0 DATA_STORAGE_COUNTER_CW_BIT_INDEX" /acquireToHDMI_tb/uut/cw[8]
add_wave -into $CW_ID -color $groupColor -name "1 SAMPLING_COUNTER_CW_BIT_INDEX" /acquireToHDMI_tb/uut/cw[7]
add_wave -into $CW_ID -color $groupColor -name "0 SAMPLING_COUNTER_CW_BIT_INDEX" /acquireToHDMI_tb/uut/cw[6]
add_wave -into $CW_ID -color $groupColor -name "1 SAMPLING_RATE_SELECT_CW_BIT_INDEX" /acquireToHDMI_tb/uut/cw[5]
add_wave -into $CW_ID -color $groupColor -name "0 SAMPLING_RATE_SELECT_CW_BIT_INDEX" /acquireToHDMI_tb/uut/cw[4]
add_wave -into $CW_ID -color $groupColor -name "1 LONG_DELAY_COUNTER_CW_BIT_INDEX" /acquireToHDMI_tb/uut/cw[3]
add_wave -into $CW_ID -color $groupColor -name "0 LONG_DELAY_COUNTER_CW_BIT_INDEX" /acquireToHDMI_tb/uut/cw[2]
add_wave -into $CW_ID -color $groupColor -name "1 SHORT_DELAY_COUNTER_CW_BIT_INDEX" /acquireToHDMI_tb/uut/cw[1]
add_wave -into $CW_ID -color $groupColor -name "0 SHORT_DELAY_COUNTER_CW_BIT_INDEX" /acquireToHDMI_tb/uut/cw[0]



