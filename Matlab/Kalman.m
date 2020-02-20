function [mue,integ_phi] = Kalman(u,z,Kov_u,Kov_z,dt)

    A = [1 -dt;0 1];
    B = [dt;0];
    H = [1 0];
    mueq = [0;0];
    Kovq = [1 0;0 1];
    Kov = [1 0;0 1];
    K = [0;0];
    mue = zeros(2,length(u));
    integ_phi = zeros(length(u),1);
 
    for t = 1:length(u)-1
    
        integ_phi(t+1) = integ_phi(t) + u(t)*dt;
    
        %Praediktor - Schritt
    
        mueq = A*mue(:,t) + B*u(t);
        Kovq = A*Kov*transpose(A) + Kov_u;
    
        %Korrektur - Schritt
    
        K = Kovq*transpose(H)*(H*Kovq*transpose(H)+Kov_z)^-1;
        mue(:,t+1) = mueq+K*(z(t+1)-H*mueq);
        Kov =(eye(2)-K*H)*Kovq;
   
    
    end

end

