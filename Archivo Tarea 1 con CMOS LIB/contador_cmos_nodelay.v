/* Generated by Yosys 0.9 (git sha1 1979e0b) */

(* src = "ff_yosys.v:4" *)
module FF(CLK, EN, D, Q);
  (* src = "ff_yosys.v:15" *)
  wire _0_;
  wire _1_;
  wire _2_;
  wire _3_;
  (* src = "ff_yosys.v:6" *)
  input CLK;
  (* src = "ff_yosys.v:8" *)
  input D;
  (* src = "ff_yosys.v:7" *)
  input EN;
  (* src = "ff_yosys.v:9" *)
  output Q;
  NOT _4_ (
    .A(EN),
    .Y(_1_)
  );
  NAND _5_ (
    .A(D),
    .B(EN),
    .Y(_2_)
  );
  NAND _6_ (
    .A(Q),
    .B(_1_),
    .Y(_3_)
  );
  NAND _7_ (
    .A(_2_),
    .B(_3_),
    .Y(_0_)
  );
  (* src = "ff_yosys.v:15" *)
  DFF _8_ (
    .C(CLK),
    .D(_0_),
    .Q(Q)
  );
endmodule

(* src = "contador.v:3" *)
module contador(CLK, ENB, MODO, D, Q, RCO);
  wire _000_;
  wire _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  (* src = "contador.v:4" *)
  input CLK;
  (* src = "contador.v:7" *)
  input [3:0] D;
  (* src = "contador.v:5" *)
  input ENB;
  (* src = "contador.v:6" *)
  input [1:0] MODO;
  (* src = "contador.v:8" *)
  output [3:0] Q;
  (* src = "contador.v:9" *)
  output RCO;
  (* init = 4'h0 *)
  (* src = "contador.v:12" *)
  wire [3:0] d_In;
  (* src = "contador.v:13" *)
  wire d_Out;
  NOT _062_ (
    .A(Q[0]),
    .Y(_000_)
  );
  NOT _063_ (
    .A(Q[2]),
    .Y(_001_)
  );
  NOT _064_ (
    .A(Q[3]),
    .Y(_002_)
  );
  NOT _065_ (
    .A(MODO[0]),
    .Y(_003_)
  );
  NOT _066_ (
    .A(MODO[1]),
    .Y(_004_)
  );
  NOT _067_ (
    .A(D[1]),
    .Y(_005_)
  );
  NOT _068_ (
    .A(D[3]),
    .Y(_006_)
  );
  NAND _069_ (
    .A(Q[1]),
    .B(Q[0]),
    .Y(_007_)
  );
  NOT _070_ (
    .A(_007_),
    .Y(_008_)
  );
  NOR _071_ (
    .A(Q[2]),
    .B(_008_),
    .Y(_009_)
  );
  NAND _072_ (
    .A(_001_),
    .B(_007_),
    .Y(_010_)
  );
  NOR _073_ (
    .A(MODO[0]),
    .B(_004_),
    .Y(_011_)
  );
  NAND _074_ (
    .A(_003_),
    .B(MODO[1]),
    .Y(_012_)
  );
  NOR _075_ (
    .A(_010_),
    .B(_012_),
    .Y(_013_)
  );
  NAND _076_ (
    .A(_009_),
    .B(_011_),
    .Y(_014_)
  );
  NOR _077_ (
    .A(Q[1]),
    .B(Q[0]),
    .Y(_015_)
  );
  NOT _078_ (
    .A(_015_),
    .Y(_016_)
  );
  NOR _079_ (
    .A(Q[2]),
    .B(_016_),
    .Y(_017_)
  );
  NAND _080_ (
    .A(_001_),
    .B(_015_),
    .Y(_018_)
  );
  NOR _081_ (
    .A(_003_),
    .B(MODO[1]),
    .Y(_019_)
  );
  NAND _082_ (
    .A(MODO[0]),
    .B(_004_),
    .Y(_020_)
  );
  NOR _083_ (
    .A(_018_),
    .B(_020_),
    .Y(_021_)
  );
  NAND _084_ (
    .A(_017_),
    .B(_019_),
    .Y(_022_)
  );
  NOR _085_ (
    .A(_013_),
    .B(_021_),
    .Y(_023_)
  );
  NAND _086_ (
    .A(_014_),
    .B(_022_),
    .Y(_024_)
  );
  NOR _087_ (
    .A(Q[3]),
    .B(_023_),
    .Y(_025_)
  );
  NAND _088_ (
    .A(_002_),
    .B(_024_),
    .Y(_026_)
  );
  NOR _089_ (
    .A(_001_),
    .B(_007_),
    .Y(_027_)
  );
  NOT _090_ (
    .A(_027_),
    .Y(_028_)
  );
  NAND _091_ (
    .A(Q[3]),
    .B(_027_),
    .Y(_029_)
  );
  NAND _092_ (
    .A(MODO[0]),
    .B(MODO[1]),
    .Y(_030_)
  );
  NOT _093_ (
    .A(_030_),
    .Y(_031_)
  );
  NOR _094_ (
    .A(MODO[0]),
    .B(MODO[1]),
    .Y(_032_)
  );
  NOR _095_ (
    .A(_011_),
    .B(_029_),
    .Y(_033_)
  );
  NAND _096_ (
    .A(_020_),
    .B(_033_),
    .Y(_034_)
  );
  NAND _097_ (
    .A(_026_),
    .B(_034_),
    .Y(d_Out)
  );
  NAND _098_ (
    .A(D[0]),
    .B(_031_),
    .Y(_035_)
  );
  NAND _099_ (
    .A(_000_),
    .B(_030_),
    .Y(_036_)
  );
  NAND _100_ (
    .A(_035_),
    .B(_036_),
    .Y(d_In[0])
  );
  NOR _101_ (
    .A(_008_),
    .B(_015_),
    .Y(_037_)
  );
  NAND _102_ (
    .A(_003_),
    .B(_037_),
    .Y(_038_)
  );
  NOR _103_ (
    .A(_020_),
    .B(_037_),
    .Y(_039_)
  );
  NOR _104_ (
    .A(_005_),
    .B(_030_),
    .Y(_040_)
  );
  NOR _105_ (
    .A(_039_),
    .B(_040_),
    .Y(_041_)
  );
  NAND _106_ (
    .A(_038_),
    .B(_041_),
    .Y(d_In[1])
  );
  NOR _107_ (
    .A(_009_),
    .B(_027_),
    .Y(_042_)
  );
  NAND _108_ (
    .A(_010_),
    .B(_028_),
    .Y(_043_)
  );
  NAND _109_ (
    .A(_032_),
    .B(_042_),
    .Y(_044_)
  );
  NAND _110_ (
    .A(_011_),
    .B(_043_),
    .Y(_045_)
  );
  NAND _111_ (
    .A(_044_),
    .B(_045_),
    .Y(_046_)
  );
  NOR _112_ (
    .A(_001_),
    .B(_015_),
    .Y(_047_)
  );
  NAND _113_ (
    .A(_019_),
    .B(_047_),
    .Y(_048_)
  );
  NAND _114_ (
    .A(D[2]),
    .B(_031_),
    .Y(_049_)
  );
  NAND _115_ (
    .A(_022_),
    .B(_049_),
    .Y(_050_)
  );
  NOR _116_ (
    .A(_046_),
    .B(_050_),
    .Y(_051_)
  );
  NAND _117_ (
    .A(_048_),
    .B(_051_),
    .Y(d_In[2])
  );
  NOR _118_ (
    .A(_006_),
    .B(_030_),
    .Y(_052_)
  );
  NOR _119_ (
    .A(_025_),
    .B(_052_),
    .Y(_053_)
  );
  NOR _120_ (
    .A(Q[3]),
    .B(_027_),
    .Y(_054_)
  );
  NAND _121_ (
    .A(_029_),
    .B(_032_),
    .Y(_055_)
  );
  NOR _122_ (
    .A(_054_),
    .B(_055_),
    .Y(_056_)
  );
  NOR _123_ (
    .A(_017_),
    .B(_020_),
    .Y(_057_)
  );
  NOR _124_ (
    .A(_009_),
    .B(_012_),
    .Y(_058_)
  );
  NOR _125_ (
    .A(_057_),
    .B(_058_),
    .Y(_059_)
  );
  NOR _126_ (
    .A(_002_),
    .B(_059_),
    .Y(_060_)
  );
  NOR _127_ (
    .A(_056_),
    .B(_060_),
    .Y(_061_)
  );
  NAND _128_ (
    .A(_053_),
    .B(_061_),
    .Y(d_In[3])
  );
  (* module_not_derived = 32'd1 *)
  (* src = "contador.v:66" *)
  FF DFF_0 (
    .CLK(CLK),
    .D(d_In[0]),
    .EN(ENB),
    .Q(Q[0])
  );
  (* module_not_derived = 32'd1 *)
  (* src = "contador.v:67" *)
  FF DFF_1 (
    .CLK(CLK),
    .D(d_In[1]),
    .EN(ENB),
    .Q(Q[1])
  );
  (* module_not_derived = 32'd1 *)
  (* src = "contador.v:72" *)
  FF DFF_1bit (
    .CLK(CLK),
    .D(d_Out),
    .EN(ENB),
    .Q(RCO)
  );
  (* module_not_derived = 32'd1 *)
  (* src = "contador.v:68" *)
  FF DFF_2 (
    .CLK(CLK),
    .D(d_In[2]),
    .EN(ENB),
    .Q(Q[2])
  );
  (* module_not_derived = 32'd1 *)
  (* src = "contador.v:69" *)
  FF DFF_3 (
    .CLK(CLK),
    .D(d_In[3]),
    .EN(ENB),
    .Q(Q[3])
  );
endmodule

(* top =  1  *)
(* src = "contador.v:76" *)
module contador16(CLK, ENB, MODO, entrada, salida, RCO, RCO162, RCO163, RCO164);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  (* src = "contador.v:77" *)
  input CLK;
  (* src = "contador.v:78" *)
  input ENB;
  (* src = "contador.v:79" *)
  input [1:0] MODO;
  (* src = "contador.v:82" *)
  output RCO;
  (* src = "contador.v:83" *)
  output RCO162;
  (* src = "contador.v:84" *)
  output RCO163;
  (* src = "contador.v:85" *)
  output RCO164;
  (* src = "contador.v:101" *)
  wire clk2;
  (* src = "contador.v:147" *)
  wire clk3;
  (* src = "contador.v:192" *)
  wire clk4;
  (* src = "contador.v:80" *)
  input [15:0] entrada;
  (* src = "contador.v:81" *)
  output [15:0] salida;
  NAND _06_ (
    .A(MODO[0]),
    .B(MODO[1]),
    .Y(_00_)
  );
  NOT _07_ (
    .A(_00_),
    .Y(_01_)
  );
  NAND _08_ (
    .A(CLK),
    .B(_01_),
    .Y(_02_)
  );
  NAND _09_ (
    .A(RCO),
    .B(_00_),
    .Y(_03_)
  );
  NAND _10_ (
    .A(_02_),
    .B(_03_),
    .Y(clk2)
  );
  NAND _11_ (
    .A(RCO162),
    .B(_00_),
    .Y(_04_)
  );
  NAND _12_ (
    .A(_02_),
    .B(_04_),
    .Y(clk3)
  );
  NAND _13_ (
    .A(RCO163),
    .B(_00_),
    .Y(_05_)
  );
  NAND _14_ (
    .A(_02_),
    .B(_05_),
    .Y(clk4)
  );
  (* module_not_derived = 32'd1 *)
  (* src = "contador.v:93" *)
  contador contador1 (
    .CLK(CLK),
    .D(entrada[3:0]),
    .ENB(ENB),
    .MODO(MODO),
    .Q(salida[3:0]),
    .RCO(RCO)
  );
  (* module_not_derived = 32'd1 *)
  (* src = "contador.v:139" *)
  contador contador2 (
    .CLK(clk2),
    .D(entrada[7:4]),
    .ENB(ENB),
    .MODO(MODO),
    .Q(salida[7:4]),
    .RCO(RCO162)
  );
  (* module_not_derived = 32'd1 *)
  (* src = "contador.v:184" *)
  contador contador3 (
    .CLK(clk3),
    .D(entrada[11:8]),
    .ENB(ENB),
    .MODO(MODO),
    .Q(salida[11:8]),
    .RCO(RCO163)
  );
  (* module_not_derived = 32'd1 *)
  (* src = "contador.v:236" *)
  contador contador4 (
    .CLK(clk4),
    .D(entrada[15:12]),
    .ENB(ENB),
    .MODO(MODO),
    .Q(salida[15:12]),
    .RCO(RCO164)
  );
endmodule
