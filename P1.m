% com escriure una matriu
M1=[1 2; 3 4];

% comprovar la mida de la variable
size(M1);

%mostra el valor en la casella (1,2)
int1=M1(1,2);

% afegeix un valor a una casella no existent, i crear la fila i la columna
M1(3,3)=5;

%Generar un vector
V1=1:10;

V2=10:-2:1;

%mostra una fila o columna sensera
r=M1(2:3,2:3);

%com apilar matrius, de la mateixa manera que ho fem amb el numeros
M2=[M1 M1];