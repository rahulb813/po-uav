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

function [lb,ub,dim,fobj] = Get_Functions_Details_Uni(F)

%Fixed dim functions will change it
dim = 3;

switch F
    %Sphere
    case 'F1'
        fobj = @F1;
        lb=-100;
        ub=100;
    
    %Quartic Noise
    case 'F2'
        fobj = @F2;
        lb=-1.28;
        ub=1.28;
        
    %Powell Sum
    case 'F3'
        fobj = @F3;
        lb=-1;
        ub=1;
        
    %Schwefel's 2.20
    case 'F4'
        fobj = @F4;
        lb=-100;
        ub=100;
        
    %Schwefel's 2.21
    case 'F5'
        fobj = @F5;
        lb=-100;
        ub=100;
        
    %Step
    case 'F6'
        fobj = @F6;
        lb=-100;
        ub=100;
        
    %Stepint
    case 'F7'
        fobj = @F7;
        lb=-5.12;
        ub=5.12;
        
    %Schwefel's 1.20
    case 'F8'
        fobj = @F8;
        lb=-100;
        ub=100;
        
    %Schwefel's 2.22
    case 'F9'
        fobj = @F9;
        lb=-100;
        ub=100;
        
    %Schwefel's 2.23
    case 'F10'
        fobj = @F10;
        lb=-10;
        ub=10;
        
    %Rosenbrock
    case 'F11'
        fobj = @F11;
        lb=-30;
        ub=30;
        
    %Brown
    case 'F12'
        fobj = @F12;
        lb=-1;
        ub=4;
        
    %Dixon and Price
    case 'F13'
        fobj = @F13;
        lb=-100;
        ub=100;
        
    %Powell Singular
    case 'F14'
        fobj = @F14;
        lb=-4;
        ub=5;
        
    %Zakharov
    case 'F15'
        fobj = @F15;
        lb=-5;
        ub=10;
        
    %Xin-She Yang
    case 'F16'
        fobj = @F16;
        lb=-20;
        ub=20;
        
    %Perm 0,D,Beta
    case 'F17'
        dim=3;
        fobj = @F17;
        lb=0;
        ub=10;

    %Three-Hump Camel
    case 'F18'
        fobj = @F18;
        lb=-5;
        ub=5;
        dim = 2;
    %Beale
    case 'F19'
        fobj = @F19;
        lb=-4.5;
        ub=4.5;
        dim=2;
        
    %Booth
    case 'F20'
        fobj = @F20;
        lb=-10;
        ub=10;
        dim=2;     
        
    %Brent
    case 'F21'
        fobj = @F21;
        lb=-10;
        ub=10;
        dim=2;    
        
    %Matyas
    case 'F22'
        fobj = @F22;
        lb=-10;
        ub=10;
        dim=2;    
        
    %Schaffer N. 4
    case 'F23'
        fobj = @F23;
        lb=-100;
        ub=100;
        dim=2;    
        
    %Wayburn Seader
    case 'F24'
        fobj = @F24;
        lb=-500;
        ub=500;
        dim=2;     
        
    %Leon
    case 'F25'
        fobj = @F25;
        lb=-1.2;
        ub=1.2;
        dim=2;     
end

end

% F1 - Sphere
function o = F1(x)
o=sum(x.^2);
end

% F2 - Quartic Noise
function o = F2(x)
dim=size(x,2);
o=sum([1:dim].*(x.^4))+rand;
end

% F3 - Powell Sum
function o = F3(x)
n = size(x, 2);
absx = abs(x);
    
o = 0;
for i = 1:n
	o = o + (absx(:, i) .^ (i + 1));
end
end

% F4 - Schwefel 2.20
function o = F4(x)
	o = sum(abs(x), 2);
end

% F5 - Schwefel 2.21
function o = F5(x)
    o = max(abs(x), [], 2);
end

% F6 - Step
function o = F6(x)
    o=sum(abs((x+.5)).^2);
end


% F7 - Stepint
function o = F7(x)
    o=25+sum(floor(x));
end

% F8 - Schwefel's 1.20
function o = F8(x)
n = size(x, 2);
o=0;
for i = 1:n
    sum = 0;
    for j =1:i
        sum = sum + x(j);
    end
    o = o + sum^2;
end
end

% F9 - Schwefel's 2.22
function o = F9(x)
o=sum(abs(x))+prod(abs(x));
end

% F10 - Schwefel's 2.23
function o = F10(x)
o=sum(x .^10, 2);
end

% F11 - Rosenbrock
function o = F11(x)
dim=size(x,2);
o=sum(100*(x(2:dim)-(x(1:dim-1).^2)).^2+(x(1:dim-1)-1).^2);
end

% F12 - Brown
function o = F12(x)
dim=size(x,2);
o = 0;
for i = 1:dim-1
    xi1 = x(i+1)^2+1;
    xi = x(i)^2+1;
    o = o + (x(i)^2)^xi1 + (x(i+1)^2)^xi;
end
end

% F13 - Dixon & Price
function o = F13(x)
x1 = x(1);
d = length(x);
term1 = (x1-1)^2;

sum = 0;
for ii = 2:d
	xi = x(ii);
	xold = x(ii-1);
	new = ii * (2*xi^2 - xold)^2;
	sum = sum + new;
end

o = term1 + sum;
end

% F14 - Powell Singular
function o = F14(x)
d = length(x);
sum = 0;

for ii = 1:(d/4)
	term1 = (x(4*ii-3) + 10*x(4*ii-2))^2;
	term2 = 5 * (x(4*ii-1) - x(4*ii))^2;
	term3 = (x(4*ii-2) - 2*x(4*ii-1))^4;
	term4 = 10 * (x(4*ii-3) - x(4*ii))^4;
	sum = sum + term1 + term2 + term3 + term4;
end

o = sum;
end

% F15 - Zakharov
function o = F15(x)
d = length(x);
sum1 = 0;
sum2 = 0;

for ii = 1:d
	xi = x(ii);
	sum1 = sum1 + xi^2;
	sum2 = sum2 + 0.5*ii*xi;
end

o = sum1 + sum2^2 + sum2^4;
end

% F16 - Xin She Yang
function o = F16(x)
   if nargin < 2
       beta = 15;
   end
   if nargin < 3
       m = 5;
   end
   
   o = exp(-sum((x / beta).^(2*m), 2)) - (2 * exp(-sum(x .^ 2, 2)) .* prod(cos(x) .^ 2, 2));
end

% F17 - Perm 0,D,Beta
function o = F17(x)
if (nargin == 1)
    b = 0.5;
end
d = length(x);
outer = 0;
for ii = 1:d
	inner = 0;
    for jj = 1:d
		xj = x(jj);
        inner = inner + (jj^ii+b)*((xj/jj)^ii-1);
    end
	outer = outer + inner^2;
end
o = outer;
end

% F18 - Three hump camel
function o = F18(x)
    n = size(x, 2);
    assert(n == 2, 'The Three-hump camel function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = (2 * X .^ 2) - (1.05 * (X .^ 4)) + ((X .^ 6) / 6) + X .* Y + Y .^2;
end

% F19 - Beale
function o = F19(x)
    n = size(x, 2);
    assert(n == 2, 'Beale''s function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = (1.5 - X + (X .* Y)).^2 + ...
             (2.25 - X + (X .* (Y.^2))).^2 + ...
             (2.625 - X + (X .* (Y.^3))).^2;
end

% F20 - Booth
function o = F20(x)
    n = size(x, 2);
    assert(n == 2, 'Booth''s function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = (X + (2 * Y) - 7).^2 + ( (2 * X) + Y - 5).^2;
end

% F21 - Brent
function o = F21(x)
    n = size(x, 2);
    assert(n == 2, 'Brent''s function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = (X+10)^2 + (Y+10)^2 + exp(-X^2 - Y^2);
end

% F22 - Matyas
function o = F22(x)
o=0.26*(x(1)^2+x(2)^2) - 0.48*x(1)*x(2);
end


% F23 - Schaffer N. 4
function o = F23(x)
    n = size(x, 2);
    assert(n == 2, 'Schaffer function N. 4 is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    numeratorcomp = (cos(sin(abs(X .^ 2 - Y .^ 2))) .^ 2) - 0.5; 
    denominatorcomp = (1 + 0.001 * (X .^2 + Y .^2)) .^2 ;
    o = 0.5 + numeratorcomp ./ denominatorcomp;
end

% F24 - Wayburn Seader 3
function o = F24(x) 
    o = 2/3*x(1)^3-8*x(1)^2+33*x(1)-x(1)*x(2)+5+((x(1)-4)^2+(x(2)-5)^2-4)^2;
end

% F25 - Leon
function o = F25(x) 
    n = size(x, 2);
    assert(n == 2, 'Leon function is defined only on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = 100 * ((Y - X.^3) .^2) + ((1 - X) .^2);
end