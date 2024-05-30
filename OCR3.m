function OCR3(block)
setup(block);

function setup(block)
%% Register number of dialog parameters   
block.NumDialogPrms = 8;

% Register number of ports
block.NumInputPorts  = 12;
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
block.OutputPort(1).SamplingMode = 'Sample';
%block.OutputPort(2).SamplingMode = 'Sample';


block.SampleTimes = [1/960 0;
block.SimStateCompliance = 'DefaultSimState';

block.RegBlockMethod('PostPropagationSetup',    @DoPostPropSetup);
block.RegBlockMethod('InitializeConditions', @InitializeConditions);
block.RegBlockMethod('Start', @Start);
block.RegBlockMethod('Outputs', @Outputs);     % Required
block.RegBlockMethod('Update', @Update);
block.RegBlockMethod('Derivatives', @Derivatives);
block.RegBlockMethod('Terminate', @Terminate); % Required

function DoPostPropSetup(block)
block.NumDworks = 1;
  
  block.Dwork(1).Name            = 'cta';
  block.Dwork(1).Dimensions      = 1;
  block.Dwork(1).DatatypeID      = 0;      % double
  block.Dwork(1).Complexity      = 'Real'; % real
  block.Dwork(1).UsedAsDiscState = true;
  
  block.NumDworks = 2;
  
  block.Dwork(2).Name            = 'ctb';
  block.Dwork(2).Dimensions      = 1;
  block.Dwork(2).DatatypeID      = 0;      % double
  block.Dwork(2).Complexity      = 'Real'; % real
  block.Dwork(2).UsedAsDiscState = true;
  
  block.NumDworks = 3;
  
  block.Dwork(3).Name            = 'ctc';
  block.Dwork(3).Dimensions      = 1;
  block.Dwork(3).DatatypeID      = 0;      % double
  block.Dwork(3).Complexity      = 'Real'; % real
  block.Dwork(3).UsedAsDiscState = true;
  
  block.NumDworks = 4;
  
  block.Dwork(4).Name            = 'ctn';
  block.Dwork(4).Dimensions      = 1;
  block.Dwork(4).DatatypeID      = 0;      % double
  block.Dwork(4).Complexity      = 'Real'; % real
  block.Dwork(4).UsedAsDiscState = true;

  block.NumDworks = 5;
  
  block.Dwork(5).Name            = 'fa';
  block.Dwork(5).Dimensions      = 1;
  block.Dwork(5).DatatypeID      = 0;      % double
  block.Dwork(5).Complexity      = 'Real'; % real
  block.Dwork(5).UsedAsDiscState = true;
  
  block.NumDworks = 6;
  
  block.Dwork(6).Name            = 'fb';
  block.Dwork(6).Dimensions      = 1;
  block.Dwork(6).DatatypeID      = 0;      % double
  block.Dwork(6).Complexity      = 'Real'; % real
  block.Dwork(6).UsedAsDiscState = true;
  
  block.NumDworks = 7;
  
  block.Dwork(7).Name            = 'fc';
  block.Dwork(7).Dimensions      = 1;
  block.Dwork(7).DatatypeID      = 0;      % double
  block.Dwork(7).Complexity      = 'Real'; % real
  block.Dwork(7).UsedAsDiscState = true;
  
  block.NumDworks = 8;
  
  block.Dwork(8).Name            = 'fg';
  block.Dwork(8).Dimensions      = 1;
  block.Dwork(8).DatatypeID      = 0;      % double
  block.Dwork(8).Complexity      = 'Real'; % real
  block.Dwork(8).UsedAsDiscState = true;
  
  block.NumDworks = 9;
  
  block.Dwork(9).Name            = 'Sa';
  block.Dwork(9).Dimensions      = 1;
  block.Dwork(9).DatatypeID      = 0;      % double
  block.Dwork(9).Complexity      = 'Real'; % real
  block.Dwork(9).UsedAsDiscState = true;
  
  block.NumDworks = 10;
  
  block.Dwork(10).Name            = 'Sb';
  block.Dwork(10).Dimensions      = 1;
  block.Dwork(10).DatatypeID      = 0;      % double
  block.Dwork(10).Complexity      = 'Real'; % real
  block.Dwork(10).UsedAsDiscState = true;
  
  block.NumDworks = 11;
  
  block.Dwork(11).Name            = 'Sc';
  block.Dwork(11).Dimensions      = 1;
  block.Dwork(11).DatatypeID      = 0;      % double
  block.Dwork(11).Complexity      = 'Real'; % real
  block.Dwork(11).UsedAsDiscState = true;
  
  block.NumDworks = 12;
  
  block.Dwork(12).Name            = 'Sg';
  block.Dwork(12).Dimensions      = 1;
  block.Dwork(12).DatatypeID      = 0;      % double
  block.Dwork(12).Complexity      = 'Real'; % real
  block.Dwork(12).UsedAsDiscState = true;
  
  block.NumDworks = 13;
  
  block.Dwork(13).Name            = 'T0a';
  block.Dwork(13).Dimensions      = 1;
  block.Dwork(13).DatatypeID      = 0;      % double
  block.Dwork(13).Complexity      = 'Real'; % real
  block.Dwork(13).UsedAsDiscState = true;
  
  block.NumDworks = 14;
  
  block.Dwork(14).Name            = 'T0b';
  block.Dwork(14).Dimensions      = 1;
  block.Dwork(14).DatatypeID      = 0;      % double
  block.Dwork(14).Complexity      = 'Real'; % real
  block.Dwork(14).UsedAsDiscState = true;
  
  block.NumDworks = 15;
  
  block.Dwork(15).Name            = 'T0c';
  block.Dwork(15).Dimensions      = 1;
  block.Dwork(15).DatatypeID      = 0;      % double
  block.Dwork(15).Complexity      = 'Real'; % real
  block.Dwork(15).UsedAsDiscState = true;
  
  block.NumDworks = 16;
  
  block.Dwork(16).Name            = 'T0n';
  block.Dwork(16).Dimensions      = 1;
  block.Dwork(16).DatatypeID      = 0;      % double
  block.Dwork(16).Complexity      = 'Real'; % real
  block.Dwork(16).UsedAsDiscState = true;
  
  block.NumDworks = 17;
  
  block.Dwork(17).Name            = 'trav_a';
  block.Dwork(17).Dimensions      = 1;
  block.Dwork(17).DatatypeID      = 0;      % double
  block.Dwork(17).Complexity      = 'Real'; % real
  block.Dwork(17).UsedAsDiscState = true;
  
  block.NumDworks = 18;
  
  block.Dwork(18).Name            = 'trav_b';
  block.Dwork(18).Dimensions      = 1;
  block.Dwork(18).DatatypeID      = 0;      % double
  block.Dwork(18).Complexity      = 'Real'; % real
  block.Dwork(18).UsedAsDiscState = true;
  
  block.NumDworks = 19;
  
  block.Dwork(19).Name            = 'trav_c';
  block.Dwork(19).Dimensions      = 1;
  block.Dwork(19).DatatypeID      = 0;      % double
  block.Dwork(19).Complexity      = 'Real'; % real
  block.Dwork(19).UsedAsDiscState = true;
  
  block.NumDworks = 20;
  
  block.Dwork(20).Name            = 'trav_n';
  block.Dwork(20).Dimensions      = 1;
  block.Dwork(20).DatatypeID      = 0;      % double
  block.Dwork(20).Complexity      = 'Real'; % real
  block.Dwork(20).UsedAsDiscState = true;
  
  block.NumDworks = 21;
  
  block.Dwork(21).Name            = 'VabRe';
  block.Dwork(21).Dimensions      = 1;
  block.Dwork(21).DatatypeID      = 0;      % double
  block.Dwork(21).Complexity      = 'Real'; % real
  block.Dwork(21).UsedAsDiscState = true;
  
  block.NumDworks = 22;
  
  block.Dwork(22).Name            = 'VabIm';
  block.Dwork(22).Dimensions      = 1;
  block.Dwork(22).DatatypeID      = 0;      % double
  block.Dwork(22).Complexity      = 'Real'; % real
  block.Dwork(22).UsedAsDiscState = true;
  
  block.NumDworks = 23;
  
  block.Dwork(23).Name            = 'VbcRe';
  block.Dwork(23).Dimensions      = 1;
  block.Dwork(23).DatatypeID      = 0;      % double
  block.Dwork(23).Complexity      = 'Real'; % real
  block.Dwork(23).UsedAsDiscState = true;
  
  block.NumDworks = 24;
  
  block.Dwork(24).Name            = 'VbcIm';
  block.Dwork(24).Dimensions      = 1;
  block.Dwork(24).DatatypeID      = 0;      % double
  block.Dwork(24).Complexity      = 'Real'; % real
  block.Dwork(24).UsedAsDiscState = true;
  
  block.NumDworks = 25;
  
  block.Dwork(25).Name            = 'VcaRe';
  block.Dwork(25).Dimensions      = 1;
  block.Dwork(25).DatatypeID      = 0;      % double
  block.Dwork(25).Complexity      = 'Real'; % real
  block.Dwork(25).UsedAsDiscState = true;
  
  block.NumDworks = 26;
  
  block.Dwork(26).Name            = 'VcaIm';
  block.Dwork(26).Dimensions      = 1;
  block.Dwork(26).DatatypeID      = 0;      % double
  block.Dwork(26).Complexity      = 'Real'; % real
  block.Dwork(26).UsedAsDiscState = true;
  
  block.NumDworks = 27;
  
  block.Dwork(27).Name            = 'InRe';
  block.Dwork(27).Dimensions      = 1;
  block.Dwork(27).DatatypeID      = 0;      % double
  block.Dwork(27).Complexity      = 'Real'; % real
  block.Dwork(27).UsedAsDiscState = true;
  
  block.NumDworks = 28;
  
  block.Dwork(28).Name            = 'InIm';
  block.Dwork(28).Dimensions      = 1;
  block.Dwork(28).DatatypeID      = 0;      % double
  block.Dwork(28).Complexity      = 'Real'; % real
  block.Dwork(28).UsedAsDiscState = true;
  
  block.NumDworks = 29;
  
  block.Dwork(29).Name            = 'VnRe';
  block.Dwork(29).Dimensions      = 1;
  block.Dwork(29).DatatypeID      = 0;      % double
  block.Dwork(29).Complexity      = 'Real'; % real
  block.Dwork(29).UsedAsDiscState = true;
  
  block.NumDworks = 30;
  
  block.Dwork(30).Name            = 'VnIm';
  block.Dwork(30).Dimensions      = 1;
  block.Dwork(30).DatatypeID      = 0;      % double
  block.Dwork(30).Complexity      = 'Real'; % real
  block.Dwork(30).UsedAsDiscState = true;
  
  block.NumDworks = 31;
  
  block.Dwork(31).Name            = 'Ia';
  block.Dwork(31).Dimensions      = 1;
  block.Dwork(31).DatatypeID      = 0;      % double
  block.Dwork(31).Complexity      = 'Real'; % real
  block.Dwork(31).UsedAsDiscState = true;
  
  block.NumDworks = 32;
  
  block.Dwork(32).Name            = 'Ma';
  block.Dwork(32).Dimensions      = 1;
  block.Dwork(32).DatatypeID      = 0;      % double
  block.Dwork(32).Complexity      = 'Real'; % real
  block.Dwork(32).UsedAsDiscState = true;
  
  block.NumDworks = 33;
  
  block.Dwork(33).Name            = 'Vbc';
  block.Dwork(33).Dimensions      = 1;
  block.Dwork(33).DatatypeID      = 0;      % double
  block.Dwork(33).Complexity      = 'Real'; % real
  block.Dwork(33).UsedAsDiscState = true;
  
  block.NumDworks = 34;
  
  block.Dwork(34).Name            = 'thetaA';
  block.Dwork(34).Dimensions      = 1;
  block.Dwork(34).DatatypeID      = 0;      % double
  block.Dwork(34).Complexity      = 'Real'; % real
  block.Dwork(34).UsedAsDiscState = true;
  
  block.NumDworks = 35;
  
  block.Dwork(35).Name            = 'Ha';
  block.Dwork(35).Dimensions      = 1;
  block.Dwork(35).DatatypeID      = 0;      % double
  block.Dwork(35).Complexity      = 'Real'; % real
  block.Dwork(35).UsedAsDiscState = true;
  
  block.NumDworks = 36;
  
  block.Dwork(36).Name            = 'ya';
  block.Dwork(36).Dimensions      = 1;
  block.Dwork(36).DatatypeID      = 0;      % double
  block.Dwork(36).Complexity      = 'Real'; % real
  block.Dwork(36).UsedAsDiscState = true;
  
  block.NumDworks = 37;
  
  block.Dwork(37).Name            = 'ta';
  block.Dwork(37).Dimensions      = 1;
  block.Dwork(37).DatatypeID      = 0;      % double
  block.Dwork(37).Complexity      = 'Real'; % real
  block.Dwork(37).UsedAsDiscState = true;
  
  block.NumDworks = 38;
  
  block.Dwork(38).Name            = 'M0a';
  block.Dwork(38).Dimensions      = 1;
  block.Dwork(38).DatatypeID      = 0;      % double
  block.Dwork(38).Complexity      = 'Real'; % real
  block.Dwork(38).UsedAsDiscState = true;
  
  block.NumDworks = 39;
  
  block.Dwork(39).Name            = 'Ib';
  block.Dwork(39).Dimensions      = 1;
  block.Dwork(39).DatatypeID      = 0;      % double
  block.Dwork(39).Complexity      = 'Real'; % real
  block.Dwork(39).UsedAsDiscState = true;% falta na fase b
   
  block.NumDworks = 40;
  
  block.Dwork(40).Name            = 'Mb';
  block.Dwork(40).Dimensions      = 1;
  block.Dwork(40).DatatypeID      = 0;      % double
  block.Dwork(40).Complexity      = 'Real'; % real
  block.Dwork(40).UsedAsDiscState = true;% falta na fase b
  
  block.NumDworks = 41;
  
  block.Dwork(41).Name            = 'Vca';
  block.Dwork(41).Dimensions      = 1;
  block.Dwork(41).DatatypeID      = 0;      % double
  block.Dwork(41).Complexity      = 'Real'; % real
  block.Dwork(41).UsedAsDiscState = true;% falta na fase b
    
  block.NumDworks = 42;
  
  block.Dwork(42).Name            = 'thetaB';
  block.Dwork(42).Dimensions      = 1;
  block.Dwork(42).DatatypeID      = 0;      % double
  block.Dwork(42).Complexity      = 'Real'; % real
  block.Dwork(42).UsedAsDiscState = true;% falta na fase 
  
  block.NumDworks = 43;
  
  block.Dwork(43).Name            = 'Hb';
  block.Dwork(43).Dimensions      = 1;
  block.Dwork(43).DatatypeID      = 0;      % double
  block.Dwork(43).Complexity      = 'Real'; % real
  block.Dwork(43).UsedAsDiscState = true;% falta na fase 
  
  block.NumDworks = 44;
  
  block.Dwork(44).Name            = 'yb';
  block.Dwork(44).Dimensions      = 1;
  block.Dwork(44).DatatypeID      = 0;      % double
  block.Dwork(44).Complexity      = 'Real'; % real
  block.Dwork(44).UsedAsDiscState = true;
  
  block.NumDworks = 45;
  
  block.Dwork(45).Name            = 'tb';
  block.Dwork(45).Dimensions      = 1;
  block.Dwork(45).DatatypeID      = 0;      % double
  block.Dwork(45).Complexity      = 'Real'; % real
  block.Dwork(45).UsedAsDiscState = true;
  
  block.NumDworks = 46;
  
  block.Dwork(46).Name            = 'M0b';
  block.Dwork(46).Dimensions      = 1;
  block.Dwork(46).DatatypeID      = 0;      % double
  block.Dwork(46).Complexity      = 'Real'; % real
  block.Dwork(46).UsedAsDiscState = true;
  
  block.NumDworks = 47;
  
  block.Dwork(47).Name            = 'Ic';
  block.Dwork(47).Dimensions      = 1;
  block.Dwork(47).DatatypeID      = 0;      % double
  block.Dwork(47).Complexity      = 'Real'; % real
  block.Dwork(47).UsedAsDiscState = true;


  block.NumDworks = 48;
  
  block.Dwork(48).Name            = 'Mc';
  block.Dwork(48).Dimensions      = 1;
  block.Dwork(48).DatatypeID      = 0;      % double
  block.Dwork(48).Complexity      = 'Real'; % real
  block.Dwork(48).UsedAsDiscState = true;  
  
  block.NumDworks = 49;
  
  block.Dwork(49).Name            = 'Vab';
  block.Dwork(49).Dimensions      = 1;
  block.Dwork(49).DatatypeID      = 0;      % double
  block.Dwork(49).Complexity      = 'Real'; % real
  block.Dwork(49).UsedAsDiscState = true;  

  block.NumDworks = 50;
  
  block.Dwork(50).Name            = 'thetaC';
  block.Dwork(50).Dimensions      = 1;
  block.Dwork(50).DatatypeID      = 0;      % double
  block.Dwork(50).Complexity      = 'Real'; % real
  block.Dwork(50).UsedAsDiscState = true; 

  block.NumDworks = 51;
  
  block.Dwork(51).Name            = 'Hc';
  block.Dwork(51).Dimensions      = 1;
  block.Dwork(51).DatatypeID      = 0;      % double
  block.Dwork(51).Complexity      = 'Real'; % real
  block.Dwork(51).UsedAsDiscState = true; 

  block.NumDworks = 52;
  
  block.Dwork(52).Name            = 'yc';
  block.Dwork(52).Dimensions      = 1;
  block.Dwork(52).DatatypeID      = 0;      % double
  block.Dwork(52).Complexity      = 'Real'; % real
  block.Dwork(52).UsedAsDiscState = true; 
  
  block.NumDworks = 53;
  
  block.Dwork(53).Name            = 'tc';
  block.Dwork(53).Dimensions      = 1;
  block.Dwork(53).DatatypeID      = 0;      % double
  block.Dwork(53).Complexity      = 'Real'; % real
  block.Dwork(53).UsedAsDiscState = true; 
  
  block.NumDworks = 54;
  
  block.Dwork(54).Name            = 'M0c';
  block.Dwork(54).Dimensions      = 1;
  block.Dwork(54).DatatypeID      = 0;      % double
  block.Dwork(54).Complexity      = 'Real'; % real
  block.Dwork(54).UsedAsDiscState = true;
  
  block.NumDworks = 55;
  
  block.Dwork(55).Name            = 'In';
  block.Dwork(55).Dimensions      = 1;
  block.Dwork(55).DatatypeID      = 0;      % double
  block.Dwork(55).Complexity      = 'Real'; % real
  block.Dwork(55).UsedAsDiscState = true;
  
  block.NumDworks = 56;
  
  block.Dwork(56).Name            = 'Vn';
  block.Dwork(56).Dimensions      = 1;
  block.Dwork(56).DatatypeID      = 0;      % double
  block.Dwork(56).Complexity      = 'Real'; % real
  block.Dwork(56).UsedAsDiscState = true;
  
  block.NumDworks = 57;
  
  block.Dwork(57).Name            = 'theta0';
  block.Dwork(57).Dimensions      = 1;
  block.Dwork(57).DatatypeID      = 0;      % double
  block.Dwork(57).Complexity      = 'Real'; % real
  block.Dwork(57).UsedAsDiscState = true;
  
  block.NumDworks = 58;
  
  block.Dwork(58).Name            = 'H0';
  block.Dwork(58).Dimensions      = 1;
  block.Dwork(58).DatatypeID      = 0;      % double
  block.Dwork(58).Complexity      = 'Real'; % real
  block.Dwork(58).UsedAsDiscState = true;
  
  block.NumDworks = 59;
  
  block.Dwork(59).Name            = 'Mn';
  block.Dwork(59).Dimensions      = 1;
  block.Dwork(59).DatatypeID      = 0;      % double
  block.Dwork(59).Complexity      = 'Real'; % real
  block.Dwork(59).UsedAsDiscState = true;
  
  block.NumDworks = 60;
  
  block.Dwork(60).Name            = 'yg';
  block.Dwork(60).Dimensions      = 1;
  block.Dwork(60).DatatypeID      = 0;      % double
  block.Dwork(60).Complexity      = 'Real'; % real
  block.Dwork(60).UsedAsDiscState = true;
  
   block.NumDworks = 61;
  
  block.Dwork(61).Name            = 'tn';
  block.Dwork(61).Dimensions      = 1;
  block.Dwork(61).DatatypeID      = 0;      % double
  block.Dwork(61).Complexity      = 'Real'; % real
  block.Dwork(61).UsedAsDiscState = true;
  
  block.NumDworks = 62;
  
  block.Dwork(62).Name            = 'M0n';
  block.Dwork(62).Dimensions      = 1;
  block.Dwork(62).DatatypeID      = 0;      % double
  block.Dwork(62).Complexity      = 'Real'; % real
  block.Dwork(62).UsedAsDiscState = true;
  
  block.NumDworks = 63;
  
  block.Dwork(63).Name            = 'cont';
  block.Dwork(63).Dimensions      = 1;
  block.Dwork(63).DatatypeID      = 0;      % double
  block.Dwork(63).Complexity      = 'Real'; % real
  block.Dwork(63).UsedAsDiscState = true;
  
  block.NumDworks = 64;
  
  block.Dwork(64).Name            = 'A';
  block.Dwork(64).Dimensions      = 1;
  block.Dwork(64).DatatypeID      = 0;      % double
  block.Dwork(64).Complexity      = 'Real'; % real
  block.Dwork(64).UsedAsDiscState = true;
  
   block.NumDworks = 65;
  
  block.Dwork(65).Name            = 'B';
  block.Dwork(65).Dimensions      = 1;
  block.Dwork(65).DatatypeID      = 0;      % double
  block.Dwork(65).Complexity      = 'Real'; % real
  block.Dwork(65).UsedAsDiscState = true;
  
   block.NumDworks = 66;
  
  block.Dwork(66).Name            = 'p';
  block.Dwork(66).Dimensions      = 1;
  block.Dwork(66).DatatypeID      = 0;      % double
  block.Dwork(66).Complexity      = 'Real'; % real
  block.Dwork(66).UsedAsDiscState = true;
  
   block.NumDworks = 67;
  
  block.Dwork(67).Name            = 'An';
  block.Dwork(67).Dimensions      = 1;
  block.Dwork(67).DatatypeID      = 0;      % double
  block.Dwork(67).Complexity      = 'Real'; % real
  block.Dwork(67).UsedAsDiscState = true;
  
   block.NumDworks = 68;
  
  block.Dwork(68).Name            = 'Bn';
  block.Dwork(68).Dimensions      = 1;
  block.Dwork(68).DatatypeID      = 0;      % double
  block.Dwork(68).Complexity      = 'Real'; % real
  block.Dwork(68).UsedAsDiscState = true;
  
   block.NumDworks = 69;
  
  block.Dwork(69).Name            = 'pn';
  block.Dwork(69).Dimensions      = 1;
  block.Dwork(69).DatatypeID      = 0;      % double
  block.Dwork(69).Complexity      = 'Real'; % real
  block.Dwork(69).UsedAsDiscState = true;

function InitializeConditions(block)

function Start(block)

block.Dwork(1).Data = 0; %cta = 0;
block.Dwork(2).Data = 0;%ctb = 0;
block.Dwork(3).Data = 0; %ctc = 0;
block.Dwork(4).Data = 0; %ctn = 0;
block.Dwork(5).Data = 0;%fa = 0;
block.Dwork(6).Data = 0;%fb = 0;
block.Dwork(7).Data = 0;%fc = 0;
block.Dwork(8).Data = 0;%fg = 0;
block.Dwork(9).Data = 0;%Sa = 0;
block.Dwork(10).Data = 0;%Sb = 0;
block.Dwork(11).Data = 0;%Sc = 0;
block.Dwork(12).Data = 0;%Sg = 0;
block.Dwork(13).Data = 10000;%T0a = 10000;
block.Dwork(14).Data = 10000;%T0b = 10000;
block.Dwork(15).Data = 10000;%T0c = 10000;
block.Dwork(16).Data = 10000;%T0n = 10000;
block.Dwork(17).Data = 9999;%trav_a = 9999;
block.Dwork(18).Data = 9999;%trav_b = 9999;
block.Dwork(19).Data = 9999;%trav_c = 9999;
block.Dwork(63).Data = 0;%cont = 0;

function Outputs(block)


block.OutputPort(1).Data = block.Dwork(5).Data + block.Dwork(6).Data + block.Dwork(7).Data + block.Dwork(8).Data;
function Update(block)

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
	case 1 %IEC Classe A - inversa (C1) 
		A = 0.14;
		p = 0.02;
		B = 0;
		%end;
	case 2%IEC Classe B - muito inversa (C2) = 1
		A = 13.5;
		p = 1;
		B = 0;
		%end;
	case 3%IEC Classe C - extremamente inversa (C3) = 1
		A = 80;
		p = 2;
		B = 0;
		%end;
end

switch (curvan)
	case 1 %IEC Classe A - inversa (C1) 
		An = 0.14;
		pn = 0.02;
		Bn = 0;
		%end;
	case 2%IEC Classe B - muito inversa (C2) = 1
		An = 13.5;
		pn = 1;
		Bn = 0;
		%end;
	case 3%IEC Classe C - extremamente inversa (C3) = 1
		An = 80;
		pn = 2;
		Bn = 0;
		%end;
end
     
% Calculando as tensões de polarização
block.Dwork(21).Data = block.InputPort(1).Data - block.InputPort(3).Data;
block.Dwork(22).Data = block.InputPort(2).Data - block.InputPort(4).Data;
block.Dwork(23).Data = block.InputPort(3).Data - block.InputPort(5).Data;
block.Dwork(24).Data = block.InputPort(4).Data - block.InputPort(6).Data;
block.Dwork(25).Data = block.InputPort(5).Data - block.InputPort(1).Data;
block.Dwork(26).Data = block.InputPort(6).Data - block.InputPort(2).Data;

% Calculando as componentes de sequência zero
block.Dwork(27).Data = block.InputPort(7).Data + block.InputPort(9).Data + block.InputPort(11).Data;
block.Dwork(28).Data = block.InputPort(8).Data + block.InputPort(10).Data + block.InputPort(12).Data;
block.Dwork(29).Data = block.InputPort(1).Data + block.InputPort(3).Data + block.InputPort(5).Data;
block.Dwork(30).Data = block.InputPort(2).Data + block.InputPort(4).Data + block.InputPort(6).Data;

%--------------------------------------------------------------%
%	Calculando as faltas nas fases	   	       %
%--------------------------------------------------------------%

% falta na fase a
block.Dwork(31).Data = sqrt(block.InputPort(7).Data*block.InputPort(7).Data + block.InputPort(8).Data*block.InputPort(8).Data);%Ia = sqrt((IaRe*IaRe)+(IaIm*IaIm));
block.Dwork(32).Data = block.Dwork(31).Data/Ip;%Ma = Ia/Iap;
block.Dwork(33).Data = sqrt(block.Dwork(23).Data*block.Dwork(23).Data + block.Dwork(24).Data*block.Dwork(24).Data);%Vbc = sqrt((VbcRe*VbcRe)+(VbcIm*VbcIm));
block.Dwork(34).Data = atan2(block.InputPort(8).Data, block.InputPort(7).Data)-atan2(block.Dwork(24).Data, block.Dwork(23).Data);%thetaA = atan2(IaIm,IaRe)-atan2(VbcIm,VbcRe);
block.Dwork(35).Data = block.Dwork(31).Data*block.Dwork(33).Data*cos(block.Dwork(34).Data-tau);%Ha = Ia*Vbc*cos(thetaA-tau); %sensibilidade do relé

%falta na fase b     

block.Dwork(39).Data = sqrt(block.InputPort(9).Data*block.InputPort(9).Data + block.InputPort(10).Data*block.InputPort(10).Data);
block.Dwork(40).Data = block.Dwork(39).Data/Ip;% Mb = Ib/Ibp;
block.Dwork(41).Data = sqrt(block.Dwork(25).Data*block.Dwork(25).Data + block.Dwork(26).Data*block.Dwork(26).Data);
block.Dwork(42).Data = atan2(block.InputPort(10).Data, block.InputPort(9).Data)-atan2(block.Dwork(26).Data, block.Dwork(25).Data);
block.Dwork(43).Data = block.Dwork(39).Data*block.Dwork(41).Data*cos(block.Dwork(42).Data-tau);
% falta na fase c
block.Dwork(47).Data = sqrt(block.InputPort(11).Data*block.InputPort(11).Data + block.InputPort(12).Data*block.InputPort(12).Data);
block.Dwork(48).Data = block.Dwork(47).Data/Ip;%Mc = Ic/Icp;
block.Dwork(49).Data = sqrt(block.Dwork(21).Data*block.Dwork(21).Data + block.Dwork(22).Data*block.Dwork(22).Data);
block.Dwork(50).Data = atan2(block.InputPort(12).Data, block.InputPort(11).Data)-atan2(block.Dwork(22).Data, block.Dwork(21).Data);
block.Dwork(51).Data = block.Dwork(47).Data*block.Dwork(49).Data*cos(block.Dwork(50).Data-tau);

% falta na terra
block.Dwork(55).Data = sqrt(block.Dwork(27).Data*block.Dwork(27).Data + block.Dwork(28).Data*block.Dwork(28).Data);
block.Dwork(59).Data = block.Dwork(55).Data/Ipn;%Mn
block.Dwork(56).Data = sqrt(block.Dwork(29).Data*block.Dwork(29).Data + block.Dwork(30).Data*block.Dwork(30).Data);
block.Dwork(57).Data = atan2(block.Dwork(28).Data, block.Dwork(27).Data)-atan2(block.Dwork(30).Data, block.Dwork(29).Data);
block.Dwork(58).Data = block.Dwork(55).Data*block.Dwork(56).Data*cos(block.Dwork(57).Data-taun);
%----------------------------------------------------------------%
%	Calculando Condição temporizado fase a            %
%----------------------------------------------------------------%

if block.Dwork(1).Data == 0 % if (cta == 0)
    if block.Dwork(31).Data > Ip %if (Ia  > Iap)
        block.Dwork(36).Data = 0;%ya  = 0;
        if block.Dwork(35).Data > 0 %if (Ha  > 0)  
            block.Dwork(37).Data = TMS*((A/((block.Dwork(32).Data ^p)-1))+B);
            block.Dwork(36).Data = 1/block.Dwork(37).Data;
            block.Dwork(13).Data =  block.Dwork(37).Data; 
            block.Dwork(1).Data = 1;%cta = 1;
            block.Dwork(38).Data = block.Dwork(32).Data;
        end
    else
        block.Dwork(36).Data = 0;%ya  = 0;        
    end
end

%----------------------------------------------------------------%
%	Calculando Condição temporizado fase b            %
%----------------------------------------------------------------%
if block.Dwork(2).Data == 0
    if block.Dwork(39).Data > Ip
        block.Dwork(44).Data = 0;
        if block.Dwork(43).Data > 0
            block.Dwork(45).Data = TMS*((A/((block.Dwork(40).Data ^p)-1))+B);
            block.Dwork(44).Data = 1/block.Dwork(45).Data;%yb  = (1/tb );
            block.Dwork(14).Data = block.Dwork(45).Data;%T0b = tb ;
            block.Dwork(2).Data = 1;%ctb = 1;
            block.Dwork(46).Data = block.Dwork(40).Data;%M0b = Mb ;
        end
    else
        block.Dwork(44).Data = 0;%yb  = 0;
    end
end

%----------------------------------------------------------------%
%	Calculando Condição temporizado fase c            %
%----------------------------------------------------------------%

if block.Dwork(3).Data == 0% 
        block.Dwork(52).Data = 0;%yc  = 0;
        if block.Dwork(51).Data > 0%if (Hc  > 0
            block.Dwork(53).Data = (A*TMS)/((block.Dwork(48).Data ^p)-1);
            block.Dwork(52).Data = 1/block.Dwork(53).Data;
            block.Dwork(15).Data = block.Dwork(53).Data;;
            block.Dwork(3).Data = 1;%ctc = 1;
            block.Dwork(54).Data = block.Dwork(48).Data;
        end
    else
        block.Dwork(52).Data = 0;
    end   
end

%-----------------------------------------%
%	Condição para falta na terra  --------%
%-----------------------------------------%
if block.Dwork(4).Data == 0
    if block.Dwork(55).Data > Ipn
        block.Dwork(60).Data = 0;
        if block.Dwork(58).Data < 0
            block.Dwork(61).Data = (An*TMSn)/((block.Dwork(59).Data ^pn)-1);
            block.Dwork(60).Data = 1/block.Dwork(61).Data; 
            block.Dwork(16).Data = block.Dwork(61).Data;
            block.Dwork(4).Data = 1;%ctn = 1;
            block.Dwork(62).Data = block.Dwork(59).Data;
        end
    else
        block.Dwork(60).Data = 0;%yg  = 0;
    end
end

        %-------------------------------------------%
     	%	Decisão para trip Fase A        %
		%-------------------------------------------%
if block.Dwork(1).Data == 1%if (cta == 1)     
     if (block.Dwork(32).Data > 1 && block.Dwork(35).Data > 0)
         if block.Dwork(9).Data >= block.Dwork(37).Data %1
             block.Dwork(5).Data = 1;
              block.Dwork(37).Data = (0.14*TMS)/((block.Dwork(32).Data ^0.02)-1);
             block.Dwork(9).Data = 0;%Sa = 0;
             block.Dwork(1).Data = 0;%cta = 0;
             block.Dwork(36).Data = 0; %ya = 0;
             a=toc;
         else
             block.Dwork(9).Data = block.Dwork(9).Data + 1/960;
         end
     else
         block.Dwork(1).Data = 0;%cta = 0;
         block.Dwork(9).Data = 0;%Sa = 0;
     end
end
        %-------------------------------------------%
     	%	Decisão para trip Fase B        %
		%-------------------------------------------%

if block.Dwork(2).Data == 1
    if (block.Dwork(40).Data > 1 && block.Dwork(43).Data > 0)
        if block.Dwork(10).Data >= block.Dwork(45).Data     
            block.Dwork(6).Data = 1; 
             block.Dwork(45).Data = (0.14*TMS)/((block.Dwork(40).Data ^0.02)-1);
            block.Dwork(10).Data = 0;%Sb = 0;
            block.Dwork(2).Data = 0;%ctb = 0;
            block.Dwork(44).Data = 0;%yb = 0;
        else
            block.Dwork(10).Data = block.Dwork(10).Data + 1/960;
        end
    else
        block.Dwork(10).Data = 0;
        block.Dwork(2).Data = 0;
    end
end

        %-------------------------------------------%
     	%	Decisão para trip Fase C        %
		%-------------------------------------------%

if block.Dwork(3).Data == 1%if(ctc == 1)
    if (block.Dwork(48).Data > 1 && block.Dwork(51).Data > 0)
        if block.Dwork(11).Data >= block.Dwork(53).Data                                         
            block.Dwork(7).Data = 1;
            block.Dwork(53).Data = (0.14*TMS)/((block.Dwork(48).Data ^0.02)-1);
            block.Dwork(11).Data = 0;
            block.Dwork(3).Data = 0;
            block.Dwork(52).Data = 0;
        else
            block.Dwork(11).Data = block.Dwork(11).Data + 1/960;
        end
    else
        block.Dwork(11).Data = 0;
        block.Dwork(3).Data = 0;              
    end
end

        %-------------------------------------------%
     	%	Decisão para trip terra         %
		%-------------------------------------------%
if block.Dwork(4).Data == 1
    if (block.Dwork(59).Data > 1 && block.Dwork(58).Data < 0)
     block.Dwork(61).Data = (0.14*TMSn)/((block.Dwork(59).Data ^0.02)-1);
        if block.Dwork(12).Data >= block.Dwork(61).Data% 1%if (Sg > 1)
            block.Dwork(8).Data = 1;%fg = 1;
            block.Dwork(12).Data = 0;%Sg = 0;
            block.Dwork(4).Data = 0;%ctn = 0;
            block.Dwork(60).Data = 0;%yg = 0;
        else
            block.Dwork(12).Data = block.Dwork(12).Data + 1/960;
        end
    else
        block.Dwork(12).Data = 0;%Sg = 0;
        block.Dwork(4).Data = 0;%ctn = 0;
    end
end

if block.Dwork(70).Data >0.2680 && block.Dwork(5).Data==1 % 0.134 % 0.12 = 0.1 (distância)+0.02 (20*1/960)passo
    block.Dwork(5).Data = 1;
else
    block.Dwork(5).Data = 0;    
end
if block.Dwork(70).Data > 0.2680 && block.Dwork(6).Data==1
    block.Dwork(6).Data = 1;
else
    block.Dwork(6).Data = 0;    
end
if block.Dwork(70).Data > 0.2680 && block.Dwork(7).Data==1
    block.Dwork(7).Data = 1;
else
    block.Dwork(7).Data = 0;    
end
if block.Dwork(70).Data >0.2680 && block.Dwork(8).Data==1
    block.Dwork(8).Data = 1;
else
    block.Dwork(8).Data = 0;    
end

function Derivatives(block)

function Terminate(block)

%end Terminate




