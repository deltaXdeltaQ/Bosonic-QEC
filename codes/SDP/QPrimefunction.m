function [Yout] = QPrimefunction(d,n,LossChoi,DecodingChoi)
    for i = 1:n
        for iprime = 1:n
            for j = 1:n
                for jprime = 1:n
                    LossChoiReshaped(i,iprime,j,jprime) = LossChoi(i+n*(j-1),iprime+n*(jprime-1));
                end
            end
        end
    end
%    Yout = zeros(n*d,n*d);
    for i = 1:n
        for iprime = 1:n
            for j = 1:d
                for jprime = 1:d
                    Yout(i+n*(j-1),iprime+n*(jprime-1)) = 0;
                    for k = 1:n
                        for kprime = 1:n
                            Yout(i+n*(j-1),iprime+n*(jprime-1)) = Yout(i+n*(j-1),iprime+n*(jprime-1))+LossChoiReshaped(kprime,k,iprime,i)*DecodingChoi(jprime+d*(kprime-1),j+d*(k-1));
                        end
                    end
                end
            end
        end
    end
end