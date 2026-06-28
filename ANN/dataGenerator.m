% problem parameters
M =  [0 0.5 1 1.5 2];
m0 = [0 -0.3 -0.5 -0.8 -1.2] ;
n0 = [0 -0.3 -0.5 -0.8 -1];
phi = [0 0.05 0.1 0.2];
phi2 = phi; phi1 = phi;
alpha = -3.5:0.1:3 ;

c = 0.05; 

% grid options
max_eta = 3; grid_size = 0.05; x_lim = 5;
eta = 0:grid_size:max_eta; 
del = 100; T_inf = 300;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% generate ANN training data
[params_water, d2f0_water, dg0_water, dtheta0_water]= hnfSysSolve(alpha, n0, m0, M, phi, grid_size, max_eta);
ANN_in = params_water;
ANN_target = [d2f0_water dg0_water -dtheta0_water];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [params, d2f0, dg0, dtheta0]= hnfSysSolve(alpha, n0, m0, M, phi, grid_size, max_eta)
    
    eta = 0:grid_size:max_eta;
    
    ic = bvpinit(eta, [0 0 0 0 0 0 0]); % iniitial guess for 1st (steady) solution
    options = bvpset('RelTol',1e-5);
    
    % [ rho_f, Cp_f, mu_f, kappa_f, sigma_f];
    fluid_water = [997.1 4179 0.000891 0.613 0.05 6.3];
    % fluid_EG = [1111 2428 0.0161 0.249 0.000107];
    % fluid_kerosene = [783 2090 0.00164 0.145 50e-12]; % https://www.sciencedirect.com/science/article/pii/S2214157X21004202
    fluid_EO = [ 884 1910 0.026576 0.144 2.1e-12 30]; %https://www.degruyter.com/document/doi/10.1515/ntrev-2022-0486/html
    count = 1; i = 2;
    % res = cat(3, ones(length(eta), 7), ones(length(eta), 7)); % uncomment for full result
    % set 'res' as output argument
    
    params = [];  % for training data generation
    d2f0 = []; dg0 = []; dtheta0 = [];
    for fluid_properties = [fluid_water]' % loop for base fluids
        if i == 1
            disp('Solving for water')
        elseif i == 2
            disp('Solving for EG')
        end
        % parameter variation loop
        for M_in = M
            for m0_in = m0
                for n0_in = n0
                    for phi_in = phi
                        %for phi_in = phi
                            for alpha_in = alpha
    
                                %%%% for training data %%%%%%%%%%%%%%%%%%%%%%%%
                                critAlpha_p = critAlphaModel([M_in m0_in n0_in phi_in]);
    
    
                                if alpha_in > critAlpha_p(i) + 0.07
                                sol = bvp4c(@(eta, f)odeSysF(eta, f, m0_in, n0_in, M_in, phi_in, fluid_properties),...
                                    @(fa, fb)bcF(fa, fb, alpha_in), ic, options);
    
                                sol = deval(sol, 0); % deval(eta, 0) for solution at eta = 0
                                %%%% deval(sol, eta) for solution at eta = 0:grid_size:max_eta, need this for profiles and streamlines
                                sol = sol';
    
                                % res(:,:,i) = sol; % uncomment for full result
                                %%%% set 'res' as output argument
    
                                f = sol(:,1);
                                df = sol(:,2);
                                d2f = sol(:,3);
                                g = sol(:,4);
                                dg = sol(:,5);
                                theta = sol(:,6);
                                dtheta = sol(:,7);
    
    
                                %%% for training data %%%%%%%%%%%%%%%%%%%%%%%
                                [count critAlpha_p M_in m0_in n0_in phi_in alpha_in]
                                params = [params; M_in m0_in n0_in phi_in alpha_in] ;
                                d2f0 = [d2f0; d2f];
                                dg0 = [dg0; dg];
                                dtheta0 = [dtheta0; dtheta];
                                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                end
                                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
                                count = count + 1; % proceed to next column
                            end
                        %end
                    end
                end
            end
        end % parameter variation loop ends
    
        %count = i+1; % set to the first column in new row
        i = i+1; % next row for next base fluid
    end % base fluid loop ends
end


function [df] = odeSysF(eta, f, m0, n0, M, phi, fluid_properties)    
    F = f(1); dF = f(2); d2F = f(3);
    G = f(4); dG = f(5); 
    T = f(6); dT= f(7);
    

    [B1, B2, B3, B4, B5,  Pr] = hnf_thermoPhysRatios(phi, fluid_properties);
    df = [dF
          d2F
          B1*B2*exp(-m0*T)*(dF^2 - F*d2F - 1 -(B5/B2)*M*(1-dF)) - m0*dT*d2F
          dG
          B1*B2*exp(-m0*T)*(dF*G - F*dG + (B5/B2)*M*G) - m0*dT*dG
          dT
          (Pr*B3*exp(-n0*T)/B4)*(-F)*dT - n0*(dT^2)];
end

function bc = bcF(fa, fb, alpha)
    bc = [fa(1)
          fa(2) - alpha
          fa(4) - 1
          fa(6) - 1
          fb(2) - 1
          fb(4)
          fb(6)];   
end

function [B1, B2, B3, B4, B5, Pr] = hnf_thermoPhysRatios(phi, fluid_properties)
    % 1: Fe3O4           2: GN
    rho_f = fluid_properties(1); Cp_f = fluid_properties(2); mu_f = fluid_properties(3);
    kappa_f = fluid_properties(4); sigma_f = fluid_properties(5); Pr = fluid_properties(6);

    phi_1 = phi; phi_2 = phi;
    rho_1 = 5180; rho_2 = 2250;
    Cp_1 = 670; Cp_2 = 2100;
    rhoCp_f = rho_f*Cp_f; rhoCp_1 = rho_1*Cp_1; rhoCp_2 = rho_2*Cp_2;
    s1 = 50e-9; s2 = 50e-9;
    kappa_1 = 9.7; kappa_2 = 2500; 
    sigma_1 = 25000; sigma_2 = 10^7;

    kappa_bf = kappa_f*(kappa_1 + (s1-1)*kappa_f - (s1-1)*phi_1*(kappa_f - kappa_1))/...
                    (kappa_1 + (s1-1)*kappa_f  + phi_1*(kappa_f - kappa_1));
    kappa_hnf = kappa_bf*(kappa_2+ (s2-1)*kappa_bf - (s2-1)*phi_2*(kappa_bf - kappa_2))/...
                    (kappa_2 + (s2-1)*kappa_bf  + phi_2*(kappa_bf - kappa_2));

    sigma_bf = sigma_f*(sigma_1 + 2*sigma_f + 2*phi_1*(sigma_1-sigma_f))/...
                    (sigma_1 + 2*sigma_f - phi_1*(sigma_1 - sigma_f));
    sigma_hnf = sigma_bf*(sigma_2 + 2*sigma_bf + 2*phi_2*(sigma_2-sigma_bf))/...
                    (sigma_2 + 2*sigma_bf - phi_2*(sigma_2 - sigma_bf));
                
    mu_hnf = mu_f/(((1-phi_1)^2.5)*((1-phi_2)^2.5));
    rho_hnf = (  (1-phi_2)*(  (1-phi_1)*rho_f + phi_1*rho_1 )  ) + phi_2*rho_2;
    rhoCp_hnf = (  (1-phi_2)*(  (1-phi_1)*rhoCp_f + phi_1*rhoCp_1  )  ) + phi_2*rhoCp_2;
    nu_hnf = mu_hnf/rho_hnf;
    nu_f = mu_f/rho_f;
    
    B1 = mu_f/mu_hnf;
    B2 = rho_hnf/rho_f;
    B3 = rhoCp_hnf/rhoCp_f;
    B4 = (kappa_hnf/kappa_bf)*(kappa_bf/kappa_f);
    B5 = (sigma_hnf/sigma_bf)*(sigma_bf/sigma_f);
    %Pr = nu_f*rhoCp_f/kappa_f;
end