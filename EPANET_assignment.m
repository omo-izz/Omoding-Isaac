clear;close('all');clc;


My_sketch='My sketch.inp';
d=epanet(My_sketch);


index=d.addNodeJunction('J2');
d.setNodeJunctionData(index,0,0,'');
d.setNodeCoordinates(index,[-2155.009  9867.675])

index=d.addNodeJunction('J4');
d.setNodeJunctionData(index,0,0,'');
d.setNodeCoordinates(index,[661.626  5897.921] )

index=d.addNodeReservoir('R3');
d.setNodeElevations(index,0);
d.setNodeCoordinates(index,[-4820.416  5311.909])

index=d.addNodeTank('T1');
d.setNodeTankData(index,0,10,0,20,50,0,'');
d.setNodeCoordinates(index,[-9508.507  9678.639])

index=d.addLinkPipe('P1','T1','J2');
d.setLinkPipeData(index,1000,12,100,0);
index=d.addLinkPipe('P2','T1','R3');
d.setLinkPipeData(index,1000,12,100,0);
index=d.addLinkPipe('P4,','J2','J4');
d.setLinkPipeData(index,1000,12,100,0);

index=d.addLinkPump('Pump','R3','J4');
d.addCurve('C1');
d.setCurveValue(1,1,[-2022.684  5633.270]);
d.setLinkPumpHCurve(index,1);

d.saveInputFile(My_sketch);
d=epanet(My_sketch);
d.plot;

d.unload


