<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="Card_Sel" />
        <signal name="Rsel" />
        <signal name="AI(9:0)" />
        <signal name="DO(31:0)" />
        <signal name="WR_IN_N" />
        <signal name="RACK_N" />
        <signal name="MAO(31:0)" />
        <signal name="MDO(31:0)" />
        <signal name="SACK_N" />
        <signal name="IN_INIT" />
        <signal name="CLK" />
        <signal name="STEP_EN" />
        <signal name="AS_N" />
        <signal name="WR_OUT_N" />
        <signal name="RESET" />
        <signal name="R_DO(31:0)" />
        <signal name="sdClk_o" />
        <signal name="sdBs_o(1:0)" />
        <signal name="sdDqml_o" />
        <signal name="sdDqmh_o" />
        <signal name="sdWe_bo" />
        <signal name="sdCas_bo" />
        <signal name="sdRas_bo" />
        <signal name="sdCe_bo" />
        <signal name="sdCke_o" />
        <signal name="fpgaClk_i" />
        <signal name="sdClkFb_i" />
        <signal name="sdData_io(15:0)" />
        <signal name="sdAddr_o(12:0)" />
        <signal name="SDO(31:0)" />
        <signal name="ACK_N" />
        <signal name="STOP_N" />
        <signal name="D_GPR(31:0)" />
        <signal name="DIN(31:0)" />
        <signal name="reg_adr(4:0)" />
        <signal name="MUXALU_SEL" />
        <signal name="DLX_STATE(4:0)" />
        <signal name="MAC_STATE(1:0)" />
        <signal name="IR(31:0)" />
        <signal name="ALUF(2:0)" />
        <signal name="S2_SEL(1:0)" />
        <signal name="S1_SEL(1:0)" />
        <signal name="AEQZ" />
        <signal name="MDR_CE" />
        <signal name="MAR_CE" />
        <signal name="BUSY" />
        <signal name="JLINK" />
        <signal name="SHIFT" />
        <signal name="ADD" />
        <signal name="ITYPE" />
        <signal name="TEST" />
        <signal name="DINT_SEL" />
        <signal name="MDR_SEL" />
        <signal name="A_SEL" />
        <signal name="GPR_WE" />
        <signal name="OVF" />
        <signal name="PC_CE" />
        <signal name="IR_CE" />
        <signal name="C_CE" />
        <signal name="B_CE" />
        <signal name="A_CE" />
        <signal name="MW" />
        <signal name="MR" />
        <signal name="DIN(0)" />
        <signal name="DIN(1)" />
        <signal name="DIN(2)" />
        <signal name="DIN(3)" />
        <signal name="DIN(4)" />
        <signal name="DIN(5)" />
        <signal name="DIN(6)" />
        <signal name="DIN(7)" />
        <signal name="MAC_STATE(0)" />
        <signal name="DIN(8)" />
        <signal name="DIN(9)" />
        <signal name="MAC_STATE(1)" />
        <signal name="DLX_STATE(0)" />
        <signal name="DIN(10)" />
        <signal name="DIN(11)" />
        <signal name="DLX_STATE(1)" />
        <signal name="DLX_STATE(2)" />
        <signal name="DIN(12)" />
        <signal name="DIN(13)" />
        <signal name="DLX_STATE(3)" />
        <signal name="DLX_STATE(4)" />
        <signal name="DIN(14)" />
        <signal name="DIN(15)" />
        <signal name="DIN(16)" />
        <signal name="DIN(17)" />
        <signal name="DIN(18)" />
        <signal name="DIN(19)" />
        <signal name="DIN(20)" />
        <signal name="DIN(21)" />
        <signal name="DIN(22)" />
        <signal name="DIN(23)" />
        <signal name="S1_SEL(0)" />
        <signal name="DIN(24)" />
        <signal name="DIN(25)" />
        <signal name="S1_SEL(1)" />
        <signal name="S2_SEL(0)" />
        <signal name="DIN(26)" />
        <signal name="DIN(27)" />
        <signal name="S2_SEL(1)" />
        <signal name="DIN(28)" />
        <signal name="DIN(29)" />
        <signal name="DIN(30)" />
        <signal name="DIN(31)" />
        <port polarity="Output" name="sdClk_o" />
        <port polarity="Output" name="sdBs_o(1:0)" />
        <port polarity="Output" name="sdDqml_o" />
        <port polarity="Output" name="sdDqmh_o" />
        <port polarity="Output" name="sdWe_bo" />
        <port polarity="Output" name="sdCas_bo" />
        <port polarity="Output" name="sdRas_bo" />
        <port polarity="Output" name="sdCe_bo" />
        <port polarity="Output" name="sdCke_o" />
        <port polarity="Input" name="fpgaClk_i" />
        <port polarity="Input" name="sdClkFb_i" />
        <port polarity="BiDirectional" name="sdData_io(15:0)" />
        <port polarity="Output" name="sdAddr_o(12:0)" />
        <blockdef name="IO_LOGIC_U">
            <timestamp>2015-7-8T11:14:45</timestamp>
            <rect width="304" x="64" y="-1280" height="1280" />
            <line x2="0" y1="-1248" y2="-1248" x1="64" />
            <line x2="0" y1="-1136" y2="-1136" x1="64" />
            <line x2="0" y1="-1024" y2="-1024" x1="64" />
            <line x2="0" y1="-912" y2="-912" x1="64" />
            <line x2="0" y1="-800" y2="-800" x1="64" />
            <line x2="0" y1="-688" y2="-688" x1="64" />
            <line x2="0" y1="-576" y2="-576" x1="64" />
            <rect width="64" x="0" y="-476" height="24" />
            <line x2="0" y1="-464" y2="-464" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-252" height="24" />
            <line x2="0" y1="-240" y2="-240" x1="64" />
            <rect width="64" x="0" y="-140" height="24" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="432" y1="-1248" y2="-1248" x1="368" />
            <line x2="432" y1="-1184" y2="-1184" x1="368" />
            <line x2="432" y1="-1120" y2="-1120" x1="368" />
            <line x2="432" y1="-1056" y2="-1056" x1="368" />
            <line x2="432" y1="-992" y2="-992" x1="368" />
            <line x2="432" y1="-928" y2="-928" x1="368" />
            <line x2="432" y1="-864" y2="-864" x1="368" />
            <line x2="432" y1="-800" y2="-800" x1="368" />
            <line x2="432" y1="-736" y2="-736" x1="368" />
            <line x2="432" y1="-672" y2="-672" x1="368" />
            <line x2="432" y1="-608" y2="-608" x1="368" />
            <line x2="432" y1="-544" y2="-544" x1="368" />
            <line x2="432" y1="-480" y2="-480" x1="368" />
            <line x2="432" y1="-416" y2="-416" x1="368" />
            <line x2="432" y1="-352" y2="-352" x1="368" />
            <rect width="64" x="368" y="-300" height="24" />
            <line x2="432" y1="-288" y2="-288" x1="368" />
            <rect width="64" x="368" y="-236" height="24" />
            <line x2="432" y1="-224" y2="-224" x1="368" />
            <rect width="64" x="368" y="-172" height="24" />
            <line x2="432" y1="-160" y2="-160" x1="368" />
            <rect width="64" x="368" y="-108" height="24" />
            <line x2="432" y1="-96" y2="-96" x1="368" />
            <rect width="64" x="368" y="-44" height="24" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
        </blockdef>
        <blockdef name="MONITOR_SLAVE">
            <timestamp>2025-5-4T13:40:33</timestamp>
            <rect width="320" x="64" y="-704" height="704" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="448" y1="-672" y2="-672" x1="384" />
            <rect width="64" x="384" y="-364" height="24" />
            <line x2="448" y1="-352" y2="-352" x1="384" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
        </blockdef>
        <blockdef name="DLX_TOP">
            <timestamp>2025-5-4T13:41:24</timestamp>
            <line x2="464" y1="32" y2="32" x1="400" />
            <line x2="0" y1="-2144" y2="-2144" x1="64" />
            <line x2="0" y1="-1728" y2="-1728" x1="64" />
            <line x2="0" y1="-1312" y2="-1312" x1="64" />
            <line x2="0" y1="-896" y2="-896" x1="64" />
            <rect width="64" x="0" y="-492" height="24" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-76" height="24" />
            <line x2="0" y1="-64" y2="-64" x1="64" />
            <line x2="464" y1="-2144" y2="-2144" x1="400" />
            <line x2="464" y1="-2080" y2="-2080" x1="400" />
            <line x2="464" y1="-2016" y2="-2016" x1="400" />
            <line x2="464" y1="-1952" y2="-1952" x1="400" />
            <line x2="464" y1="-1888" y2="-1888" x1="400" />
            <line x2="464" y1="-1824" y2="-1824" x1="400" />
            <line x2="464" y1="-1760" y2="-1760" x1="400" />
            <line x2="464" y1="-1696" y2="-1696" x1="400" />
            <line x2="464" y1="-1632" y2="-1632" x1="400" />
            <line x2="464" y1="-1568" y2="-1568" x1="400" />
            <line x2="464" y1="-1504" y2="-1504" x1="400" />
            <line x2="464" y1="-1440" y2="-1440" x1="400" />
            <line x2="464" y1="-1376" y2="-1376" x1="400" />
            <line x2="464" y1="-1312" y2="-1312" x1="400" />
            <line x2="464" y1="-1248" y2="-1248" x1="400" />
            <line x2="464" y1="-1184" y2="-1184" x1="400" />
            <line x2="464" y1="-1120" y2="-1120" x1="400" />
            <line x2="464" y1="-1056" y2="-1056" x1="400" />
            <line x2="464" y1="-992" y2="-992" x1="400" />
            <line x2="464" y1="-928" y2="-928" x1="400" />
            <line x2="464" y1="-864" y2="-864" x1="400" />
            <line x2="464" y1="-800" y2="-800" x1="400" />
            <line x2="464" y1="-736" y2="-736" x1="400" />
            <line x2="464" y1="-672" y2="-672" x1="400" />
            <line x2="464" y1="-608" y2="-608" x1="400" />
            <rect width="64" x="400" y="-556" height="24" />
            <line x2="464" y1="-544" y2="-544" x1="400" />
            <rect width="64" x="400" y="-492" height="24" />
            <line x2="464" y1="-480" y2="-480" x1="400" />
            <rect width="64" x="400" y="-428" height="24" />
            <line x2="464" y1="-416" y2="-416" x1="400" />
            <rect width="64" x="400" y="-364" height="24" />
            <line x2="464" y1="-352" y2="-352" x1="400" />
            <rect width="64" x="400" y="-300" height="24" />
            <line x2="464" y1="-288" y2="-288" x1="400" />
            <rect width="64" x="400" y="-236" height="24" />
            <line x2="464" y1="-224" y2="-224" x1="400" />
            <rect width="64" x="400" y="-172" height="24" />
            <line x2="464" y1="-160" y2="-160" x1="400" />
            <rect width="64" x="400" y="-108" height="24" />
            <line x2="464" y1="-96" y2="-96" x1="400" />
            <rect width="64" x="400" y="-44" height="24" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
            <rect width="336" x="64" y="-2176" height="2240" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <block symbolname="IO_LOGIC_U" name="XLXI_23">
            <blockpin signalname="AS_N" name="AS_N_i" />
            <blockpin signalname="fpgaClk_i" name="fpgaClk_i" />
            <blockpin signalname="IN_INIT" name="in_init_i" />
            <blockpin signalname="RACK_N" name="RACK_N_i" />
            <blockpin signalname="SACK_N" name="SACK_N_i" />
            <blockpin signalname="sdClkFb_i" name="sdClkFb_i" />
            <blockpin signalname="WR_OUT_N" name="WR_N_i" />
            <blockpin signalname="MAO(31:0)" name="MA_i(31:0)" />
            <blockpin signalname="MDO(31:0)" name="MD_i(31:0)" />
            <blockpin signalname="R_DO(31:0)" name="RD_i(31:0)" />
            <blockpin signalname="SDO(31:0)" name="SD_i(31:0)" />
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="ACK_N" name="MACK_N_o" />
            <blockpin signalname="RESET" name="RESET" />
            <blockpin signalname="Rsel" name="Rsel_o" />
            <blockpin signalname="sdCas_bo" name="sdCas_bo" />
            <blockpin signalname="sdCe_bo" name="sdCe_bo" />
            <blockpin signalname="sdCke_o" name="sdCke_o" />
            <blockpin signalname="sdClk_o" name="sdClk_o" />
            <blockpin signalname="sdDqmh_o" name="sdDqmh_o" />
            <blockpin signalname="sdDqml_o" name="sdDqml_o" />
            <blockpin signalname="sdRas_bo" name="sdRas_bo" />
            <blockpin signalname="sdWe_bo" name="sdWe_bo" />
            <blockpin signalname="Card_Sel" name="Ssel_o" />
            <blockpin signalname="STEP_EN" name="step_en_o" />
            <blockpin signalname="WR_IN_N" name="WR_N_o" />
            <blockpin signalname="AI(9:0)" name="A_o(9:0)" />
            <blockpin signalname="DO(31:0)" name="DO(31:0)" />
            <blockpin signalname="sdAddr_o(12:0)" name="sdAddr_o(12:0)" />
            <blockpin signalname="sdBs_o(1:0)" name="sdBs_o(1:0)" />
            <blockpin signalname="sdData_io(15:0)" name="sdData_io(15:0)" />
        </block>
        <block symbolname="MONITOR_SLAVE" name="XLXI_28">
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="RESET" name="RESET" />
            <blockpin signalname="Card_Sel" name="CARD_SEL" />
            <blockpin signalname="WR_IN_N" name="WR_IN_N" />
            <blockpin signalname="STEP_EN" name="step_en" />
            <blockpin signalname="IN_INIT" name="in_init" />
            <blockpin signalname="STOP_N" name="stop_n" />
            <blockpin signalname="AI(9:0)" name="AI(9:0)" />
            <blockpin signalname="D_GPR(31:0)" name="C_IN(31:0)" />
            <blockpin signalname="MAO(31:0)" name="D_IN(31:0)" />
            <blockpin signalname="DIN(31:0)" name="DIN(31:0)" />
            <blockpin signalname="SACK_N" name="SACK_N" />
            <blockpin signalname="SDO(31:0)" name="SDO(31:0)" />
            <blockpin signalname="reg_adr(4:0)" name="REG_ADDR(4:0)" />
        </block>
        <block symbolname="DLX_TOP" name="XLXI_29">
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="RESET" name="RESET" />
            <blockpin signalname="STEP_EN" name="STEP_EN" />
            <blockpin signalname="ACK_N" name="ACK_N" />
            <blockpin signalname="reg_adr(4:0)" name="D_ADDR(4:0)" />
            <blockpin signalname="DO(31:0)" name="D_IN(31:0)" />
            <blockpin signalname="AS_N" name="AS_N" />
            <blockpin signalname="WR_OUT_N" name="WR_N" />
            <blockpin signalname="MR" name="MR" />
            <blockpin signalname="MW" name="MW" />
            <blockpin signalname="A_CE" name="A_CE" />
            <blockpin signalname="B_CE" name="B_CE" />
            <blockpin signalname="C_CE" name="C_CE" />
            <blockpin signalname="IR_CE" name="IR_CE" />
            <blockpin signalname="PC_CE" name="PC_CE" />
            <blockpin signalname="OVF" name="OVF" />
            <blockpin signalname="GPR_WE" name="GPR_WE" />
            <blockpin signalname="A_SEL" name="A_SEL" />
            <blockpin signalname="MDR_SEL" name="MDR_SEL" />
            <blockpin signalname="DINT_SEL" name="DINT_SEL" />
            <blockpin signalname="TEST" name="TEST" />
            <blockpin signalname="ITYPE" name="ITYPE" />
            <blockpin signalname="ADD" name="ADD" />
            <blockpin signalname="SHIFT" name="SHIFT" />
            <blockpin signalname="JLINK" name="JLINK" />
            <blockpin signalname="STOP_N" name="STOP_N" />
            <blockpin signalname="BUSY" name="BUSY" />
            <blockpin signalname="IN_INIT" name="IN_INIT" />
            <blockpin signalname="MAR_CE" name="MAR_CE" />
            <blockpin signalname="MDR_CE" name="MDR_CE" />
            <blockpin signalname="AEQZ" name="AEQZ" />
            <blockpin signalname="D_GPR(31:0)" name="GPR_D(31:0)" />
            <blockpin signalname="MAO(31:0)" name="AO(31:0)" />
            <blockpin signalname="S1_SEL(1:0)" name="S1_SEL(1:0)" />
            <blockpin signalname="S2_SEL(1:0)" name="S2_SEL(1:0)" />
            <blockpin signalname="MDO(31:0)" name="DO(31:0)" />
            <blockpin signalname="ALUF(2:0)" name="ALUF(2:0)" />
            <blockpin signalname="IR(31:0)" name="IR(31:0)" />
            <blockpin signalname="MAC_STATE(1:0)" name="MAC_STATE(1:0)" />
            <blockpin signalname="DLX_STATE(4:0)" name="DLX_STATE(4:0)" />
            <blockpin signalname="MUXALU_SEL" name="MUXALU_SEL" />
        </block>
        <block symbolname="buf" name="XLXI_30">
            <blockpin signalname="STEP_EN" name="I" />
            <blockpin signalname="DIN(0)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_31">
            <blockpin signalname="ACK_N" name="I" />
            <blockpin signalname="DIN(1)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_34">
            <blockpin signalname="IN_INIT" name="I" />
            <blockpin signalname="DIN(2)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_35">
            <blockpin signalname="WR_OUT_N" name="I" />
            <blockpin signalname="DIN(3)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_38">
            <blockpin signalname="AS_N" name="I" />
            <blockpin signalname="DIN(4)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_39">
            <blockpin signalname="MR" name="I" />
            <blockpin signalname="DIN(5)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_40">
            <blockpin signalname="MW" name="I" />
            <blockpin signalname="DIN(6)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_41">
            <blockpin signalname="ITYPE" name="I" />
            <blockpin signalname="DIN(7)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_42">
            <blockpin signalname="MAC_STATE(0)" name="I" />
            <blockpin signalname="DIN(8)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_43">
            <blockpin signalname="MAC_STATE(1)" name="I" />
            <blockpin signalname="DIN(9)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_44">
            <blockpin signalname="DLX_STATE(0)" name="I" />
            <blockpin signalname="DIN(10)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_45">
            <blockpin signalname="DLX_STATE(1)" name="I" />
            <blockpin signalname="DIN(11)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_46">
            <blockpin signalname="DLX_STATE(2)" name="I" />
            <blockpin signalname="DIN(12)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_47">
            <blockpin signalname="DLX_STATE(3)" name="I" />
            <blockpin signalname="DIN(13)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_48">
            <blockpin signalname="DLX_STATE(4)" name="I" />
            <blockpin signalname="DIN(14)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_49">
            <blockpin signalname="PC_CE" name="I" />
            <blockpin signalname="DIN(15)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_66">
            <blockpin signalname="IR_CE" name="I" />
            <blockpin signalname="DIN(16)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_67">
            <blockpin signalname="GPR_WE" name="I" />
            <blockpin signalname="DIN(17)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_68">
            <blockpin signalname="MDR_CE" name="I" />
            <blockpin signalname="DIN(18)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_69">
            <blockpin signalname="MAR_CE" name="I" />
            <blockpin signalname="DIN(19)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_70">
            <blockpin signalname="A_CE" name="I" />
            <blockpin signalname="DIN(20)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_71">
            <blockpin signalname="B_CE" name="I" />
            <blockpin signalname="DIN(21)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_72">
            <blockpin signalname="C_CE" name="I" />
            <blockpin signalname="DIN(22)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_73">
            <blockpin signalname="A_SEL" name="I" />
            <blockpin signalname="DIN(23)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_74">
            <blockpin signalname="S1_SEL(0)" name="I" />
            <blockpin signalname="DIN(24)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_75">
            <blockpin signalname="S1_SEL(1)" name="I" />
            <blockpin signalname="DIN(25)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_76">
            <blockpin signalname="S2_SEL(0)" name="I" />
            <blockpin signalname="DIN(26)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_77">
            <blockpin signalname="S2_SEL(1)" name="I" />
            <blockpin signalname="DIN(27)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_78">
            <blockpin signalname="SHIFT" name="I" />
            <blockpin signalname="DIN(28)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_79">
            <blockpin signalname="ADD" name="I" />
            <blockpin signalname="DIN(29)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_80">
            <blockpin signalname="JLINK" name="I" />
            <blockpin signalname="DIN(30)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_81">
            <blockpin signalname="MUXALU_SEL" name="I" />
            <blockpin signalname="DIN(31)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="AS_N">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="240" y="208" type="branch" />
            <wire x2="432" y1="208" y2="208" x1="240" />
        </branch>
        <branch name="WR_OUT_N">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="240" y="256" type="branch" />
            <wire x2="528" y1="256" y2="256" x1="240" />
        </branch>
        <branch name="MAO(31:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="240" y="304" type="branch" />
            <wire x2="432" y1="304" y2="304" x1="240" />
        </branch>
        <branch name="MDO(31:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="240" y="352" type="branch" />
            <wire x2="432" y1="352" y2="352" x1="240" />
        </branch>
        <branch name="ACK_N">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="240" y="400" type="branch" />
            <wire x2="432" y1="400" y2="400" x1="240" />
        </branch>
        <branch name="Card_Sel">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="240" y="2080" type="branch" />
            <wire x2="448" y1="2080" y2="2080" x1="240" />
        </branch>
        <branch name="AI(9:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="240" y="2032" type="branch" />
            <wire x2="448" y1="2032" y2="2032" x1="240" />
        </branch>
        <branch name="WR_IN_N">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="240" y="1984" type="branch" />
            <wire x2="448" y1="1984" y2="1984" x1="240" />
        </branch>
        <branch name="SDO(31:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="240" y="1936" type="branch" />
            <wire x2="448" y1="1936" y2="1936" x1="240" />
        </branch>
        <branch name="SACK_N">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="240" y="1888" type="branch" />
            <wire x2="448" y1="1888" y2="1888" x1="240" />
        </branch>
        <branch name="DO(31:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="240" y="1632" type="branch" />
            <wire x2="448" y1="1632" y2="1632" x1="240" />
        </branch>
        <branch name="IN_INIT">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="256" y="1024" type="branch" />
            <wire x2="448" y1="1024" y2="1024" x1="256" />
        </branch>
        <branch name="RESET">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="256" y="1072" type="branch" />
            <wire x2="448" y1="1072" y2="1072" x1="256" />
        </branch>
        <branch name="STEP_EN">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="256" y="1120" type="branch" />
            <wire x2="448" y1="1120" y2="1120" x1="256" />
        </branch>
        <branch name="CLK">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="256" y="1168" type="branch" />
            <wire x2="448" y1="1168" y2="1168" x1="256" />
        </branch>
        <text style="fontsize:32;fontname:Arial" x="268" y="488">Master I/O</text>
        <text style="fontsize:32;fontname:Arial" x="284" y="1232">Control I/O</text>
        <text style="fontsize:32;fontname:Arial" x="256" y="1692">Bus data O</text>
        <text style="fontsize:32;fontname:Arial" x="280" y="2140">Slave I/O</text>
        <instance x="752" y="2048" name="XLXI_28" orien="R0">
        </instance>
        <branch name="CLK">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="672" y="1376" type="branch" />
            <wire x2="752" y1="1376" y2="1376" x1="672" />
        </branch>
        <branch name="RESET">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="672" y="1440" type="branch" />
            <wire x2="752" y1="1440" y2="1440" x1="672" />
        </branch>
        <branch name="Card_Sel">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="656" y="1504" type="branch" />
            <wire x2="752" y1="1504" y2="1504" x1="656" />
        </branch>
        <branch name="WR_IN_N">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="640" y="1568" type="branch" />
            <wire x2="752" y1="1568" y2="1568" x1="640" />
        </branch>
        <branch name="STEP_EN">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="656" y="1632" type="branch" />
            <wire x2="752" y1="1632" y2="1632" x1="656" />
        </branch>
        <branch name="IN_INIT">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="656" y="1696" type="branch" />
            <wire x2="752" y1="1696" y2="1696" x1="656" />
        </branch>
        <branch name="STOP_N">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="656" y="1760" type="branch" />
            <wire x2="752" y1="1760" y2="1760" x1="656" />
        </branch>
        <branch name="AI(9:0)">
            <attrtext style="alignment:SOFT-VLEFT;fontsize:28;fontname:Arial" attrname="Name" x="672" y="1808" type="branch" />
            <wire x2="672" y1="1808" y2="1824" x1="672" />
            <wire x2="752" y1="1824" y2="1824" x1="672" />
        </branch>
        <branch name="D_GPR(31:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="688" y="1888" type="branch" />
            <wire x2="752" y1="1888" y2="1888" x1="688" />
        </branch>
        <branch name="MAO(31:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="688" y="1952" type="branch" />
            <wire x2="752" y1="1952" y2="1952" x1="688" />
        </branch>
        <branch name="DIN(31:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="688" y="2016" type="branch" />
            <wire x2="752" y1="2016" y2="2016" x1="688" />
        </branch>
        <branch name="SACK_N">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1280" y="1376" type="branch" />
            <wire x2="1280" y1="1376" y2="1376" x1="1200" />
        </branch>
        <branch name="SDO(31:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1312" y="1696" type="branch" />
            <wire x2="1312" y1="1696" y2="1696" x1="1200" />
        </branch>
        <branch name="reg_adr(4:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1296" y="2016" type="branch" />
            <wire x2="1296" y1="2016" y2="2016" x1="1200" />
        </branch>
        <instance x="1536" y="2368" name="XLXI_29" orien="R0">
        </instance>
        <branch name="MUXALU_SEL">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2048" y="2400" type="branch" />
            <wire x2="2048" y1="2400" y2="2400" x1="2000" />
        </branch>
        <branch name="DLX_STATE(4:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2064" y="2336" type="branch" />
            <wire x2="2064" y1="2336" y2="2336" x1="2000" />
        </branch>
        <branch name="MAC_STATE(1:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2064" y="2272" type="branch" />
            <wire x2="2064" y1="2272" y2="2272" x1="2000" />
        </branch>
        <branch name="IR(31:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2064" y="2208" type="branch" />
            <wire x2="2064" y1="2208" y2="2208" x1="2000" />
        </branch>
        <branch name="ALUF(2:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2080" y="2144" type="branch" />
            <wire x2="2080" y1="2144" y2="2144" x1="2000" />
        </branch>
        <branch name="MDO(31:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2080" y="2080" type="branch" />
            <wire x2="2080" y1="2080" y2="2080" x1="2000" />
        </branch>
        <branch name="S2_SEL(1:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2080" y="2016" type="branch" />
            <wire x2="2080" y1="2016" y2="2016" x1="2000" />
        </branch>
        <branch name="S1_SEL(1:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2096" y="1952" type="branch" />
            <wire x2="2096" y1="1952" y2="1952" x1="2000" />
        </branch>
        <branch name="MAO(31:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2080" y="1888" type="branch" />
            <wire x2="2080" y1="1888" y2="1888" x1="2000" />
        </branch>
        <branch name="D_GPR(31:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2080" y="1824" type="branch" />
            <wire x2="2080" y1="1824" y2="1824" x1="2000" />
        </branch>
        <branch name="AEQZ">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2080" y="1760" type="branch" />
            <wire x2="2080" y1="1760" y2="1760" x1="2000" />
        </branch>
        <branch name="MDR_CE">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2064" y="1696" type="branch" />
            <wire x2="2064" y1="1696" y2="1696" x1="2000" />
        </branch>
        <branch name="MAR_CE">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2064" y="1632" type="branch" />
            <wire x2="2064" y1="1632" y2="1632" x1="2000" />
        </branch>
        <branch name="IN_INIT">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2064" y="1568" type="branch" />
            <wire x2="2064" y1="1568" y2="1568" x1="2000" />
        </branch>
        <branch name="BUSY">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2064" y="1504" type="branch" />
            <wire x2="2064" y1="1504" y2="1504" x1="2000" />
        </branch>
        <branch name="STOP_N">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2064" y="1440" type="branch" />
            <wire x2="2064" y1="1440" y2="1440" x1="2000" />
        </branch>
        <branch name="JLINK">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2080" y="1376" type="branch" />
            <wire x2="2080" y1="1376" y2="1376" x1="2000" />
        </branch>
        <branch name="SHIFT">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2096" y="1312" type="branch" />
            <wire x2="2096" y1="1312" y2="1312" x1="2000" />
        </branch>
        <branch name="ADD">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2096" y="1248" type="branch" />
            <wire x2="2096" y1="1248" y2="1248" x1="2000" />
        </branch>
        <branch name="ITYPE">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2080" y="1184" type="branch" />
            <wire x2="2080" y1="1184" y2="1184" x1="2000" />
        </branch>
        <branch name="TEST">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2064" y="1120" type="branch" />
            <wire x2="2064" y1="1120" y2="1120" x1="2000" />
        </branch>
        <branch name="DINT_SEL">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2064" y="1056" type="branch" />
            <wire x2="2064" y1="1056" y2="1056" x1="2000" />
        </branch>
        <branch name="MDR_SEL">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2064" y="992" type="branch" />
            <wire x2="2064" y1="992" y2="992" x1="2000" />
        </branch>
        <branch name="A_SEL">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2080" y="928" type="branch" />
            <wire x2="2080" y1="928" y2="928" x1="2000" />
        </branch>
        <branch name="GPR_WE">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2064" y="864" type="branch" />
            <wire x2="2064" y1="864" y2="864" x1="2000" />
        </branch>
        <branch name="OVF">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2064" y="800" type="branch" />
            <wire x2="2064" y1="800" y2="800" x1="2000" />
        </branch>
        <branch name="PC_CE">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2064" y="736" type="branch" />
            <wire x2="2064" y1="736" y2="736" x1="2000" />
        </branch>
        <branch name="IR_CE">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2064" y="672" type="branch" />
            <wire x2="2064" y1="672" y2="672" x1="2000" />
        </branch>
        <branch name="C_CE">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2080" y="608" type="branch" />
            <wire x2="2080" y1="608" y2="608" x1="2000" />
        </branch>
        <branch name="B_CE">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2096" y="544" type="branch" />
            <wire x2="2096" y1="544" y2="544" x1="2000" />
        </branch>
        <branch name="A_CE">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2080" y="480" type="branch" />
            <wire x2="2080" y1="480" y2="480" x1="2000" />
        </branch>
        <branch name="DO(31:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1472" y="2304" type="branch" />
            <wire x2="1536" y1="2304" y2="2304" x1="1472" />
        </branch>
        <branch name="reg_adr(4:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1456" y="1888" type="branch" />
            <wire x2="1536" y1="1888" y2="1888" x1="1456" />
        </branch>
        <branch name="ACK_N">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="1472" type="branch" />
            <wire x2="1536" y1="1472" y2="1472" x1="1440" />
        </branch>
        <branch name="STEP_EN">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1424" y="1056" type="branch" />
            <wire x2="1536" y1="1056" y2="1056" x1="1424" />
        </branch>
        <branch name="RESET">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1472" y="640" type="branch" />
            <wire x2="1536" y1="640" y2="640" x1="1472" />
        </branch>
        <branch name="CLK">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1488" y="224" type="branch" />
            <wire x2="1536" y1="224" y2="224" x1="1488" />
        </branch>
        <branch name="MW">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2080" y="416" type="branch" />
            <wire x2="2064" y1="416" y2="416" x1="2000" />
            <wire x2="2080" y1="416" y2="416" x1="2064" />
        </branch>
        <branch name="MR">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2096" y="352" type="branch" />
            <wire x2="2096" y1="352" y2="352" x1="2000" />
        </branch>
        <branch name="WR_OUT_N">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2080" y="288" type="branch" />
            <wire x2="2080" y1="288" y2="288" x1="2000" />
        </branch>
        <branch name="AS_N">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2080" y="224" type="branch" />
            <wire x2="2080" y1="224" y2="224" x1="2000" />
        </branch>
        <instance x="2896" y="112" name="XLXI_30" orien="R0" />
        <branch name="STEP_EN">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="80" type="branch" />
            <wire x2="2896" y1="80" y2="80" x1="2832" />
        </branch>
        <branch name="DIN(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="80" type="branch" />
            <wire x2="3184" y1="80" y2="80" x1="3120" />
        </branch>
        <instance x="2896" y="192" name="XLXI_31" orien="R0" />
        <branch name="DIN(1)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="160" type="branch" />
            <wire x2="3184" y1="160" y2="160" x1="3120" />
        </branch>
        <branch name="ACK_N">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="160" type="branch" />
            <wire x2="2896" y1="160" y2="160" x1="2832" />
        </branch>
        <instance x="2896" y="272" name="XLXI_34" orien="R0" />
        <branch name="IN_INIT">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="240" type="branch" />
            <wire x2="2896" y1="240" y2="240" x1="2832" />
        </branch>
        <branch name="DIN(2)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="240" type="branch" />
            <wire x2="3184" y1="240" y2="240" x1="3120" />
        </branch>
        <instance x="2896" y="352" name="XLXI_35" orien="R0" />
        <branch name="DIN(3)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="320" type="branch" />
            <wire x2="3184" y1="320" y2="320" x1="3120" />
        </branch>
        <branch name="WR_OUT_N">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="320" type="branch" />
            <wire x2="2896" y1="320" y2="320" x1="2832" />
        </branch>
        <instance x="2896" y="432" name="XLXI_38" orien="R0" />
        <branch name="AS_N">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="400" type="branch" />
            <wire x2="2896" y1="400" y2="400" x1="2832" />
        </branch>
        <branch name="DIN(4)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="400" type="branch" />
            <wire x2="3184" y1="400" y2="400" x1="3120" />
        </branch>
        <instance x="2896" y="512" name="XLXI_39" orien="R0" />
        <branch name="DIN(5)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="480" type="branch" />
            <wire x2="3184" y1="480" y2="480" x1="3120" />
        </branch>
        <branch name="MR">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="480" type="branch" />
            <wire x2="2896" y1="480" y2="480" x1="2832" />
        </branch>
        <instance x="2896" y="592" name="XLXI_40" orien="R0" />
        <branch name="MW">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="560" type="branch" />
            <wire x2="2896" y1="560" y2="560" x1="2832" />
        </branch>
        <branch name="DIN(6)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="560" type="branch" />
            <wire x2="3184" y1="560" y2="560" x1="3120" />
        </branch>
        <instance x="2896" y="672" name="XLXI_41" orien="R0" />
        <branch name="DIN(7)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="640" type="branch" />
            <wire x2="3184" y1="640" y2="640" x1="3120" />
        </branch>
        <branch name="ITYPE">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="640" type="branch" />
            <wire x2="2896" y1="640" y2="640" x1="2832" />
        </branch>
        <instance x="2896" y="752" name="XLXI_42" orien="R0" />
        <branch name="MAC_STATE(0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="720" type="branch" />
            <wire x2="2896" y1="720" y2="720" x1="2832" />
        </branch>
        <branch name="DIN(8)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="720" type="branch" />
            <wire x2="3184" y1="720" y2="720" x1="3120" />
        </branch>
        <instance x="2896" y="832" name="XLXI_43" orien="R0" />
        <branch name="DIN(9)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="800" type="branch" />
            <wire x2="3184" y1="800" y2="800" x1="3120" />
        </branch>
        <branch name="MAC_STATE(1)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="800" type="branch" />
            <wire x2="2896" y1="800" y2="800" x1="2832" />
        </branch>
        <instance x="2896" y="912" name="XLXI_44" orien="R0" />
        <branch name="DLX_STATE(0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="880" type="branch" />
            <wire x2="2896" y1="880" y2="880" x1="2832" />
        </branch>
        <branch name="DIN(10)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="880" type="branch" />
            <wire x2="3184" y1="880" y2="880" x1="3120" />
        </branch>
        <instance x="2896" y="992" name="XLXI_45" orien="R0" />
        <branch name="DIN(11)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="960" type="branch" />
            <wire x2="3184" y1="960" y2="960" x1="3120" />
        </branch>
        <branch name="DLX_STATE(1)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="960" type="branch" />
            <wire x2="2896" y1="960" y2="960" x1="2832" />
        </branch>
        <instance x="2896" y="1072" name="XLXI_46" orien="R0" />
        <branch name="DLX_STATE(2)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="1040" type="branch" />
            <wire x2="2896" y1="1040" y2="1040" x1="2832" />
        </branch>
        <branch name="DIN(12)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="1040" type="branch" />
            <wire x2="3184" y1="1040" y2="1040" x1="3120" />
        </branch>
        <instance x="2896" y="1152" name="XLXI_47" orien="R0" />
        <branch name="DIN(13)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="1120" type="branch" />
            <wire x2="3184" y1="1120" y2="1120" x1="3120" />
        </branch>
        <branch name="DLX_STATE(3)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="1120" type="branch" />
            <wire x2="2896" y1="1120" y2="1120" x1="2832" />
        </branch>
        <instance x="2896" y="1232" name="XLXI_48" orien="R0" />
        <branch name="DLX_STATE(4)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="1200" type="branch" />
            <wire x2="2896" y1="1200" y2="1200" x1="2832" />
        </branch>
        <branch name="DIN(14)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="1200" type="branch" />
            <wire x2="3184" y1="1200" y2="1200" x1="3120" />
        </branch>
        <instance x="2896" y="1312" name="XLXI_49" orien="R0" />
        <branch name="DIN(15)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="1280" type="branch" />
            <wire x2="3184" y1="1280" y2="1280" x1="3120" />
        </branch>
        <branch name="PC_CE">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="1280" type="branch" />
            <wire x2="2896" y1="1280" y2="1280" x1="2832" />
        </branch>
        <instance x="2896" y="1424" name="XLXI_66" orien="R0" />
        <branch name="IR_CE">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="1392" type="branch" />
            <wire x2="2896" y1="1392" y2="1392" x1="2832" />
        </branch>
        <branch name="DIN(16)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="1392" type="branch" />
            <wire x2="3184" y1="1392" y2="1392" x1="3120" />
        </branch>
        <instance x="2896" y="1504" name="XLXI_67" orien="R0" />
        <branch name="DIN(17)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="1472" type="branch" />
            <wire x2="3184" y1="1472" y2="1472" x1="3120" />
        </branch>
        <branch name="GPR_WE">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="1472" type="branch" />
            <wire x2="2896" y1="1472" y2="1472" x1="2832" />
        </branch>
        <instance x="2896" y="1584" name="XLXI_68" orien="R0" />
        <branch name="MDR_CE">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="1552" type="branch" />
            <wire x2="2896" y1="1552" y2="1552" x1="2832" />
        </branch>
        <branch name="DIN(18)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="1552" type="branch" />
            <wire x2="3184" y1="1552" y2="1552" x1="3120" />
        </branch>
        <instance x="2896" y="1664" name="XLXI_69" orien="R0" />
        <branch name="DIN(19)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="1632" type="branch" />
            <wire x2="3184" y1="1632" y2="1632" x1="3120" />
        </branch>
        <branch name="MAR_CE">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="1632" type="branch" />
            <wire x2="2896" y1="1632" y2="1632" x1="2832" />
        </branch>
        <instance x="2896" y="1744" name="XLXI_70" orien="R0" />
        <branch name="A_CE">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="1712" type="branch" />
            <wire x2="2896" y1="1712" y2="1712" x1="2832" />
        </branch>
        <branch name="DIN(20)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="1712" type="branch" />
            <wire x2="3184" y1="1712" y2="1712" x1="3120" />
        </branch>
        <instance x="2896" y="1824" name="XLXI_71" orien="R0" />
        <branch name="DIN(21)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="1792" type="branch" />
            <wire x2="3184" y1="1792" y2="1792" x1="3120" />
        </branch>
        <branch name="B_CE">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="1792" type="branch" />
            <wire x2="2896" y1="1792" y2="1792" x1="2832" />
        </branch>
        <instance x="2896" y="1904" name="XLXI_72" orien="R0" />
        <branch name="C_CE">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="1872" type="branch" />
            <wire x2="2896" y1="1872" y2="1872" x1="2832" />
        </branch>
        <branch name="DIN(22)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="1872" type="branch" />
            <wire x2="3184" y1="1872" y2="1872" x1="3120" />
        </branch>
        <instance x="2896" y="1984" name="XLXI_73" orien="R0" />
        <branch name="DIN(23)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="1952" type="branch" />
            <wire x2="3184" y1="1952" y2="1952" x1="3120" />
        </branch>
        <branch name="A_SEL">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="1952" type="branch" />
            <wire x2="2896" y1="1952" y2="1952" x1="2832" />
        </branch>
        <instance x="2896" y="2064" name="XLXI_74" orien="R0" />
        <branch name="S1_SEL(0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="2032" type="branch" />
            <wire x2="2896" y1="2032" y2="2032" x1="2832" />
        </branch>
        <branch name="DIN(24)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="2032" type="branch" />
            <wire x2="3184" y1="2032" y2="2032" x1="3120" />
        </branch>
        <instance x="2896" y="2144" name="XLXI_75" orien="R0" />
        <branch name="DIN(25)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="2112" type="branch" />
            <wire x2="3184" y1="2112" y2="2112" x1="3120" />
        </branch>
        <branch name="S1_SEL(1)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="2112" type="branch" />
            <wire x2="2896" y1="2112" y2="2112" x1="2832" />
        </branch>
        <instance x="2896" y="2224" name="XLXI_76" orien="R0" />
        <branch name="S2_SEL(0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="2192" type="branch" />
            <wire x2="2896" y1="2192" y2="2192" x1="2832" />
        </branch>
        <branch name="DIN(26)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="2192" type="branch" />
            <wire x2="3184" y1="2192" y2="2192" x1="3120" />
        </branch>
        <instance x="2896" y="2304" name="XLXI_77" orien="R0" />
        <branch name="DIN(27)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="2272" type="branch" />
            <wire x2="3184" y1="2272" y2="2272" x1="3120" />
        </branch>
        <branch name="S2_SEL(1)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="2272" type="branch" />
            <wire x2="2896" y1="2272" y2="2272" x1="2832" />
        </branch>
        <instance x="2896" y="2384" name="XLXI_78" orien="R0" />
        <branch name="SHIFT">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="2352" type="branch" />
            <wire x2="2896" y1="2352" y2="2352" x1="2832" />
        </branch>
        <branch name="DIN(28)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="2352" type="branch" />
            <wire x2="3184" y1="2352" y2="2352" x1="3120" />
        </branch>
        <instance x="2896" y="2464" name="XLXI_79" orien="R0" />
        <branch name="DIN(29)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="2432" type="branch" />
            <wire x2="3184" y1="2432" y2="2432" x1="3120" />
        </branch>
        <branch name="ADD">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="2432" type="branch" />
            <wire x2="2896" y1="2432" y2="2432" x1="2832" />
        </branch>
        <instance x="2896" y="2544" name="XLXI_80" orien="R0" />
        <branch name="JLINK">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="2512" type="branch" />
            <wire x2="2896" y1="2512" y2="2512" x1="2832" />
        </branch>
        <branch name="DIN(30)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="2512" type="branch" />
            <wire x2="3184" y1="2512" y2="2512" x1="3120" />
        </branch>
        <instance x="2896" y="2624" name="XLXI_81" orien="R0" />
        <branch name="DIN(31)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="2592" type="branch" />
            <wire x2="3184" y1="2592" y2="2592" x1="3120" />
        </branch>
        <branch name="MUXALU_SEL">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="2592" type="branch" />
            <wire x2="2896" y1="2592" y2="2592" x1="2832" />
        </branch>
    </sheet>
    <sheet sheetnum="2" width="3520" height="2720">
        <branch name="DO(31:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2240" y="1632" type="branch" />
            <wire x2="2240" y1="1632" y2="1632" x1="1840" />
        </branch>
        <branch name="AI(9:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2240" y="1568" type="branch" />
            <wire x2="2240" y1="1568" y2="1568" x1="1840" />
        </branch>
        <branch name="sdClk_o">
            <wire x2="1856" y1="1056" y2="1056" x1="1840" />
            <wire x2="1904" y1="1056" y2="1056" x1="1856" />
        </branch>
        <branch name="sdBs_o(1:0)">
            <wire x2="1856" y1="1760" y2="1760" x1="1840" />
            <wire x2="1904" y1="1760" y2="1760" x1="1856" />
        </branch>
        <branch name="sdDqml_o">
            <wire x2="1856" y1="1184" y2="1184" x1="1840" />
            <wire x2="1904" y1="1184" y2="1184" x1="1856" />
        </branch>
        <branch name="sdDqmh_o">
            <wire x2="1856" y1="1120" y2="1120" x1="1840" />
            <wire x2="1904" y1="1120" y2="1120" x1="1856" />
        </branch>
        <branch name="sdWe_bo">
            <wire x2="1856" y1="1312" y2="1312" x1="1840" />
            <wire x2="1904" y1="1312" y2="1312" x1="1856" />
        </branch>
        <branch name="sdCas_bo">
            <wire x2="1856" y1="864" y2="864" x1="1840" />
            <wire x2="1888" y1="864" y2="864" x1="1856" />
        </branch>
        <branch name="sdRas_bo">
            <wire x2="1856" y1="1248" y2="1248" x1="1840" />
            <wire x2="1904" y1="1248" y2="1248" x1="1856" />
        </branch>
        <branch name="sdCe_bo">
            <wire x2="1856" y1="928" y2="928" x1="1840" />
            <wire x2="1888" y1="928" y2="928" x1="1856" />
        </branch>
        <branch name="sdCke_o">
            <wire x2="1856" y1="992" y2="992" x1="1840" />
            <wire x2="1888" y1="992" y2="992" x1="1856" />
        </branch>
        <branch name="IN_INIT">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1360" y="832" type="branch" />
            <wire x2="1408" y1="832" y2="832" x1="1360" />
        </branch>
        <branch name="fpgaClk_i">
            <wire x2="1408" y1="720" y2="720" x1="1376" />
        </branch>
        <branch name="MAO(31:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1344" y="1392" type="branch" />
            <wire x2="1408" y1="1392" y2="1392" x1="1344" />
        </branch>
        <branch name="R_DO(31:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1328" y="1616" type="branch" />
            <wire x2="1408" y1="1616" y2="1616" x1="1328" />
        </branch>
        <instance x="1408" y="1856" name="XLXI_23" orien="R0">
        </instance>
        <branch name="AS_N">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1360" y="608" type="branch" />
            <wire x2="1408" y1="608" y2="608" x1="1360" />
        </branch>
        <branch name="WR_OUT_N">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1344" y="1280" type="branch" />
            <wire x2="1408" y1="1280" y2="1280" x1="1344" />
        </branch>
        <branch name="RACK_N">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1360" y="944" type="branch" />
            <wire x2="1408" y1="944" y2="944" x1="1360" />
        </branch>
        <branch name="SACK_N">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1344" y="1056" type="branch" />
            <wire x2="1408" y1="1056" y2="1056" x1="1344" />
        </branch>
        <branch name="MDO(31:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1344" y="1504" type="branch" />
            <wire x2="1408" y1="1504" y2="1504" x1="1344" />
        </branch>
        <branch name="SDO(31:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1344" y="1728" type="branch" />
            <wire x2="1408" y1="1728" y2="1728" x1="1344" />
        </branch>
        <branch name="sdClkFb_i">
            <wire x2="1408" y1="1168" y2="1168" x1="1360" />
        </branch>
        <iomarker fontsize="28" x="1360" y="1168" name="sdClkFb_i" orien="R180" />
        <iomarker fontsize="28" x="1376" y="720" name="fpgaClk_i" orien="R180" />
        <branch name="RESET">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1904" y="736" type="branch" />
            <wire x2="1904" y1="736" y2="736" x1="1840" />
        </branch>
        <branch name="CLK">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1904" y="608" type="branch" />
            <wire x2="1904" y1="608" y2="608" x1="1840" />
        </branch>
        <branch name="STEP_EN">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1920" y="1440" type="branch" />
            <wire x2="1920" y1="1440" y2="1440" x1="1840" />
        </branch>
        <branch name="WR_IN_N">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1936" y="1504" type="branch" />
            <wire x2="1936" y1="1504" y2="1504" x1="1840" />
        </branch>
        <branch name="ACK_N">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1936" y="672" type="branch" />
            <wire x2="1936" y1="672" y2="672" x1="1840" />
        </branch>
        <branch name="Rsel">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1936" y="800" type="branch" />
            <wire x2="1936" y1="800" y2="800" x1="1840" />
        </branch>
        <branch name="Card_Sel">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1936" y="1376" type="branch" />
            <wire x2="1936" y1="1376" y2="1376" x1="1840" />
        </branch>
        <branch name="sdData_io(15:0)">
            <wire x2="1856" y1="1824" y2="1824" x1="1840" />
            <wire x2="1904" y1="1824" y2="1824" x1="1856" />
        </branch>
        <branch name="sdAddr_o(12:0)">
            <wire x2="1904" y1="1696" y2="1696" x1="1840" />
        </branch>
        <iomarker fontsize="28" x="1904" y="1696" name="sdAddr_o(12:0)" orien="R0" />
        <iomarker fontsize="28" x="1904" y="1824" name="sdData_io(15:0)" orien="R0" />
        <iomarker fontsize="28" x="1904" y="1056" name="sdClk_o" orien="R0" />
        <iomarker fontsize="28" x="1888" y="864" name="sdCas_bo" orien="R0" />
        <iomarker fontsize="28" x="1888" y="928" name="sdCe_bo" orien="R0" />
        <iomarker fontsize="28" x="1888" y="992" name="sdCke_o" orien="R0" />
        <iomarker fontsize="28" x="1904" y="1184" name="sdDqml_o" orien="R0" />
        <iomarker fontsize="28" x="1904" y="1120" name="sdDqmh_o" orien="R0" />
        <iomarker fontsize="28" x="1904" y="1312" name="sdWe_bo" orien="R0" />
        <iomarker fontsize="28" x="1904" y="1248" name="sdRas_bo" orien="R0" />
        <iomarker fontsize="28" x="1904" y="1760" name="sdBs_o(1:0)" orien="R0" />
    </sheet>
</drawing>