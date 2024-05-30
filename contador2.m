function contador2(block)


setup(block);


function setup(block)

block.NumInputPorts  = 2;
block.NumOutputPorts = 2;

block.InputPort(1).SamplingMode = 'Sample';
block.InputPort(2).SamplingMode = 'Sample';
block.OutputPort(1).SamplingMode = 'Sample';
block.OutputPort(2).SamplingMode = 'Sample';



block.SampleTimes = [1/960 0];
block.SimStateCompliance = 'DefaultSimState';



block.RegBlockMethod('PostPropagationSetup',    @DoPostPropSetup);
block.RegBlockMethod('InitializeConditions', @InitializeConditions);
block.RegBlockMethod('Start', @Start);
block.RegBlockMethod('Outputs', @Outputs);     % Required
block.RegBlockMethod('Update', @Update);
block.RegBlockMethod('Derivatives', @Derivatives);
block.RegBlockMethod('Terminate', @Terminate); % Required

%end setup


function DoPostPropSetup(block)
block.NumDworks = 1;

block.Dwork(1).Name            = 'trip_rele';
block.Dwork(1).Dimensions      = 1;
block.Dwork(1).DatatypeID      = 0;      % double
block.Dwork(1).Complexity      = 'Real'; % real
block.Dwork(1).UsedAsDiscState = true;

block.NumDworks = 2;

block.Dwork(2).Name            = 'tempo';
block.Dwork(2).Dimensions      = 1;
block.Dwork(2).DatatypeID      = 0;      % double
block.Dwork(2).Complexity      = 'Real'; % real
block.Dwork(2).UsedAsDiscState = true;

block.NumDworks = 3;

block.Dwork(3).Name            = 'trip_relig';
block.Dwork(3).Dimensions      = 1;
block.Dwork(3).DatatypeID      = 0;      % double
block.Dwork(3).Complexity      = 'Real'; % real
block.Dwork(3).UsedAsDiscState = true;

block.NumDworks = 4;

block.Dwork(4).Name            = 'tempo_out';
block.Dwork(4).Dimensions      = 1;
block.Dwork(4).DatatypeID      = 0;      % double
block.Dwork(4).Complexity      = 'Real'; % real
block.Dwork(4).UsedAsDiscState = true;


function InitializeConditions(block)


function Start(block)


function Outputs(block)

block.OutputPort(1).Data =block.Dwork(3).Data ;
block.OutputPort(2).Data = block.Dwork(4).Data ;

 function Update(block)

 block.Dwork(1).Data=block.InputPort(1).Data;

 if  block.Dwork(1).Data >0 %== 1
      block.Dwork(3).Data = 1;
     block.Dwork(4).Data = block.Dwork(4).Data+1/960;
 else
     block.Dwork(3).Data = 0;
     block.Dwork(4).Data = 0;     
 end
    if block.Dwork(4).Data > 0.8%0.1%valor dos ciclos
     block.Dwork(3).Data = 0;
    end

function Derivatives(block)

function Terminate(block)





