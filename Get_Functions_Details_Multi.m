%_________________________________________________________________________________
%  Political Optimizer: A novel socio-inspired meta-heuristic 
%                       for global optimization source codes version 1.0
%
%  Developed in MATLAB R2015a
%
%  Author and programmer: Qamar Askari
%
%         e-Mail: l165502@lhr.nu.edu.pk
%                 syedqamar@gift.edu.pk
%
%
%   Main paper:
%   Askari, Q., Younas, I., & Saeed, M. (2020). Political Optimizer: 
%       A novel socio-inspired meta-heuristic for global optimization.
%   Knowledge-Based Systems, 2020, 
%   DOI: https://doi.org/10.1016/j.knosys.2020.105709
%____________________________________________________________________________________

function [lb,ub,dim,fobj] = Get_Functions_Details_Multi(F)

%Fixed dim functions will change it
dim = 50;

switch F
    %Schwefel's 2.26
    case 'MF1'
        fobj = @MF1;
        lb=-500;
        ub=500;
        %dim=30;
        
    %Rastrigin
    case 'MF2'
        fobj = @MF2;
        lb=-5.12;
        ub=5.12;
        %dim=30;
        
    %Periodic
    case 'MF3'
        fobj = @MF3;
        lb=-10;
        ub=10;
        
    %Qing
    case 'MF4'
        fobj = @MF4;
        lb=-500;
        ub=500;
        
    %Alpine N. 1
    case 'MF5'
        fobj = @MF5;
        lb=-10;
        ub=10;
        
    %Xin-She Yang
    case 'MF6'
        fobj = @MF6;
        lb=-5;
        ub=5;
        
    %Ackley
    case 'MF7'
        fobj = @MF7;
        lb=-32;
        ub=32;
        
    %Trignometric 2
    case 'MF8'
        fobj = @MF8;
        lb=-500;
        ub=500;

    %Salomon
    case 'MF9'
        fobj = @MF9;
        lb=-100;
        ub=100;
        
    %Styblinski-Tang
    case 'MF10'
        fobj = @MF10;
        lb=-5;
        ub=5;
        
    %Griewank
    case 'MF11'
        fobj = @MF11;
        lb=-100;
        ub=100;
        
    %Xin-She Yang N. 4
    case 'MF12'
        fobj = @MF12;
        lb=-10;
        ub=10;
        
    %Xin-She Yang N. 2
    case 'MF13'
        fobj = @MF13;
        lb=-2*pi;
        ub=2*pi;
        
    %Gen. Pendlized
    case 'MF14'
        fobj = @MF14;
        lb=-50;
        ub=50;
        
    %Pendlized
    case 'MF15'
        fobj = @MF15;
        lb=-50;
        ub=50;
        
    %Egg Crate
    case 'MF16'
        fobj = @MF16;
        lb=-5;
        ub=5;
        dim=2;
        
    %Ackley N.3
    case 'MF17'
        fobj = @MF17;
        lb=-32;
        ub=32;
        dim=2;
        
    %Adjiman 
    case 'MF18'
        fobj = @MF18;
        lb=-1;
        ub=2;
        dim=2;
        
    %Bird
    case 'MF19'
        fobj = @MF19;
        lb=-2*pi;
        ub=2*pi;
        dim=2;
        
    %Camel 6 Hump
    case 'MF20'
        fobj = @MF20;
        lb=-5;
        ub=5;
        dim=2;
        
    %Branin RCOS
    case 'MF21'
        fobj = @MF21;
        lb=-5;
        ub=5;
        dim=2;
        
    %Goldstien Price
    case 'MF22'
        fobj = @MF22;
        lb=-2;
        ub=2;
        dim=2;
        
    %Hartman 3
    case 'MF23'
        fobj = @MF23;
        lb=0;
        ub=1;
        dim=3;
        
    %Hartman 6
    case 'MF24'
        fobj = @MF24;
        lb=0;
        ub=1;
        dim=6;
        
    %Cross-in-tray
    case 'MF25'
        fobj = @MF25;
        lb=-10;
        ub=10;
        dim=2;
        
    %Bartels Conn
    case 'MF26'
        fobj = @MF1;
        lb=-500;
        ub=500;
        dim=2;
    
end

end

% MF1 - Schwefel's 2.26
function o = MF1(x)
dim=size(x,2);
o=418.9829 - sum(-x.*sin(sqrt(abs(x))))/dim;
end

% MF2 - Rastrigin
function o = MF2(x)
dim=size(x,2);
o=sum(x.^2-10*cos(2*pi.*x))+10*dim;
end

% MF3 - Periodic
function o = MF3(x)
    sin2x = sin(x) .^ 2;
    sumx2 = sum(x .^2, 2);
    o = 1 + sum(sin2x, 2) -0.1 * exp(-sumx2);
end

% MF4 - Qing
function o = MF4(x)
    n = size(x, 2);
    x2 = x .^2;
    
    o = 0;
    for i = 1:n
        o = o + (x2(:, i) - i) .^ 2;
    end
end

% MF5 - Alpine N. 1
function o = MF5(x)
     o = sum(abs(x .* sin(x) + 0.1 * x), 2);
end

% MF6 - Xin-She Yang
function o = MF6(x)
    n = size(x, 2);
    o = 0;
    for i = 1:n
        o = o + rand * (abs(x(:, i)) .^ i);
    end
end

% MF7 - Ackley
function o = MF7(x)
    n = size(x, 2);
    ninverse = 1 / n;
    sum1 = sum(x .^ 2, 2);
	sum2 = sum(cos(2 * pi * x), 2);
    
    o = 20 + exp(1) - (20 * exp(-0.2 * sqrt( ninverse * sum1))) - exp( ninverse * sum2);
end

% MF8 - Trignometric 2
function o = MF8(x)
    n = size(x, 2);
    
    o = 1;
    for i = 1:n
        o = o + 8*sin(7*(x(i)-0.9)^2)^2+6*sin(14*(x(1)-0.9)^2)^2+(x(i)-0.9)^2;
    end
end

% MF9 - Salomon
function o = MF9(x)
    x2 = x .^ 2;
    sumx2 = sum(x2, 2);
    sqrtsx2 = sqrt(sumx2);
    
    o = 1 - cos(2 .* pi .* sqrtsx2) + (0.1 * sqrtsx2);
end

% MF10 - Styblinski-Tang
function o = MF10(x)
    n = size(x, 2);
    o = 0;
    for i = 1:n
        o = o + ((x(:, i) .^4) - (16 * x(:, i) .^ 2) + (5 * x(:, i)));
    end
    o = 0.5 * o;
end

% MF11 - Griewank
function o = MF11(x)
dim=size(x,2);
o=sum(x.^2)/4000-prod(cos(x./sqrt([1:dim])))+1;
end

% MF12 - Xin-She Yang N. 4
function o = MF12(x)
     o = (sum(sin(x) .^2, 2) - exp(-sum(x .^ 2, 2))) .* exp(-sum(sin(sqrt(abs(x))) .^2, 2));
end

% MF13 - Xin-She Yang N. 2
function o = MF13(x)
    o = sum(abs(x), 2) .* exp(-sum(sin(x .^2), 2));
end

%Helping function for MF14, MF15
function o=Ufun(x,a,k,m)
o=k.*((x-a).^m).*(x>a)+k.*((-x-a).^m).*(x<(-a));
end

% MF14 - Gen. Pendlized
function o = MF14(x)
dim=size(x,2);
o=.1*((sin(3*pi*x(1)))^2+sum((x(1:dim-1)-1).^2.*(1+(sin(3.*pi.*x(2:dim))).^2))+...
((x(dim)-1)^2)*(1+(sin(2*pi*x(dim)))^2))+sum(Ufun(x,5,100,4));
end

% MF15 - Pendlized
function o = MF15(x)
dim=size(x,2);
o=(pi/dim)*(10*((sin(pi*(1+(x(1)+1)/4)))^2)+sum((((x(1:dim-1)+1)./4).^2).*...
(1+10.*((sin(pi.*(1+(x(2:dim)+1)./4)))).^2))+((x(dim)+1)/4)^2)+sum(Ufun(x,10,100,4));
end

% MF16 - Egg crate
function o = MF16(x)
    n = size(x, 2);
    assert(n == 2, 'The Egg Crate function is defined only on the 2-D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = X.^2 + Y.^2 + (25 * (sin(X).^2 + sin(Y).^2));
end

% MF17 - Ackley N.3
function o = MF17(x)
    n = size(x, 2);
    assert(n == 2, 'Ackley N. 3 function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = -200 * exp(-0.02 * sqrt((X .^ 2) + (Y .^ 2))) + ...
             5 * exp(cos(3 * X) + sin(3 * Y));
end

% MF18 - Adjiman
function o = MF18(x)
    n = size(x, 2);
    assert(n == 2, 'Adjiman function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = (cos(X) .* sin(Y)) - (X ./ ((Y .^ 2) + 1));
end

% MF19 - Bird
function o = MF19(x)
    n = size(x, 2);
    assert(n == 2, 'Bird function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = sin(X) .* exp((1 - cos(Y)).^2) + ... 
        cos(Y) .* exp((1 - sin(X)) .^ 2) + ...
        (X - Y) .^ 2;
end

% MF20 - Camel 6 Hump
function o = MF20(x)
o=4*(x(1)^2)-2.1*(x(1)^4)+(x(1)^6)/3+x(1)*x(2)-4*(x(2)^2)+4*(x(2)^4);
end

% MF21 - Branin CROS
function o = MF21(x)
o=(x(2)-(x(1)^2)*5.1/(4*(pi^2))+5/pi*x(1)-6)^2+10*(1-1/(8*pi))*cos(x(1))+10;
end

% MF22 - Goldstien Price
function o = MF22(x)
o=(1+(x(1)+x(2)+1)^2*(19-14*x(1)+3*(x(1)^2)-14*x(2)+6*x(1)*x(2)+3*x(2)^2))*...
    (30+(2*x(1)-3*x(2))^2*(18-32*x(1)+12*(x(1)^2)+48*x(2)-36*x(1)*x(2)+27*(x(2)^2)));
end

% MF23 - Hartman 3
function o = MF23(x)
aH=[3 10 30;.1 10 35;3 10 30;.1 10 35];cH=[1 1.2 3 3.2];
pH=[.3689 .117 .2673;.4699 .4387 .747;.1091 .8732 .5547;.03815 .5743 .8828];
o=0;
for i=1:4
    o=o-cH(i)*exp(-(sum(aH(i,:).*((x-pH(i,:)).^2))));
end
end

% MF24 - Hartman 6
function o = MF24(x)
aH=[10 3 17 3.5 1.7 8;.05 10 17 .1 8 14;3 3.5 1.7 10 17 8;17 8 .05 10 .1 14];
cH=[1 1.2 3 3.2];
pH=[.1312 .1696 .5569 .0124 .8283 .5886;.2329 .4135 .8307 .3736 .1004 .9991;...
.2348 .1415 .3522 .2883 .3047 .6650;.4047 .8828 .8732 .5743 .1091 .0381];
o=0;
for i=1:4
    o=o-cH(i)*exp(-(sum(aH(i,:).*((x-pH(i,:)).^2))));
end
end

% MF25 - Cross in tray
function o = MF25(x)
    n = size(x, 2);
    assert(n == 2, 'The Cross-in-tray function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);

    expcomponent = abs(100 - (sqrt(X .^2 + Y .^2) / pi));
    
    o = -0.0001 * ((abs(sin(X) .* sin(Y) .* exp(expcomponent)) + 1) .^ 0.1);
end

% MF26 - Bartels Conn
function o = MF26(x)
    n = size(x, 2);
    assert(n == 2, 'Bartels Conn function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = abs((X .^ 2) + (Y .^ 2) + (X .* Y)) + abs(sin(X)) + abs(cos(Y));
end