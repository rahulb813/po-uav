
%%%%%%%%%%%%%%%%%%%%% Election campaign %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for whichMethod = 1:2
    for a = 1:areas
        for p = 1:parties
            i = (p-1)*areas + a; %index of member
        
            for j=1:dim
                if whichMethod == 1         %position-updating w.r.t party leader
                    center = pLeaders(p,j);
                elseif whichMethod == 2     %position-updating w.r.t area winner
                    center = aWinners(a,j);
                end
            
                %Cases of Eq. 9 in paper
                if prevFitness(i) >= fitness(i) 
                    if (prevPositions(i,j) <= Positions(i,j) && Positions(i,j) <= center) ...
                            || (prevPositions(i,j) >= Positions(i,j) && Positions(i,j) >= center)
                    
                        radius = center - Positions(i,j); 
                        Positions(i,j) = center + rand() * radius;
                    elseif (prevPositions(i,j) <= Positions(i,j) && Positions(i,j) >= center && center >= prevPositions(i,j)) ...
                            || (prevPositions(i,j) >= Positions(i,j) && Positions(i,j) <= center && center <= prevPositions(i,j))
                    
                        radius = abs(Positions(i,j) - center);
                        Positions(i,j) = center + (2*rand()-1) * radius;
                    elseif (prevPositions(i,j) <= Positions(i,j) && Positions(i,j) >= center && center <= prevPositions(i,j)) ...
                            || (prevPositions(i,j) >= Positions(i,j) && Positions(i,j) <= center && center >= prevPositions(i,j))
                    
                        radius = abs(prevPositions(i,j) - center);
                        Positions(i,j) = center + (2*rand()-1) * radius;
                    end
                
                %Cases of Eq. 10 in paper
                elseif prevFitness(i) < fitness(i) 
                    if (prevPositions(i,j) <= Positions(i,j) && Positions(i,j) <= center) ...
                            || (prevPositions(i,j) >= Positions(i,j) && Positions(i,j) >= center)
                    
                    
                        radius = abs(Positions(i,j) - center);
                        Positions(i,j) = center + (2*rand()-1) * radius;
                    elseif (prevPositions(i,j) <= Positions(i,j) && Positions(i,j) >= center && center >= prevPositions(i,j)) ...
                            || (prevPositions(i,j) >= Positions(i,j) && Positions(i,j) <= center && center <= prevPositions(i,j))
                
                        radius = Positions(i,j) - prevPositions(i,j);
                        Positions(i,j) = prevPositions(i,j) + rand() * radius;
                    elseif (prevPositions(i,j) <= Positions(i,j) && Positions(i,j) >= center && center <= prevPositions(i,j)) ...
                            || (prevPositions(i,j) >= Positions(i,j) && Positions(i,j) <= center && center >= prevPositions(i,j))
            
                        center2 = prevPositions(i,j);
                        radius = abs(center - center2);
                        Positions(i,j) = center + (2*rand()-1) * radius;
                    end
                end
            
            end
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%