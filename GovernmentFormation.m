%%%%%%%%%%%%%%%%%%%%% Govt. Formation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
aWinnerInd=zeros(areas,1);   %Indices of area winners in x
aWinners = zeros(areas,dim); %Area winners are stored separately
for a = 1:areas
	[aWinnerFitness,aWinnerParty]=min(fitness(a:areas:SearchAgents_no));
	aWinnerInd(a,1) = (aWinnerParty-1) * areas + a;
    aWinners(a,:) = Positions(aWinnerInd(a,1),:);
end    

%Finding party leaders
pLeaderInd=zeros(parties,1);    %Indices of party leaders in x
pLeaders = zeros(parties,dim);  %Positions of party leaders in x
for p = 1:parties
	pStIndex = (p-1) * areas + 1;
	pEndIndex = pStIndex + areas - 1;
	[partyLeaderFitness,leadIndex]=min(fitness(pStIndex:pEndIndex)); 
	pLeaderInd(p,1) = (pStIndex - 1) + leadIndex; %Indexof party leader
    pLeaders(p,:) = Positions(pLeaderInd(p,1),:);
	
end
save('pLeaders.mat','pLeaders');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

