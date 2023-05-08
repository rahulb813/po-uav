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

clear all 
clc


%%%%%%%%%%%%%%%%%%%%%%Adjustable parameters%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
parties = 8;        %Number of political parties
lambda = 1.0;       %Max limit of party switching rate
fEvals = 2000;     %Number of function evaluations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

areas = parties;                
populationSize=parties * areas; % Number of search agents
Max_iteration = round(fEvals / (parties * areas + areas));
runs = 64;
ct=input("Enter the max size of room: ");

for fn = 1:3

    Function_name='F13' % Name of the test function 
    [lb,ub,dim,fobj]=Get_Functions_Details_Uni(Function_name);
    %[lb,ub,dim,fobj]=Get_Functions_Details_Uni(Function_name);
    
    %Function_name=strcat('MF',num2str(fn)); % Name of the test function 
    %[lb,ub,dim,fobj]=Get_Functions_Details_Multi(Function_name);

    % Calling algorithm
    Best_score_T = zeros(1,runs);
    for run=1:runs
        rng('shuffle');
        [Best_score_0,Best_pos,PO_cg_curve]=PO(populationSize,areas,parties,lambda,Max_iteration,lb,ub,dim,fobj,ct);
        Best_score_0=(Best_score_0*100);
        Best_score_T(1,run) = Best_score_0;
        
        Best_score_0
    end

    %Finding statistics
    Best_score_Best = min(Best_score_T);
    Best_score_Worst = max(Best_score_T);
    Best_score_Median = median(Best_score_T,2);
    Best_Score_Mean = mean(Best_score_T,2);
    Best_Score_std = std(Best_score_T);


    %Printing results
    
    display(['Fn = ', num2str(fn)]);
    display(['Best, Worst, Median, Mean, and Std. are as: ', num2str(Best_score_Best),'  ', ...
        num2str(Best_score_Worst),'  ', num2str(Best_score_Median),'  ', num2str(Best_Score_Mean),'  ', num2str(Best_Score_std)]);
    load('pLeaders.mat', 'pLeaders')
    load('new_pos.mat','new_pos');
    a=sort(pLeaders(:,1));
    b=sort(pLeaders(:,2));
    c=sort(pLeaders(:,3));
    plot3(a,b,c);

end
