function Recloser(block)
setup(block);

function setup(block)
block.NumDialogPrms = 8;

    Register number of ports
block.NumInputPorts  = 13;
block.NumOutputPorts = 1;

block.InputPort(1).SamplingMode = 'Sample';
block.InputPort(2).SamplingMode = 'Sample';
block.InputPort(3).SamplingMode = 'Sample';
block.InputPort(4).SamplingMode = 'Sample';
block.InputPort(5).SamplingMode = 'Sample';
block.InputPort(6).SamplingMode = 'Sample';
block.InputPort(7).SamplingMode = 'Sample';
block.InputPort(8).SamplingMode = 'Sample';
block.InputPort(9).SamplingMode = 'Sample';
block.InputPort(10).SamplingMode = 'Sample';
block.InputPort(11).SamplingMode = 'Sample';
block.InputPort(12).SamplingMode = 'Sample';
block.InputPort(13).SamplingMode = 'Sample';
block.OutputPort(1).SamplingMode = 'Sample';


block.SampleTimes = [1/960 0];

block.SimStateCompliance = 'DefaultSimState';

----------------------------------------------------------

block.RegBlockMethod('PostPropagationSetup',    @DoPostPropSetup);
block.RegBlockMethod('InitializeConditions', @InitializeConditions);
block.RegBlockMethod('Start', @Start);
block.RegBlockMethod('Outputs', @Outputs);     
block.RegBlockMethod('Update', @Update);
block.RegBlockMethod('Derivatives', @Derivatives);
block.RegBlockMethod('Terminate', @Terminate);     Required

function DoPostPropSetup(block)
block.NumDworks = 1;
  
  block.Dwork(1).Name            = 'cta';
  block.Dwork(1).Dimensions      = 1;
  block.Dwork(1).DatatypeID      = 0;      
  block.Dwork(1).Complexity      = '  '; 
  block.Dwork(1).UsedAsDiscState = true;
  
  block.NumDworks = 2;
  
  block.Dwork(2).Name            = 'ctb';
  block.Dwork(2).Dimensions      = 1;
  block.Dwork(2).DatatypeID      = 0;      
  block.Dwork(2).Complexity      = '  '; 
  block.Dwork(2).UsedAsDiscState = true;
  
  block.NumDworks = 3;
  
  block.Dwork(3).Name            = 'ctc';
  block.Dwork(3).Dimensions      = 1;
  block.Dwork(3).DatatypeID      = 0;      
  block.Dwork(3).Complexity      = '  '; 
  block.Dwork(3).UsedAsDiscState = true;
  
  block.NumDworks = 4;
  
  block.Dwork(4).Name            = 'ctn';
  block.Dwork(4).Dimensions      = 1;
  block.Dwork(4).DatatypeID      = 0;      
  block.Dwork(4).Complexity      = '  '; 
  block.Dwork(4).UsedAsDiscState = true;

  block.NumDworks = 5;
  
  block.Dwork(5).Name            = 'fa';
  block.Dwork(5).Dimensions      = 1;
  block.Dwork(5).DatatypeID      = 0;      
  block.Dwork(5).Complexity      = '  '; 
  block.Dwork(5).UsedAsDiscState = true;
  
  block.NumDworks = 6;
  
  block.Dwork(6).Name            = 'fb';
  block.Dwork(6).Dimensions      = 1;
  block.Dwork(6).DatatypeID      = 0;      
  block.Dwork(6).Complexity      = '  '; 
  block.Dwork(6).UsedAsDiscState = true;
  
  block.NumDworks = 7;
  
  block.Dwork(7).Name            = 'fc';
  block.Dwork(7).Dimensions      = 1;
  block.Dwork(7).DatatypeID      = 0;      
  block.Dwork(7).Complexity      = '  '; 
  block.Dwork(7).UsedAsDiscState = true;
  
  block.NumDworks = 8;
  
  block.Dwork(8).Name            = 'fg';
  block.Dwork(8).Dimensions      = 1;
  block.Dwork(8).DatatypeID      = 0;      
  block.Dwork(8).Complexity      = '  '; 
  block.Dwork(8).UsedAsDiscState = true;
  
  block.NumDworks = 9;
  
  block.Dwork(9).Name            = 'Sa';
  block.Dwork(9).Dimensions      = 1;
  block.Dwork(9).DatatypeID      = 0;           
  block.Dwork(9).Complexity      = '  ';       
  block.Dwork(9).UsedAsDiscState = true;
  
  block.NumDworks = 10;
  
  block.Dwork(10).Name            = 'Sb';
  block.Dwork(10).Dimensions      = 1;
  block.Dwork(10).DatatypeID      = 0;           
  block.Dwork(10).Complexity      = '  ';       
  block.Dwork(10).UsedAsDiscState = true;
  
  block.NumDworks = 11;
  
  block.Dwork(11).Name            = 'Sc';
  block.Dwork(11).Dimensions      = 1;
  block.Dwork(11).DatatypeID      = 0;           
  block.Dwork(11).Complexity      = '  ';       
  block.Dwork(11).UsedAsDiscState = true;
  
  block.NumDworks = 12;
  
  block.Dwork(12).Name            = 'Sg';
  block.Dwork(12).Dimensions      = 1;
  block.Dwork(12).DatatypeID      = 0;           
  block.Dwork(12).Complexity      = '  ';       
  block.Dwork(12).UsedAsDiscState = true;
  
  block.NumDworks = 13;
  
  block.Dwork(13).Name            = 'T0a';
  block.Dwork(13).Dimensions      = 1;
  block.Dwork(13).DatatypeID      = 0;           
  block.Dwork(13).Complexity      = '  ';       
  block.Dwork(13).UsedAsDiscState = true;
  
  block.NumDworks = 14;
  
  block.Dwork(14).Name            = 'T0b';
  block.Dwork(14).Dimensions      = 1;
  block.Dwork(14).DatatypeID      = 0;           
  block.Dwork(14).Complexity      = '  ';       
  block.Dwork(14).UsedAsDiscState = true;
  
  block.NumDworks = 15;
  
  block.Dwork(15).Name            = 'T0c';
  block.Dwork(15).Dimensions      = 1;
  block.Dwork(15).DatatypeID      = 0;           
  block.Dwork(15).Complexity      = '  ';       
  block.Dwork(15).UsedAsDiscState = true;
  
  block.NumDworks = 16;
  
  block.Dwork(16).Name            = 'T0n';
  block.Dwork(16).Dimensions      = 1;
  block.Dwork(16).DatatypeID      = 0;           
  block.Dwork(16).Complexity      = '  ';       
  block.Dwork(16).UsedAsDiscState = true;
  
  block.NumDworks = 17;
  
  block.Dwork(17).Name            = 'trav_a';
  block.Dwork(17).Dimensions      = 1;
  block.Dwork(17).DatatypeID      = 0;           
  block.Dwork(17).Complexity      = '  ';       
  block.Dwork(17).UsedAsDiscState = true;
  
  block.NumDworks = 18;
  
  block.Dwork(18).Name            = 'trav_b';
  block.Dwork(18).Dimensions      = 1;
  block.Dwork(18).DatatypeID      = 0;           
  block.Dwork(18).Complexity      = '  ';       
  block.Dwork(18).UsedAsDiscState = true;
  
  block.NumDworks = 19;
  
  block.Dwork(19).Name            = 'trav_c';
  block.Dwork(19).Dimensions      = 1;
  block.Dwork(19).DatatypeID      = 0;           
  block.Dwork(19).Complexity      = '  ';       
  block.Dwork(19).UsedAsDiscState = true;
  
  block.NumDworks = 20;
  
  block.Dwork(20).Name            = 'trav_n';
  block.Dwork(20).Dimensions      = 1;
  block.Dwork(20).DatatypeID      = 0;           
  block.Dwork(20).Complexity      = '  ';       
  block.Dwork(20).UsedAsDiscState = true;
  
  block.NumDworks = 21;
  
  block.Dwork(21).Name            = 'VabRe';
  block.Dwork(21).Dimensions      = 1;
  block.Dwork(21).DatatypeID      = 0;           
  block.Dwork(21).Complexity      = '  ';       
  block.Dwork(21).UsedAsDiscState = true;
  
  block.NumDworks = 22;
  
  block.Dwork(22).Name            = 'VabIm';
  block.Dwork(22).Dimensions      = 1;
  block.Dwork(22).DatatypeID      = 0;           
  block.Dwork(22).Complexity      = '  ';       
  block.Dwork(22).UsedAsDiscState = true;
  
  block.NumDworks = 23;
  
  block.Dwork(23).Name            = 'VbcRe';
  block.Dwork(23).Dimensions      = 1;
  block.Dwork(23).DatatypeID      = 0;           
  block.Dwork(23).Complexity      = '  ';       
  block.Dwork(23).UsedAsDiscState = true;
  
  block.NumDworks = 24;
  
  block.Dwork(24).Name            = 'VbcIm';
  block.Dwork(24).Dimensions      = 1;
  block.Dwork(24).DatatypeID      = 0;           
  block.Dwork(24).Complexity      = '  ';       
  block.Dwork(24).UsedAsDiscState = true;
  
  block.NumDworks = 25;
  
  block.Dwork(25).Name            = 'VcaRe';
  block.Dwork(25).Dimensions      = 1;
  block.Dwork(25).DatatypeID      = 0;           
  block.Dwork(25).Complexity      = '  ';       
  block.Dwork(25).UsedAsDiscState = true;
  
  block.NumDworks = 26;
  
  block.Dwork(26).Name            = 'VcaIm';
  block.Dwork(26).Dimensions      = 1;
  block.Dwork(26).DatatypeID      = 0;           
  block.Dwork(26).Complexity      = '  ';       
  block.Dwork(26).UsedAsDiscState = true;
  
  block.NumDworks = 27;
  
  block.Dwork(27).Name            = 'InRe';
  block.Dwork(27).Dimensions      = 1;
  block.Dwork(27).DatatypeID      = 0;           
  block.Dwork(27).Complexity      = '  ';       
  block.Dwork(27).UsedAsDiscState = true;
  
  block.NumDworks = 28;
  
  block.Dwork(28).Name            = 'InIm';
  block.Dwork(28).Dimensions      = 1;
  block.Dwork(28).DatatypeID      = 0;           
  block.Dwork(28).Complexity      = '  ';       
  block.Dwork(28).UsedAsDiscState = true;
  
  block.NumDworks = 29;
  block.Dwork(29).Name            = 'VnRe';
  block.Dwork(29).Dimensions      = 1;
  block.Dwork(29).DatatypeID      = 0;           
  block.Dwork(29).Complexity      = '  ';       
  block.Dwork(29).UsedAsDiscState = true;
  
  block.NumDworks = 30;
  
  block.Dwork(30).Name            = 'VnIm';
  block.Dwork(30).Dimensions      = 1;
  block.Dwork(30).DatatypeID      = 0;           
  block.Dwork(30).Complexity      = '  ';       
  block.Dwork(30).UsedAsDiscState = true;
  
  block.NumDworks = 31;
  
  block.Dwork(31).Name            = 'Ia';
  block.Dwork(31).Dimensions      = 1;
  block.Dwork(31).DatatypeID      = 0;           
  block.Dwork(31).Complexity      = '  ';       
  block.Dwork(31).UsedAsDiscState = true;
  
  block.NumDworks = 32;
  
  block.Dwork(32).Name            = 'Ma';
  block.Dwork(32).Dimensions      = 1;
  block.Dwork(32).DatatypeID      = 0;           
  block.Dwork(32).Complexity      = '  ';       
  block.Dwork(32).UsedAsDiscState = true;
  
  block.NumDworks = 33;
  
  block.Dwork(33).Name            = 'Vbc';
  block.Dwork(33).Dimensions      = 1;
  block.Dwork(33).DatatypeID      = 0;           
  block.Dwork(33).Complexity      = '  ';       
  block.Dwork(33).UsedAsDiscState = true;
  
  block.NumDworks = 34;
  
  block.Dwork(34).Name            = 'thetaA';
  block.Dwork(34).Dimensions      = 1;
  block.Dwork(34).DatatypeID      = 0;           
  block.Dwork(34).Complexity      = '  ';       
  block.Dwork(34).UsedAsDiscState = true;
  
  block.NumDworks = 35;
  
  block.Dwork(35).Name            = 'Ha';
  block.Dwork(35).Dimensions      = 1;
  block.Dwork(35).DatatypeID      = 0;           
  block.Dwork(35).Complexity      = '  ';       
  block.Dwork(35).UsedAsDiscState = true;
  
  block.NumDworks = 36;
  
  block.Dwork(36).Name            = 'ya';
  block.Dwork(36).Dimensions      = 1;
  block.Dwork(36).DatatypeID      = 0;           
  block.Dwork(36).Complexity      = '  ';       
  block.Dwork(36).UsedAsDiscState = true;
  
  block.NumDworks = 37;
  
  block.Dwork(37).Name            = 'ta';
  block.Dwork(37).Dimensions      = 1;
  block.Dwork(37).DatatypeID      = 0;           
  block.Dwork(37).Complexity      = '  ';       
  block.Dwork(37).UsedAsDiscState = true;
  
  block.NumDworks = 38;
  
  block.Dwork(38).Name            = 'M0a';
  block.Dwork(38).Dimensions      = 1;
  block.Dwork(38).DatatypeID      = 0;           
  block.Dwork(38).Complexity      = '  ';       
  block.Dwork(38).UsedAsDiscState = true;
  
  block.NumDworks = 39;
  
  block.Dwork(39).Name            = 'Ib';
  block.Dwork(39).Dimensions      = 1;
  block.Dwork(39).DatatypeID      = 0;           
  block.Dwork(39).Complexity      = '  ';       
  block.Dwork(39).UsedAsDiscState = true;    
   
  block.NumDworks = 40;
  
  block.Dwork(40).Name            = 'Mb';
  block.Dwork(40).Dimensions      = 1;
  block.Dwork(40).DatatypeID      = 0;           
  block.Dwork(40).Complexity      = '  ';       
  block.Dwork(40).UsedAsDiscState = true;    
  
  block.NumDworks = 41;
  
  block.Dwork(41).Name            = 'Vca';
  block.Dwork(41).Dimensions      = 1;
  block.Dwork(41).DatatypeID      = 0;           
  block.Dwork(41).Complexity      = '  ';       
  block.Dwork(41).UsedAsDiscState = true;    
    
  block.NumDworks = 42;
  
  block.Dwork(42).Name            = 'thetaB';
  block.Dwork(42).Dimensions      = 1;
  block.Dwork(42).DatatypeID      = 0;           
  block.Dwork(42).Complexity      = '  ';       
  block.Dwork(42).UsedAsDiscState = true;    
  
  block.NumDworks = 43;
  
  block.Dwork(43).Name            = 'Hb';
  block.Dwork(43).Dimensions      = 1;
  block.Dwork(43).DatatypeID      = 0;           
  block.Dwork(43).Complexity      = '  ';       
  block.Dwork(43).UsedAsDiscState = true;    
  
  block.NumDworks = 44;
  
  block.Dwork(44).Name            = 'yb';
  block.Dwork(44).Dimensions      = 1;
  block.Dwork(44).DatatypeID      = 0;           
  block.Dwork(44).Complexity      = '  ';       
  block.Dwork(44).UsedAsDiscState = true;
  
  block.NumDworks = 45;
  
  block.Dwork(45).Name            = 'tb';
  block.Dwork(45).Dimensions      = 1;
  block.Dwork(45).DatatypeID      = 0;           
  block.Dwork(45).Complexity      = '  ';       
  block.Dwork(45).UsedAsDiscState = true;
  
  block.NumDworks = 46;
  
  block.Dwork(46).Name            = 'M0b';
  block.Dwork(46).Dimensions      = 1;
  block.Dwork(46).DatatypeID      = 0;           
  block.Dwork(46).Complexity      = '  ';       
  block.Dwork(46).UsedAsDiscState = true;
  
  block.NumDworks = 47;
  
  block.Dwork(47).Name            = 'Ic';
  block.Dwork(47).Dimensions      = 1;
  block.Dwork(47).DatatypeID      = 0;           
  block.Dwork(47).Complexity      = '  ';       
  block.Dwork(47).UsedAsDiscState = true;


  block.NumDworks = 48;
  
  block.Dwork(48).Name            = 'Mc';
  block.Dwork(48).Dimensions      = 1;
  block.Dwork(48).DatatypeID      = 0;           
  block.Dwork(48).Complexity      = '  ';       
  block.Dwork(48).UsedAsDiscState = true;  
  
  block.NumDworks = 49;
  
  block.Dwork(49).Name            = 'Vab';
  block.Dwork(49).Dimensions      = 1;
  block.Dwork(49).DatatypeID      = 0;           
  block.Dwork(49).Complexity      = '  ';       
  block.Dwork(49).UsedAsDiscState = true;  

  block.NumDworks = 50;
  
  block.Dwork(50).Name            = 'thetaC';
  block.Dwork(50).Dimensions      = 1;
  block.Dwork(50).DatatypeID      = 0;           
  block.Dwork(50).Complexity      = '  ';       
  block.Dwork(50).UsedAsDiscState = true; 

  block.NumDworks = 51;
  
  block.Dwork(51).Name            = 'Hc';
  block.Dwork(51).Dimensions      = 1;
  block.Dwork(51).DatatypeID      = 0;           
  block.Dwork(51).Complexity      = '  ';       
  block.Dwork(51).UsedAsDiscState = true; 

  block.NumDworks = 52;
  
  block.Dwork(52).Name            = 'yc';
  block.Dwork(52).Dimensions      = 1;
  block.Dwork(52).DatatypeID      = 0;           
  block.Dwork(52).Complexity      = '  ';       
  block.Dwork(52).UsedAsDiscState = true; 
  
  block.NumDworks = 53;
  
  block.Dwork(53).Name            = 'tc';
  block.Dwork(53).Dimensions      = 1;
  block.Dwork(53).DatatypeID      = 0;           
  block.Dwork(53).Complexity      = '  ';       
  block.Dwork(53).UsedAsDiscState = true; 
  
  block.NumDworks = 54;
  
  block.Dwork(54).Name            = 'M0c';
  block.Dwork(54).Dimensions      = 1;
  block.Dwork(54).DatatypeID      = 0;           
  block.Dwork(54).Complexity      = '  ';       
  block.Dwork(54).UsedAsDiscState = true;
  
  block.NumDworks = 55;
  
  block.Dwork(55).Name            = 'In';
  block.Dwork(55).Dimensions      = 1;
  block.Dwork(55).DatatypeID      = 0;           
  block.Dwork(55).Complexity      = '  ';       
  block.Dwork(55).UsedAsDiscState = true;
  
  block.NumDworks = 56;
  
  block.Dwork(56).Name            = 'Vn';
  block.Dwork(56).Dimensions      = 1;
  block.Dwork(56).DatatypeID      = 0;           
  block.Dwork(56).Complexity      = '  ';       
  block.Dwork(56).UsedAsDiscState = true;
  
  block.NumDworks = 57;
  
  block.Dwork(57).Name            = 'theta0';
  block.Dwork(57).Dimensions      = 1;
  block.Dwork(57).DatatypeID      = 0;           
  block.Dwork(57).Complexity      = '  ';       
  block.Dwork(57).UsedAsDiscState = true;
  
  block.NumDworks = 58;
  
  block.Dwork(58).Name            = 'H0';
  block.Dwork(58).Dimensions      = 1;
  block.Dwork(58).DatatypeID      = 0;           
  block.Dwork(58).Complexity      = '  ';       
  block.Dwork(58).UsedAsDiscState = true;
  
  block.NumDworks = 59;
  
  block.Dwork(59).Name            = 'Mn';
  block.Dwork(59).Dimensions      = 1;
  block.Dwork(59).DatatypeID      = 0;           
  block.Dwork(59).Complexity      = '  ';       
  block.Dwork(59).UsedAsDiscState = true;
  
  block.NumDworks = 60;
  
  block.Dwork(60).Name            = 'yg';
  block.Dwork(60).Dimensions      = 1;
  block.Dwork(60).DatatypeID      = 0;           
  block.Dwork(60).Complexity      = '  ';       
  block.Dwork(60).UsedAsDiscState = true;
  
   block.NumDworks = 61;
  
  block.Dwork(61).Name            = 'tn';
  block.Dwork(61).Dimensions      = 1;
  block.Dwork(61).DatatypeID      = 0;           
  block.Dwork(61).Complexity      = '  ';       
  block.Dwork(61).UsedAsDiscState = true;
  
  block.NumDworks = 62;
  
  block.Dwork(62).Name            = 'M0n';
  block.Dwork(62).Dimensions      = 1;
  block.Dwork(62).DatatypeID      = 0;           
  block.Dwork(62).Complexity      = '  ';       
  block.Dwork(62).UsedAsDiscState = true;
  
  block.NumDworks = 63;
  
  block.Dwork(63).Name            = 'cont';
  block.Dwork(63).Dimensions      = 1;
  block.Dwork(63).DatatypeID      = 0;           
  block.Dwork(63).Complexity      = '  ';       
  block.Dwork(63).UsedAsDiscState = true;
  
  block.NumDworks = 64;
  
  block.Dwork(64).Name            = 'A';
  block.Dwork(64).Dimensions      = 1;
  block.Dwork(64).DatatypeID      = 0;           
  block.Dwork(64).Complexity      = '  ';       
  block.Dwork(64).UsedAsDiscState = true;
  
   block.NumDworks = 65;
  
  block.Dwork(65).Name            = 'B';
  block.Dwork(65).Dimensions      = 1;
  block.Dwork(65).DatatypeID      = 0;           
  block.Dwork(65).Complexity      = '  ';       
  block.Dwork(65).UsedAsDiscState = true;
  
   block.NumDworks = 66;
  
  block.Dwork(66).Name            = 'p';
  block.Dwork(66).Dimensions      = 1;
  block.Dwork(66).DatatypeID      = 0;           
  block.Dwork(66).Complexity      = '  ';       
  block.Dwork(66).UsedAsDiscState = true;
  
   block.NumDworks = 67;
  
  block.Dwork(67).Name            = 'An';
  block.Dwork(67).Dimensions      = 1;
  block.Dwork(67).DatatypeID      = 0;           
  block.Dwork(67).Complexity      = '  ';       
  block.Dwork(67).UsedAsDiscState = true;
  
   block.NumDworks = 68;
  
  block.Dwork(68).Name            = 'Bn';
  block.Dwork(68).Dimensions      = 1;
  block.Dwork(68).DatatypeID      = 0;           
  block.Dwork(68).Complexity      = '  ';       
  block.Dwork(68).UsedAsDiscState = true;
  
   block.NumDworks = 69;
  
  block.Dwork(69).Name            = 'pn';
  block.Dwork(69).Dimensions      = 1;
  block.Dwork(69).DatatypeID      = 0;           
  block.Dwork(69).Complexity      = '  ';       
  block.Dwork(69).UsedAsDiscState = true;

     block.NumDworks = 70;
  
  block.Dwork(70).Name            = 'enable';
  block.Dwork(70).Dimensions      = 1;
  block.Dwork(70).DatatypeID      = 0;           
  block.Dwork(70).Complexity      = '  ';       
  block.Dwork(70).UsedAsDiscState = true;

      
function InitializeConditions(block)

      
function Start(block)

block.Dwork(1).Data = 0;    
block.Dwork(2).Data = 0;   
block.Dwork(3).Data = 0;
block.Dwork(4).Data = 0;    
block.Dwork(5).Data = 0;   
block.Dwork(6).Data = 0;   
block.Dwork(7).Data = 0;   
block.Dwork(8).Data = 0;   
block.Dwork(9).Data = 0;   
block.Dwork(10).Data = 0;   
block.Dwork(11).Data = 0;   
block.Dwork(12).Data = 0;   
block.Dwork(13).Data = 10000;  
block.Dwork(14).Data = 10000;   
block.Dwork(15).Data = 10000;   
block.Dwork(16).Data = 10000;   
block.Dwork(17).Data = 9999;   
block.Dwork(18).Data = 9999;   
block.Dwork(19).Data = 9999;   
block.Dwork(63).Data = 0;   
   

      
      
function Outputs(block)


block.OutputPort(1).Data = block.Dwork(5).Data + block.Dwork(6).Data + block.Dwork(7).Data + block.Dwork(8).Data;   
      
function Update(block)

block.Dwork(70).Data = block.InputPort(13).Data;

Ip = block.DialogPrm(1).Data;
TMS = block.DialogPrm(2).Data;
tau = block.DialogPrm(3).Data;
curvaf = block.DialogPrm(4).Data;
Ipn = block.DialogPrm(5).Data;
TMSn = block.DialogPrm(6).Data;
taun = block.DialogPrm(7).Data;
curvan = block.DialogPrm(8).Data;

A = block.Dwork(64).Data;
B = block.Dwork(65).Data;
p = block.Dwork(66).Data;

An = block.Dwork(67).Data;
Bn = block.Dwork(68).Data;
pn = block.Dwork(69).Data;

switch (curvaf)
	case 1    
		A = 0.14;
		p = 0.02;
		B = 0;
		
	case 2   
		A = 13.5;
		p = 1;
		B = 0;
		   
	case 3   
		A = 80;
		p = 2;
		B = 0;
		
end


block.Dwork(21).Data = block.InputPort(1).Data - block.InputPort(3).Data;   
block.Dwork(22).Data = block.InputPort(2).Data - block.InputPort(4).Data;   
block.Dwork(23).Data = block.InputPort(3).Data - block.InputPort(5).Data;   
block.Dwork(24).Data = block.InputPort(4).Data - block.InputPort(6).Data;   
block.Dwork(25).Data = block.InputPort(5).Data - block.InputPort(1).Data;   
block.Dwork(26).Data = block.InputPort(6).Data - block.InputPort(2).Data;   

    Calculando as componentes de sequência zero
block.Dwork(27).Data = block.InputPort(7).Data + block.InputPort(9).Data + block.InputPort(11).Data;   
block.Dwork(28).Data = block.InputPort(8).Data + block.InputPort(10).Data + block.InputPort(12).Data
block.Dwork(29).Data = block.InputPort(1).Data + block.InputPort(3).Data + block.InputPort(5).Data;   
block.Dwork(30).Data = block.InputPort(2).Data + block.InputPort(4).Data + block.InputPort(6).Data;   

   --------------------------------------------------------------   
   	Calculando as condições para falta nas fases	   	          
   --------------------------------------------------------------   

    
block.Dwork(31).Data = sqrt(block.InputPort(7).Data*block.InputPort(7).Data + block.InputPort(8).Data*block.InputPort(8).Data);   
block.Dwork(32).Data = block.Dwork(31).Data/Ip;   
block.Dwork(33).Data = sqrt(block.Dwork(23).Data*block.Dwork(23).Data + block.Dwork(24).Data*block.Dwork(24).Data
block.Dwork(34).Data = atan2(block.InputPort(8).Data, block.InputPort(7).Data)-atan2(block.Dwork(24).Data, block.Dwork(23).Data);   
block.Dwork(35).Data = block.Dwork(31).Data*block.Dwork(33).Data*cos(block.Dwork(34).Data-tau);   
   
    falta na terra
block.Dwork(55).Data = sqrt(block.Dwork(27).Data*block.Dwork(27).Data + block.Dwork(28).Data*block.Dwork(28).Data);   
block.Dwork(59).Data = block.Dwork(55).Data/Ipn;   
block.Dwork(56).Data = sqrt(block.Dwork(29).Data*block.Dwork(29).Data + block.Dwork(30).Data*block.Dwork(30).Data
block.Dwork(57).Data = atan2(block.Dwork(28).Data, block.Dwork(27).Data)-atan2(block.Dwork(30).Data, block.Dwork(29).Data);   
block.Dwork(58).Data = block.Dwork(55).Data*block.Dwork(56).Data*cos(block.Dwork(57).Data-taun
           -------------------------------------------   
     	   	Tomando Decisão para trip Fase A           
		   -------------------------------------------   
if block.Dwork(1).Data == 1   
     if (block.Dwork(32).Data > 1 && block.Dwork(35).Data > 0
         if block.Dwork(9).Data >= block.Dwork(37).Data    
             block.Dwork(5).Data = 1
              block.Dwork(37).Data = (0.14*TMS)/((block.Dwork(32).Data ^0.02)-1);
             block.Dwork(9).Data = 0;   
             block.Dwork(1).Data = 0;   
             block.Dwork(36).Data = 0;
             a=toc;
         else
             block.Dwork(9).Data = block.Dwork(9).Data + 1/960;   
         end
     else
         block.Dwork(1).Data = 0;   
         block.Dwork(9).Data = 0;   
     end
end
           -------------------------------------------   
     	   	Tomando Decisão para trip terra            
		   -------------------------------------------   
if block.Dwork(4).Data == 1
    if (block.Dwork(59).Data > 1 && block.Dwork(58).Data < 0
 block.Dwork(61).Data = (0.14*TMSn)/((block.Dwork(59).Data ^0.02)-1
        if block.Dwork(12).Data >= block.Dwork(61).Data   
            block.Dwork(8).Data = 1;
            block.Dwork(12).Data = 0;
            block.Dwork(4).Data = 0;
            block.Dwork(60).Data = 0;
        else
            block.Dwork(12).Data = block.Dwork(12).Data + 1/960;
        end
    else
        block.Dwork(12).Data = 0;
        block.Dwork(4).Data = 0;
    end
end

if block.Dwork(70).Data > 0.134 && block.Dwork(5).Data==1  
    block.Dwork(5).Data = 1;
else
    block.Dwork(5).Data = 0;    
end
if block.Dwork(70).Data > 0.134 && block.Dwork(6).Data==1
    block.Dwork(6).Data = 1;
else
    block.Dwork(6).Data = 0;    
end
if block.Dwork(70).Data >0.134 && block.Dwork(7).Data==1
    block.Dwork(7).Data = 1;
else
    block.Dwork(7).Data = 0;    
end
if block.Dwork(70).Data > 0.134 && block.Dwork(8).Data==1
    block.Dwork(8).Data = 1;
else
    block.Dwork(8).Data = 0;    
end

function Derivatives(block)
function Terminate(block)

