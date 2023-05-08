%%%%%%%%%%%%%%%%%%%%% Party switching Phase %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
psr = (1-t*((1)/Max_iter)) * lambda;

for p=1:parties
    for a=1:areas
        fromPInd = (p-1)*areas + a;
        if rand() < psr
            %Selecting a party other than current where want to send the
            %member
            toParty = randi(parties);
            while(toParty == p)
                toParty = randi(parties);
            end
            
            %Deciding member in TO party
             toPStInd = (toParty-1) * areas + 1;
             toPEndIndex = toPStInd + areas - 1;
             [~,toPLeastFit] = max(fitness(toPStInd:toPEndIndex));
             toPInd = toPStInd + toPLeastFit-1;
            
            
            %Deciding what to do with member in FROM party and switching
            fromPInd = (p-1)*areas + a;
            temp = Positions(toPInd,:);
            Positions(toPInd,:) = Positions(fromPInd);
            Positions(fromPInd,:)=temp;
                
            temp = fitness(toPInd);
            fitness(toPInd) = fitness(fromPInd);
            fitness(fromPInd) = temp;
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%