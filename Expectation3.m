function [E] = Expectation3(theta)
%%
tau3=1.1278;
%Define Pauli Operator
Pauli1=[0,1;1,0];Pauli2=[0,sqrt(-1);-sqrt(-1),0];Pauli3=[1,0;0,-1];
%Given a matrix A
A=eye(2^5)+0.2*kron(kron(Pauli1,Pauli3),eye(2^3))+0.2*kron(Pauli1,eye(2^4));
eig(A);%A����ֵ
%%
%Given a matrix B. compute A*psi=lambda*B*psi. A*B-B*A=0
s1=0.0741;s2=0.3939;
B=eye(2^5)+s1*kron(kron(Pauli1,Pauli3),eye(2^3))+s2*kron(Pauli1,eye(2^4));
%%
qubit0=[1;0];
%five registers.
psi1=Ry(theta(1))*qubit0;psi2=Ry(theta(2))*qubit0;psi3=Ry(theta(3))*qubit0;
psi4=Ry(theta(4))*qubit0;psi5=Ry(theta(5))*qubit0;
psi=kron(kron(kron(kron(psi1,psi2),psi3),psi4),psi5);
%Compute the expection of a given Hamiltonian.
E=(psi'*(A-tau3*B)^2*psi)/(psi'*B^2*psi);
end