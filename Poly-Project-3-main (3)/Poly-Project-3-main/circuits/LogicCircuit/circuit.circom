pragma circom 2.0.0; 

template LogicCircuit() {  
   signal input A;
   signal input B;

   signal X;
   signal Y;

   signal output Q;

   component andGate = AND();
   component notGate = NOT();
   component orGate = OR();

   andGate.A <== A;
   andGate.B <== B;
   X <== andGate.out;

   notGate.in <== B;
   Y <== notGate.out;

   orGate.A <== X;
   orGate.B <== Y;
   Q <== orGate.out;
}

template AND() {
    signal input A;
    signal input B;
    signal output out;

    out <== A*B;
}
template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}
template OR() {
    signal input A;
    signal input B;
    signal output out;

    out <== A + B - A*B;
}
component main = LogicCircuit();