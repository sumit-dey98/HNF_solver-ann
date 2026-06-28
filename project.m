clear; clf;
% problem parameters
M =  0.5;
m0 = -0.5;
n0 = -0.3;
phi1 = 0.1;
phi2 = 0.1;
alpha = -0.5 ;

% grid options
max_eta = 5; grid_size = 0.05; x_lim = 2;
eta = 0:grid_size:max_eta; Tinf = 0; Tw = 1;
c = 0.05; m = 101; % m --> isotherm levels

% hnfSysSolve(alpha, n0, m0, M, phi1, phi2, grid_size, max_eta)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% generate ANN training data
% [params, d2f0, dg0, dtheta0]= hnfSysSolve(alpha, n0, m0, M, phi, grid_size, max_eta);
% ANN_in = params;
% ANN_target = [d2f0 dg0 -dtheta0];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% plot alpha vs physical quantities
%%%% NOTE: set [d2f0, dg0, dtheta0] as output of 'hnfSysolve' %%%%
%%%% set a range of values for alpha, other parameters remain fixed %%%%
%
% [d2f0, dg0, dtheta0] = hnfSysSolve(alpha, n0, m0, M, phi, grid_size, max_eta);
% 
% figure(4)
% p1 = plot(alpha, d2f0,'-r');
% legend({"Fe_3O_4- GN + Water","Fe_3O_4- GN + EO"})
% p1.LineWidth = 1; 
% xlabel('$\alpha$', Interpreter='latex');
% ylabel('$f''''(0)$', Interpreter='latex')
% hold on
% 
% figure(5)
% p2 = plot(alpha, dg0,'-r');
% legend({"Fe_3O_4- GN + Water","Fe_3O_4- GN + EO"})
% p2.LineWidth = 1;
% xlabel('$\alpha$', Interpreter='latex');
% ylabel('$g''(0)$', Interpreter='latex')
% hold on
% 
% figure(6)
% p3 = plot(alpha, -dtheta0,'-r');
% legend({"Fe_3O_4- GN + Water","Fe_3O_4- GN + EO"}, 'Location', 'Northwest')
% p3.LineWidth = 1;
% xlabel('$\alpha$', Interpreter='latex');
% ylabel('$-\theta''(0)$', Interpreter='latex')
% hold on
% ylim([-0.5 max(max(-dtheta0))+0.5])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% plot streamlines
%%%% NOTE: set [res] as output of 'hnfSysolve' %%%%
%%%% set 3 different values for one parameter, other parameters remain fixed %%%%

% solution
% res_hnf = hnfSysSolve(alpha, n0, m0, M, phi, grid_size, max_eta); 
% res_hnf1 = res_hnf(:,:,1); res_hnf2 = res_hnf(:,:,2);
% n = length(res_hnf);
% 
% % create grid
% [x, ETA] = meshgrid(linspace(-x_lim, x_lim, n), eta);
% c = c*ones(n); 
% 
% %%%% base fluid water %%%%
% % calculate stream function over the grid 
% f1 = res_hnf1(:,1); g1 = res_hnf1(:,4);
% g_int1 = cumtrapz(g1);
% psi1 = x.*f1 + alpha.*c.*g_int1; % stream function
% 
% figure(7)
% title_str = "c = " + num2str(c(1,1)) + ", \alpha = " + num2str(alpha);
% % streamlines for selected psi (given in v1)
% m = 46; % no. of levels
% v1 = [0 linspace(floor(min(min(psi1)))+0.1,ceil(max(max(psi1)))-0.1, m)];
% [C1, h1] = contourf(x, ETA, psi1, v1);
% title(title_str)
% h1.LineStyle = "-"; h1.LineWidth = 0.75; h1.FaceAlpha = 0; h1.EdgeColor = "k"; h1.EdgeAlpha = 0.5;
% hold on
% 
% % filled contour with m levels, no lines
% v2 = linspace(floor(min(min(psi1)))+0.1,ceil(max(max(psi1)))-0.1, m);
% [C2, h2] = contourf(x, ETA, psi1, v2, LineStyle="none");
% clabel(C2, h2, v2); xlabel('x'); ylabel('$\eta$', Interpreter='latex'); 
% clim([floor(min(min(psi1))) ceil(max(max(psi1)))])
% colormap("jet") % colormap 'jet'/'parula'/'hsv'
% axis tight
% %%%% title("Fe_3O_4 - GN / Water")
% colorbar
% uistack(h1, "top")
% 
% 
% %%%% base fluid EO %%%%
% % calculate stream function over the grid 
% f2 = res_hnf2(:,1); g2 = res_hnf2(:,4);
% g_int2 = cumtrapz(g2); 
% psi2 = x.*f2 + alpha.*c.*g_int2; % stream function
% 
% figure(8)
% % streamlines for selected psi (given in v3)
% v3 = [0 linspace(floor(min(min(psi2)))+0.1,ceil(max(max(psi2)))-0.1, m)];
% [C3, h3] = contourf(x, ETA, psi2, v3);
% h3.LineStyle = "-"; h3.LineWidth = 0.75; h3.FaceAlpha = 0; h3.EdgeColor = "k"; h3.EdgeAlpha = 0.5;
% title(title_str)
% hold on
% 
% % filled contour with m levels, no lines
% v4 = linspace(floor(min(min(psi2)))+0.1,ceil(max(max(psi2)))-0.1, m);
% [C4, h4] = contourf(x, ETA, psi2, v4, LineStyle="none");
% clabel(C4, h4, v4); xlabel('x'); ylabel('$\eta$', Interpreter='latex'); 
% clim([floor(min(min(psi2))) ceil(max(max(psi2)))])
% colormap("jet") % colormap 'jet'/'parula'/'hsv'
% axis tight
% %%%% title("Fe_3O_4- GN/EG")
% colorbar
% uistack(h3, "top")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% plot isotherms
%%%% NOTE: set [res] as output of 'hnfSysolve' %%%%
%%%% set 3 different values for one parameter, other parameters remain fixed %%%%

% solution
res_hnf = hnfSysSolve(alpha, n0, m0, M, phi1, phi2, grid_size, max_eta); 
res_hnf1 = res_hnf(:,:,1); res_hnf2 = res_hnf(:,:,2);
n = length(res_hnf);

% create grid
[x, ETA] = meshgrid(linspace(-x_lim, x_lim, n), eta);
c = c*ones(n);
T_inf = Tinf*ones(n);
T_w = Tw*(x-c).^2;

%%%% base fluid water %%%%
% calculate stream function over the grid %%%% base fluid water %%%%
theta1 = res_hnf1(:,6); 
T1 = (T_w - T_inf).*theta1 + T_inf; % temperature

figure(11)
title_str =  " \alpha = " + num2str(alpha) + ", \DeltaT = " + num2str(Tw - Tinf) + "K" ;
v1 = linspace(Tinf, Tw, m);
[C1, h1] = contourf(x, ETA, T1, v1); 
h1.LineWidth = 0.8; h1.LineStyle = "none";
colormap jet
colorbar
ylim([0 2])
xlabel('x'); ylabel('$\eta$', Interpreter='latex'); 
title(title_str);


%%%% base fluid EO %%%%
theta2 = res_hnf2(:,6); 
T2 = (T_w - T_inf).*theta2 + T_inf; % temperature

figure(12)
title_str =  " \alpha = " + num2str(alpha) + ", \DeltaT = " + num2str(Tw - Tinf) + "K" ;
v2 = linspace(Tinf, Tw, m);
[C2, h2] = contourf(x, ETA, T2, v2); 
h2.LineWidth = 1; h2.LineStyle = "none";
colormap jet
colorbar
ylim([0 2])
xlabel('x'); ylabel('$\eta$', Interpreter='latex'); 
title(title_str);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [res]= hnfSysSolve(alpha, n0, m0, M, phi1, phi2, grid_size, max_eta)
    
    eta = 0:grid_size:max_eta;
    
    ic = bvpinit(eta, [0 0 0 0 0 0 0]); % iniitial guess for 1st (steady) solution
    options = bvpset('RelTol',1e-5);
    
    % n = input("number of variations: \n");
    % m0 = input("Enter the variable viscosity parameter: \n");
    % n0 = input("Enter the variable thermal conductivity parameter: \n");
    % M = input("Enter the magnetic parameter: \n");
    % alpha = input("Enter the stretching/shrinking parameter: \n");
    % phi = input("Enter the volume fraction: \n");
    
    % disp("cols 1 through 7 are f, f', f'', g, g', theta, theta' respectively.");
    
    n = max([length(phi1), length(phi2), length(alpha), length(n0), length(m0), length(M)]);
    c = lines;
    Linestyle = {"-","-","-","-.","-.","-."};
    Linewidth = [ones(1, n)*0.9 ones(1,n)*1];
    
    
    % [ rho_f, Cp_f, mu_f, kappa_f, sigma_f];
    fluid_water = [997.1 4179 0.000891 0.613 0.05 6.3];
    % fluid_EG = [1111 2428 0.0161 0.249 0.000107];
    % fluid_kerosene = [783 2090 0.00164 0.145 50e-12]; % https://www.sciencedirect.com/science/article/pii/S2214157X21004202
    fluid_EO = [ 884 1910 0.026576 0.144 2.1e-12 30]; %https://www.degruyter.com/document/doi/10.1515/ntrev-2022-0486/html
    count = 1; i = 1;
    res = cat(3, ones(length(eta), 7), ones(length(eta), 7)); % uncomment for full result
    % set 'res' as output argument
    
    % params = [];  % for training data generation
    % d2f0 = []; dg0 = []; dtheta0 = [];
    for fluid_properties = [fluid_water; fluid_EO]' % loop for base fluids
        if i == 1
            disp('Solving for water')
        elseif i == 2
            disp('Solving for EG')
        end
        % parameter variation loop
        for M_in = M
            for m0_in = m0
                for n0_in = n0
                    for phi_in1 = phi1
                        for phi_in2 = phi2
                            for alpha_in = alpha
    
                                %%%% for training data %%%%%%%%%%%%%%%%%%%%%%%%
                                % critAlpha_p = critAlphaModel([M_in m0_in n0_in phi_in]);
                                % 
                                % 
                                % if alpha_in > critAlpha_p(i) + 0.075
                                sol = bvp4c(@(eta, f)odeSysF(eta, f, m0_in, n0_in, M_in, phi_in1, phi_in2, fluid_properties),...
                                    @(fa, fb)bcF(fa, fb, alpha_in), ic, options);
    
                                sol = deval(sol, eta); % deval(eta, 0) for solution at eta = 0
                                %%%% deval(sol, eta) for solution at eta = 0:grid_size:max_eta, need this for profiles and streamlines
                                sol = sol';
    
                                res(:,:,i) = sol; % uncomment for full result
                                %%%% set 'res' as output argument
    
                                f = sol(:,1);
                                df = sol(:,2);
                                d2f = sol(:,3);
                                g = sol(:,4);
                                dg = sol(:,5);
                                theta = sol(:,6);
                                dtheta = sol(:,7);
    
    
                                %%% for training data %%%%%%%%%%%%%%%%%%%%%%%
                                % [count critAlpha_p M_in m0_in n0_in phi_in alpha_in]
                                % params = [params; M_in m0_in n0_in phi_in alpha_in] ;
                                % d2f0 = [d2f0; d2f];
                                % dg0 = [dg0; dg];
                                % dtheta0 = [dtheta0; dtheta];
                                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                % end
                                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
                                % c = [ 0.7031, 0, 0; 1, 0.5156, 0; 0, 0.1328,
                                % 1; 0.3125, 1, 0.6875  ]; % RGB triplets
    
                                %%%%%%%%%%%%%%%%%%%%%% velocity and temp profiles %%%%%%%%%%%%%%%%%%%%%%
                                % figure(1)
                                % p1 = plot(eta, df); ylim([alpha_in-0.1 1]); xlim([0 4])
                                % 
                                % legend({"Fe_3O_4- GN+Water", "", "", "Fe_3O_4- GN+EO"},Location = "Southeast" , FontSize=10)
                                % 
                                % if count <= n
                                %     p1.Color = c(count, :) ;
                                % else
                                %     p1.Color = c(count-n, :) ;
                                % end
                                % p1.LineStyle = Linestyle(count) ;
                                % p1.LineWidth = 1.2 ;
                                % hold on
                                % xlabel('$\eta$', Interpreter='latex', FontWeight='bold', FontSmoothing='on');
                                % ylabel('$f''(\eta)$',Interpreter='latex', FontWeight='bold', FontSmoothing='on');
                                % %title(strcat("$m_0 = $",num2str(m0),"$, n_0 = $", num2str(n0), "$, M = $", num2str(M), "$, \alpha = $",...
                                % % num2str(alpha)), Interpreter='latex', FontWeight='bold',FontSmoothing='on')
                                % %fontsize(12,'points')
                                % grid off
                                % 
                                % 
                                % figure(2)
                                % p2 = plot(eta, g); ylim([0 1]); xlim([0 4])
                                % legend({"Fe_3O_4- GN+Water", "", "", "Fe_3O_4- GN+EO"}, FontSize=10)
                                % if count <= n
                                %     p2.Color = c(count, :) ;
                                % else
                                %     p2.Color = c(count-n, :) ;
                                % end
                                % p2.LineStyle = Linestyle(count) ;
                                % p2.LineWidth = 1.2 ;
                                % hold on
                                % 
                                % xlabel('$\eta$', Interpreter='latex', FontWeight='bold', FontSmoothing='on');
                                % ylabel('$g(\eta)$',Interpreter='latex', FontWeight='bold', FontSmoothing='on');
                                % grid off
                                % 
                                % 
                                % figure(3)
                                % p3 = plot(eta, theta); ylim([0 1]); xlim([0 3])
                                % legend({"Fe_3O_4- GN+Water", "", "", "Fe_3O_4 - GN+EO"}, FontSize=10)
                                % 
                                % if count <= n
                                %     p3.Color = c(count, :) ;
                                % else
                                %     p3.Color = c(count-n, :) ;
                                % end
                                % p3.LineStyle = Linestyle(count) ;
                                % p3.LineWidth = 1.2 ;
                                % hold on
                                % 
                                % xlabel('$\eta$', Interpreter='latex', FontWeight='bold', FontSmoothing='on');
                                % ylabel('$\theta(\eta)$',Interpreter='latex', FontWeight='bold', FontSmoothing='on');
                                % grid off
                                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
                                count = count + 1; % proceed to next column
                            end
                        end
                    end
                end
            end
        end % parameter variation loop ends
    
        %count = i+1; % set to the first column in new row
        i = i+1; % next row for next base fluid
    end % base fluid loop ends
end


function [df] = odeSysF(eta, f, m0, n0, M, phi1, phi2, fluid_properties)    
    F = f(1); dF = f(2); d2F = f(3);
    G = f(4); dG = f(5); 
    T = f(6); dT= f(7);
    

    [B1, B2, B3, B4, B5,  Pr] = hnf_thermoPhysRatios(phi1, phi2, fluid_properties);
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

function [B1, B2, B3, B4, B5, Pr] = hnf_thermoPhysRatios(phi_1, phi_2, fluid_properties)
    % 1: Fe3O4           2: GN
    rho_f = fluid_properties(1); Cp_f = fluid_properties(2); mu_f = fluid_properties(3);
    kappa_f = fluid_properties(4); sigma_f = fluid_properties(5); Pr = fluid_properties(6);

    %phi_1 = phi; phi_2 = phi;
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
