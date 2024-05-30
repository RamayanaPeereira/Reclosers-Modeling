function CossenoABB(block)

setup(block);


function setup(block)


block.NumInputPorts  = 6;
block.NumOutputPorts = 12;

%% Setup functional port properties to dynamically
%% inherited.
  block.SetPreCompInpPortInfoToDynamic;
  block.SetPreCompOutPortInfoToDynamic;

  block.InputPort(1).Complexity   = 'Real'; 
  block.InputPort(1).DataTypeId   = 0;
  block.InputPort(1).SamplingMode = 'Sample';
  block.InputPort(1).Dimensions   = 1;
  
  block.InputPort(2).Complexity   = 'Real';
  block.InputPort(2).DataTypeId   = 0;
  block.InputPort(2).SamplingMode = 'Sample';
  block.InputPort(2).Dimensions   = 1;
  
  block.InputPort(3).Complexity   = 'Real';
  block.InputPort(3).DataTypeId   = 0;
  block.InputPort(3).SamplingMode = 'Sample';
  block.InputPort(3).Dimensions   = 1;
  
  block.InputPort(4).Complexity   = 'Real';
  block.InputPort(4).DataTypeId   = 0;
  block.InputPort(4).SamplingMode = 'Sample';
  block.InputPort(4).Dimensions   = 1;
  
  block.InputPort(5).Complexity   = 'Real';
  block.InputPort(5).DataTypeId   = 0;
  block.InputPort(5).SamplingMode = 'Sample';
  block.InputPort(5).Dimensions   = 1;
  
  block.InputPort(6).Complexity   = 'Real';
  block.InputPort(6).DataTypeId   = 0;
  block.InputPort(6).SamplingMode = 'Sample';
  block.InputPort(6).Dimensions   = 1;
  
  block.OutputPort(1).Complexity   = 'Real';
  block.OutputPort(1).DataTypeId   = 0;
  block.OutputPort(1).SamplingMode = 'Sample';
  block.OutputPort(1).Dimensions   = 1;

  block.OutputPort(2).Complexity   = 'Real';
  block.OutputPort(2).DataTypeId   = 0;
  block.OutputPort(2).SamplingMode = 'Sample';
  block.OutputPort(2).Dimensions   = 1;
  
  block.OutputPort(3).Complexity   = 'Real';
  block.OutputPort(3).DataTypeId   = 0;
  block.OutputPort(3).SamplingMode = 'Sample';
  block.OutputPort(3).Dimensions   = 1;

  block.OutputPort(4).Complexity   = 'Real';
  block.OutputPort(4).DataTypeId   = 0;
  block.OutputPort(4).SamplingMode = 'Sample';
  block.OutputPort(4).Dimensions   = 1;
  
  block.OutputPort(5).Complexity   = 'Real';
  block.OutputPort(5).DataTypeId   = 0;
  block.OutputPort(5).SamplingMode = 'Sample';
  block.OutputPort(5).Dimensions   = 1;
  
  block.OutputPort(6).Complexity   = 'Real';
  block.OutputPort(6).DataTypeId   = 0;
  block.OutputPort(6).SamplingMode = 'Sample';
  block.OutputPort(6).Dimensions   = 1;
  
  block.OutputPort(7).Complexity   = 'Real';
  block.OutputPort(7).DataTypeId   = 0;
  block.OutputPort(7).SamplingMode = 'Sample';
  block.OutputPort(7).Dimensions   = 1;
  
  block.OutputPort(8).Complexity   = 'Real';
  block.OutputPort(8).DataTypeId   = 0;
  block.OutputPort(8).SamplingMode = 'Sample';
  block.OutputPort(8).Dimensions   = 1;
  
  block.OutputPort(9).Complexity   = 'Real';
  block.OutputPort(9).DataTypeId   = 0;
  block.OutputPort(9).SamplingMode = 'Sample';
  block.OutputPort(9).Dimensions   = 1;
  
  block.OutputPort(10).Complexity   = 'Real';
  block.OutputPort(10).DataTypeId   = 0;
  block.OutputPort(10).SamplingMode = 'Sample';
  block.OutputPort(10).Dimensions   = 1;
  
  block.OutputPort(11).Complexity   = 'Real';
  block.OutputPort(11).DataTypeId   = 0;
  block.OutputPort(11).SamplingMode = 'Sample';
  block.OutputPort(11).Dimensions   = 1;
  
  block.OutputPort(12).Complexity   = 'Real';
  block.OutputPort(12).DataTypeId   = 0;
  block.OutputPort(12).SamplingMode = 'Sample';
  block.OutputPort(12).Dimensions   = 1;
  
% % Override input port properties
% block.InputPort(1).Dimensions        = 1;
% block.InputPort(1).DatatypeID  = 0;  % double
% block.InputPort(1).Complexity  = 'Real';
% block.InputPort(1).DirectFeedthrough = true;
% 
% % Override output port properties
% block.OutputPort(1).Dimensions       = 1;
% block.OutputPort(1).DatatypeID  = 0; % double
% block.OutputPort(1).Complexity  = 'Real';

% Register parameters
block.NumDialogPrms     = 0;

% Register sample times
%  [0 offset]            : Continuous sample time
%  [positive_num offset] : Discrete sample time
%
%  [-1, 0]               : Inherited sample time
%  [-2, 0]               : Variable sample time
block.SampleTimes = [1/960, 0];

% Specify the block simStateCompliance. The allowed values are:
%    'UnknownSimState', < The default setting; warn and assume DefaultSimState
%    'DefaultSimState', < Same sim state as a built-in block
%    'HasNoSimState',   < No sim state
%    'CustomSimState',  < Has GetSimState and SetSimState methods
%    'DisallowSimState' < Error out when saving or restoring the model sim state
block.SimStateCompliance = 'DefaultSimState';

%% -----------------------------------------------------------------
%% The MATLAB S-function uses an internal registry for all
%% block methods. You should register all relevant methods
%% (optional and required) as illustrated below. You may choose
%% any suitable name for the methods and implement these methods
%% as local functions within the same file. See comments
%% provided for each function for more information.
%% -----------------------------------------------------------------

block.RegBlockMethod('PostPropagationSetup',    @DoPostPropSetup);
block.RegBlockMethod('InitializeConditions', @InitializeConditions);
block.RegBlockMethod('Start', @Start);
block.RegBlockMethod('Outputs', @Outputs);     % Required
block.RegBlockMethod('Update', @Update);
block.RegBlockMethod('Derivatives', @Derivatives);
block.RegBlockMethod('Terminate', @Terminate); % Required

%end setup

%%
%% PostPropagationSetup:
%%   Functionality    : Setup work areas and state variables. Can
%%                      also register run-time methods here
%%   Required         : No
%%   C-Mex counterpart: mdlSetWorkWidths
%%
function DoPostPropSetup(block)
  %% Setup Dwork 
   
  N = 16;
  
  block.NumDworks = 1;
  
  block.Dwork(1).Name            = 'cos_d';
  block.Dwork(1).Dimensions      = 1;
  block.Dwork(1).DatatypeID      = 0;      % double
  block.Dwork(1).Complexity      = 'Real'; % real
  block.Dwork(1).UsedAsDiscState = true;
  
  block.NumDworks = 2;
  
  block.Dwork(2).Name            = 'sin_d';
  block.Dwork(2).Dimensions      = 1;
  block.Dwork(2).DatatypeID      = 0;      % double
  block.Dwork(2).Complexity      = 'Real'; % real
  block.Dwork(2).UsedAsDiscState = true;
  
  block.NumDworks = 3;
  block.Dwork(3).Name = 'bufferVaOrig'; %% u[n],...,u[n-31]
  block.Dwork(3).Dimensions      = N;
  block.Dwork(3).DatatypeID      = 0;
  block.Dwork(3).Complexity      = 'Real';
  block.Dwork(3).UsedAsDiscState = true;
  
  block.NumDworks = 4;
  block.Dwork(4).Name = 'bufferVbOrig'; %% Filter coefficients
  block.Dwork(4).Dimensions      = N;
  block.Dwork(4).DatatypeID      = 0;
  block.Dwork(4).Complexity      = 'Real';
  block.Dwork(4).UsedAsDiscState = true;

  block.NumDworks = 5;
  block.Dwork(5).Name = 'bufferVcOrig'; 
  block.Dwork(5).Dimensions      = N;
  block.Dwork(5).DatatypeID      = 0;
  block.Dwork(5).Complexity      = 'Real';
  block.Dwork(5).UsedAsDiscState = true;

  block.NumDworks = 6;
  block.Dwork(6).Name = 'bufferIaOrig'; 
  block.Dwork(6).Dimensions      = N;
  block.Dwork(6).DatatypeID      = 0;
  block.Dwork(6).Complexity      = 'Real';
  block.Dwork(6).UsedAsDiscState = true;

  block.NumDworks = 7;
  block.Dwork(7).Name = 'bufferIbOrig'; %% Filter coefficients
  block.Dwork(7).Dimensions      = N;
  block.Dwork(7).DatatypeID      = 0;
  block.Dwork(7).Complexity      = 'Real';
  block.Dwork(7).UsedAsDiscState = true;

  block.NumDworks = 8;
  block.Dwork(8).Name = 'bufferIcOrig'; %% Filter coefficients
  block.Dwork(8).Dimensions      = N;
  block.Dwork(8).DatatypeID      = 0;
  block.Dwork(8).Complexity      = 'Real';
  block.Dwork(8).UsedAsDiscState = true;
  
  block.NumDworks = 9;
  block.Dwork(9).Name = 'Va_Re'; %% Filter coefficients
  block.Dwork(9).Dimensions      = 1;
  block.Dwork(9).DatatypeID      = 0;
  block.Dwork(9).Complexity      = 'Real';
  block.Dwork(9).UsedAsDiscState = true;
  
  block.NumDworks = 10;
  block.Dwork(10).Name = 'Vb_Re'; %% Filter coefficients
  block.Dwork(10).Dimensions      = 1;
  block.Dwork(10).DatatypeID      = 0;
  block.Dwork(10).Complexity      = 'Real';
  block.Dwork(10).UsedAsDiscState = true;
  
  block.NumDworks = 11;
  block.Dwork(11).Name = 'Vc_Re'; %% Filter coefficients
  block.Dwork(11).Dimensions      = 1;
  block.Dwork(11).DatatypeID      = 0;
  block.Dwork(11).Complexity      = 'Real';
  block.Dwork(11).UsedAsDiscState = true;
  
  block.NumDworks = 12;
  block.Dwork(12).Name = 'Ia_Re'; %% Filter coefficients
  block.Dwork(12).Dimensions      = 1;
  block.Dwork(12).DatatypeID      = 0;
  block.Dwork(12).Complexity      = 'Real';
  block.Dwork(12).UsedAsDiscState = true;
  
  block.NumDworks = 13;
  block.Dwork(13).Name = 'Ib_Re'; %% Filter coefficients
  block.Dwork(13).Dimensions      = 1;
  block.Dwork(13).DatatypeID      = 0;
  block.Dwork(13).Complexity      = 'Real';
  block.Dwork(13).UsedAsDiscState = true;
  
  block.NumDworks = 14;
  block.Dwork(14).Name = 'Ic_Re'; %% Filter coefficients
  block.Dwork(14).Dimensions      = 1;
  block.Dwork(14).DatatypeID      = 0;
  block.Dwork(14).Complexity      = 'Real';
  block.Dwork(14).UsedAsDiscState = true;
  
  block.NumDworks = 15;
  block.Dwork(15).Name = 'VaReal'; %% Filter coefficients
  block.Dwork(15).Dimensions      = 1;
  block.Dwork(15).DatatypeID      = 0;
  block.Dwork(15).Complexity      = 'Real';
  block.Dwork(15).UsedAsDiscState = true;
  
  block.NumDworks = 16;
  block.Dwork(16).Name = 'VbReal'; %% Filter coefficients
  block.Dwork(16).Dimensions      = 1;
  block.Dwork(16).DatatypeID      = 0;
  block.Dwork(16).Complexity      = 'Real';
  block.Dwork(16).UsedAsDiscState = true;
  
  block.NumDworks = 17;
  block.Dwork(17).Name = 'VcReal'; %% Filter coefficients
  block.Dwork(17).Dimensions      = 1;
  block.Dwork(17).DatatypeID      = 0;
  block.Dwork(17).Complexity      = 'Real';
  block.Dwork(17).UsedAsDiscState = true;
  
  block.NumDworks = 18;
  block.Dwork(18).Name = 'IaReal'; %% Filter coefficients
  block.Dwork(18).Dimensions      = 1;
  block.Dwork(18).DatatypeID      = 0;
  block.Dwork(18).Complexity      = 'Real';
  block.Dwork(18).UsedAsDiscState = true;
  
  block.NumDworks = 19;
  block.Dwork(19).Name = 'IbReal'; %% Filter coefficients
  block.Dwork(19).Dimensions      = 1;
  block.Dwork(19).DatatypeID      = 0;
  block.Dwork(19).Complexity      = 'Real';
  block.Dwork(19).UsedAsDiscState = true;
  
  block.NumDworks = 20;
  block.Dwork(20).Name = 'IcReal'; %% Filter coefficients
  block.Dwork(20).Dimensions      = 1;
  block.Dwork(20).DatatypeID      = 0;
  block.Dwork(20).Complexity      = 'Real';
  block.Dwork(20).UsedAsDiscState = true;
  
  block.NumDworks = 21;
  block.Dwork(21).Name = 'VaRe'; %% Filter coefficients
  block.Dwork(21).Dimensions      = 1;
  block.Dwork(21).DatatypeID      = 0;
  block.Dwork(21).Complexity      = 'Real';
  block.Dwork(21).UsedAsDiscState = true;
  
  block.NumDworks = 22;
  block.Dwork(22).Name = 'VbRe'; %% Filter coefficients
  block.Dwork(22).Dimensions      = 1;
  block.Dwork(22).DatatypeID      = 0;
  block.Dwork(22).Complexity      = 'Real';
  block.Dwork(22).UsedAsDiscState = true;
  
  block.NumDworks = 23;
  block.Dwork(23).Name = 'VcRe'; %% Filter coefficients
  block.Dwork(23).Dimensions      = 1;
  block.Dwork(23).DatatypeID      = 0;
  block.Dwork(23).Complexity      = 'Real';
  block.Dwork(23).UsedAsDiscState = true;

  block.NumDworks = 24;
  block.Dwork(24).Name = 'IaRe'; %% Filter coefficients
  block.Dwork(24).Dimensions      = 1;
  block.Dwork(24).DatatypeID      = 0;
  block.Dwork(24).Complexity      = 'Real';
  block.Dwork(24).UsedAsDiscState = true;
  
  block.NumDworks = 25;
  block.Dwork(25).Name = 'IbRe'; %% Filter coefficients
  block.Dwork(25).Dimensions      = 1;
  block.Dwork(25).DatatypeID      = 0;
  block.Dwork(25).Complexity      = 'Real';
  block.Dwork(25).UsedAsDiscState = true;
  
  block.NumDworks = 26;
  block.Dwork(26).Name = 'IcRe'; %% Filter coefficients
  block.Dwork(26).Dimensions      = 1;
  block.Dwork(26).DatatypeID      = 0;
  block.Dwork(26).Complexity      = 'Real';
  block.Dwork(26).UsedAsDiscState = true;
  
  block.NumDworks = 27;
  block.Dwork(27).Name = 'VaIm'; %% Filter coefficients
  block.Dwork(27).Dimensions      = 1;
  block.Dwork(27).DatatypeID      = 0;
  block.Dwork(27).Complexity      = 'Real';
  block.Dwork(27).UsedAsDiscState = true;
  
  block.NumDworks = 28;
  block.Dwork(28).Name = 'VbIm'; %% Filter coefficients
  block.Dwork(28).Dimensions      = 1;
  block.Dwork(28).DatatypeID      = 0;
  block.Dwork(28).Complexity      = 'Real';
  block.Dwork(28).UsedAsDiscState = true;

  block.NumDworks = 29;
  block.Dwork(29).Name = 'VcIm'; %% Filter coefficients
  block.Dwork(29).Dimensions      = 1;
  block.Dwork(29).DatatypeID      = 0;
  block.Dwork(29).Complexity      = 'Real';
  block.Dwork(29).UsedAsDiscState = true;
  
  block.NumDworks = 30;
  block.Dwork(30).Name = 'IaIm'; %% Filter coefficients
  block.Dwork(30).Dimensions      = 1;
  block.Dwork(30).DatatypeID      = 0;
  block.Dwork(30).Complexity      = 'Real';
  block.Dwork(30).UsedAsDiscState = true;
  
  block.NumDworks = 31;
  block.Dwork(31).Name = 'IbIm'; %% Filter coefficients
  block.Dwork(31).Dimensions      = 1;
  block.Dwork(31).DatatypeID      = 0;
  block.Dwork(31).Complexity      = 'Real';
  block.Dwork(31).UsedAsDiscState = true;
  
  block.NumDworks = 32;
  block.Dwork(32).Name = 'IcIm'; %% Filter coefficients
  block.Dwork(32).Dimensions      = 1;
  block.Dwork(32).DatatypeID      = 0;
  block.Dwork(32).Complexity      = 'Real';
  block.Dwork(32).UsedAsDiscState = true;
  
  block.NumDworks = 33;
  block.Dwork(33).Name = 'hc'; %% Filter coefficients
  block.Dwork(33).Dimensions      = N;
  block.Dwork(33).DatatypeID      = 0;
  block.Dwork(33).Complexity      = 'Real';
  block.Dwork(33).UsedAsDiscState = true;
  
  block.NumDworks = 34;
  block.Dwork(34).Name = 'theta'; %% Filter coefficients
  block.Dwork(34).Dimensions      = 1;
  block.Dwork(34).DatatypeID      = 0;
  block.Dwork(34).Complexity      = 'Real';
  block.Dwork(34).UsedAsDiscState = true;
  
  
function InitializeConditions(block)


function Start(block)

block.Dwork(1).Data = 0.9239;%cos(d);
block.Dwork(2).Data = 0.3827;%sin(d);
block.Dwork(3).Data = ones(1,16)*0.01;%bufferVaOrig
block.Dwork(4).Data = ones(1,16)*0.01;%bufferVbOrig
block.Dwork(5).Data = ones(1,16)*0.01;%bufferVcOrig
block.Dwork(6).Data = ones(1,16)*0.01;%bufferIaOrig
block.Dwork(7).Data = ones(1,16)*0.01;%bufferIbOrig
block.Dwork(8).Data = ones(1,16)*0.01;%bufferIcOrig
block.Dwork(9).Data = 0.0;% Va_Re=0.0;
block.Dwork(10).Data = 0.0;% Vb_Re=0.0;
block.Dwork(11).Data = 0.0;% Vc_Re=0.0;
block.Dwork(12).Data = 0.0;% Ia_Re=0.0;
block.Dwork(13).Data = 0.0;% Ib_Re=0.0;
block.Dwork(14).Data = 0.0;% Ic_Re=0.0;
block.Dwork(15).Data = 0.0;% VaReal=0.0;
block.Dwork(16).Data = 0.0;% Vb_Im=0.0;
block.Dwork(17).Data = 0.0;% Vc_Im=0.0;
block.Dwork(18).Data = 0.0;% Ia_Im=0.0;
block.Dwork(19).Data = 0.0;% Ib_Im=0.0;
block.Dwork(20).Data = 0.0;% Ic_Im=0.0;
block.Dwork(21).Data = 0.0;% VaRe=0.0;
block.Dwork(22).Data = 0.0;% VbRe=0.0;
block.Dwork(23).Data = 0.0;% VcRe=0.0;
block.Dwork(24).Data = 0.0;% IaRe=0.0;
block.Dwork(25).Data = 0.0;% IbRe=0.0;
block.Dwork(26).Data = 0.0;% IcRe=0.0;
block.Dwork(27).Data = 0.0;% VaIm=0.0;
block.Dwork(28).Data = 0.0;% VbIm=0.0;
block.Dwork(29).Data = 0.0;% VcIm=0.0;
block.Dwork(30).Data = 0.0;% IaIm=0.0;
block.Dwork(31).Data = 0.0;% IbIm=0.0;
block.Dwork(32).Data = 0.0;% IcIm=0.0;
block.Dwork(33).Data = zeros(1,16);%hc = zeros(1,16);
block.Dwork(34).Data = 2*pi/16;%theta


function Outputs(block)
N = 16;
theta = block.Dwork(34).Data;
bufferVaOrig = block.Dwork(3).Data;
bufferVbOrig = block.Dwork(4).Data;
bufferVcOrig = block.Dwork(5).Data;
bufferIaOrig = block.Dwork(6).Data;
bufferIbOrig = block.Dwork(7).Data;
bufferIcOrig = block.Dwork(8).Data;

hc = block.Dwork(33).Data;

hc(1) =  0.12500;
hc(2)=   0.11548;
hc(3)=   0.08839;
hc(4)=   0.04784;
hc(5)=   0.00000;
hc(6)=  -0.04784;
hc(7)=  -0.08839;
hc(8)=  -0.11548;
hc(9)=  -0.12500;
hc(10)=  -0.11548; 
hc(11)=  -0.08839;
hc(12)=  -0.04784;
hc(13)=  -0.00000;
hc(14)=   0.04784;
hc(15)=   0.08839;
hc(16)=   0.11548;
        %-------------------------------------------------------------%
        %	Atualizando o Buffer com as Amostras Originais das Tensões  %
        %-------------------------------------------------------------%

            for n=1:N-1 
                bufferVaOrig(n) = bufferVaOrig(n+1);
                bufferVbOrig(n) = bufferVbOrig(n+1);
                bufferVcOrig(n) = bufferVcOrig(n+1);
            end%end
            bufferVaOrig(N) = block.InputPort(1).Data;
            bufferVbOrig(N) = block.InputPort(2).Data;
            bufferVcOrig(N) = block.InputPort(3).Data;
        
            %----------------------------------------------------------------%
            %	Atualizando o Buffer com as Amostras Originais das Correntes  %
            %----------------------------------------------------------------%

           for n=1:N-1 
                bufferIaOrig(n) = bufferIaOrig(n+1);
                bufferIbOrig(n) = bufferIbOrig(n+1);
                bufferIcOrig(n) = bufferIcOrig(n+1);
            end
            bufferIaOrig(N) = block.InputPort(4).Data;
            bufferIbOrig(N) = block.InputPort(5).Data;
            bufferIcOrig(N) = block.InputPort(6).Data;


            %-----------------------------------------%
            %	Estimando o Fasor da Tensão na Fase A %
            %-----------------------------------------%
                      
            block.Dwork(9).Data = block.Dwork(21).Data;
            block.Dwork(21).Data = 0;
            for n = 1:N          
                block.Dwork(21).Data = block.Dwork(21).Data + bufferVaOrig(n)*cos((n-1)*pi);
            end
            block.Dwork(27).Data = (block.Dwork(9).Data - (block.Dwork(21).Data*block.Dwork(1).Data))/block.Dwork(2).Data;
            
            %-----------------------------------------%
            %	Estimando o Fasor da Tensão na Fase B %
            %-----------------------------------------%
            
            block.Dwork(10).Data = block.Dwork(22).Data;
            block.Dwork(22).Data = 0.0;
            for n=1:N %
                block.Dwork(22).Data = block.Dwork(22).Data + bufferVbOrig(n)*cos((n-1)*pi);
            end
            block.Dwork(28).Data = (block.Dwork(10).Data - (block.Dwork(22).Data*block.Dwork(1).Data))/block.Dwork(2).Data;

            %-----------------------------------------%
            %  Estimando o Fasor da Tensão na Fase C  %
            %-----------------------------------------%
            
            block.Dwork(11).Data = block.Dwork(23).Data;
            block.Dwork(23).Data = 0.0;
            for n=1:N %
                block.Dwork(23).Data = block.Dwork(23).Data + bufferVcOrig(n)*cos((n-1)*pi);
            end
            block.Dwork(29).Data = (block.Dwork(11).Data-(block.Dwork(23).Data*block.Dwork(1).Data))/block.Dwork(2).Data;

            %-------------------------------------------%
            %	Estimando o Fasor da Corrente na Fase A %
            %-------------------------------------------%
            
            block.Dwork(12).Data = block.Dwork(24).Data;
            block.Dwork(24).Data = 0.0;
            for n=1:N 
                block.Dwork(24).Data = block.Dwork(24).Data + bufferIaOrig(n)*cos((n-1)*pi);
            end

            block.Dwork(30).Data = (block.Dwork(12).Data-(block.Dwork(24).Data*block.Dwork(1).Data))/block.Dwork(2).Data;

            %-------------------------------------------%
            %  Estimando o Fasor da Corrente na Fase B  %
            %-------------------------------------------%

            block.Dwork(13).Data = block.Dwork(25).Data;
            block.Dwork(25).Data = 0.0;
            for n=1:N 
                block.Dwork(25).Data = block.Dwork(25).Data + bufferIbOrig(n)*cos((n-1)*pi);
            end
            block.Dwork(31).Data = (block.Dwork(13).Data-(block.Dwork(25).Data*block.Dwork(1).Data))/block.Dwork(2).Data;

            %-------------------------------------------%
            %	Estimando o Fasor da Corrente na Fase C %
            %-------------------------------------------%
            
            block.Dwork(14).Data = block.Dwork(26).Data;
            block.Dwork(26).Data = 0.0;
            for n=1:N 
                block.Dwork(26).Data = block.Dwork(26).Data + bufferIcOrig(n)*cos((n-1)*pi);
            end
            block.Dwork(32).Data = (block.Dwork(14).Data-(block.Dwork(26).Data*block.Dwork(1).Data))/block.Dwork(2).Data;  

            block.OutputPort(1).Data = block.Dwork(21).Data;
            block.OutputPort(2).Data = block.Dwork(27).Data;
            block.OutputPort(3).Data = block.Dwork(22).Data;
            block.OutputPort(4).Data = block.Dwork(28).Data;
            block.OutputPort(5).Data = block.Dwork(23).Data;
            block.OutputPort(6).Data = block.Dwork(29).Data;
            block.OutputPort(7).Data = block.Dwork(24).Data;
            block.OutputPort(8).Data = block.Dwork(30).Data;
            block.OutputPort(9).Data = block.Dwork(25).Data;
            block.OutputPort(10).Data = block.Dwork(31).Data;
            block.OutputPort(11).Data = block.Dwork(26).Data;
            block.OutputPort(12).Data = block.Dwork(32).Data;

function Update(block)

function Derivatives(block)


function Terminate(block)



