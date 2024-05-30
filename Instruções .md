Abstract:
This paper presents a generic algorithm for implementing recloser control in various systems. The algorithm can be adapted to
different types of reclosers by varying the number of pulses and the operating logic. 
Implementation is done in Simulink/MATLAB using S-functions and a "recloser block".

Implementation Steps:

1-Define Number of Pulses:
    Determine the number of pulses of your recloser.
    In the example in Figure 06 of the paper, the recloser has four pulses.
    
2-Create S-functions in MATLAB:
    For each recloser pulse, create an S-function in Simulink/MATLAB.
    Each pulse will have a block implemented with the "recloser block" algorithm.
    The S-functions should be defined according to the operating logic of your recloser, considering the desired input and output states.
    The reference scheme is Figure 06 of the paper.
    
3- Implement the Algorithm:
    Implement the generic algorithm using the created S-functions.
    The block should reserve the phase and angle values of each phase.
    The output of the last block should be connected to a "Tree-Phase Breaker" to open the system.

    Final summary: open the IEEE_recloser file and compile the other files.
