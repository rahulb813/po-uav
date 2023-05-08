%%%%%%%%%%%%%%%%%%%%% Election Phase %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:size(Positions,1)
	% Return back the search agents that go beyond the boundaries of the search space
 	Flag4ub=Positions(i,:)>ub;
 	Flag4lb=Positions(i,:)<lb;
 	Positions(i,:)=(Positions(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
       
	%Calculate objective function for each search agent
	fitness(i,1)=fobj(Positions(i,:));
        
	%Update the leader
    if fitness(i,1)<Leader_score % Change this to > for maximization problem
        Leader_score=fitness(i,1); 
        Leader_pos=Positions(i,:);
    end        
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%