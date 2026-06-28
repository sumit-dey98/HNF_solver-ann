
%% create ANN data
d2f0_water_ANN = []; d2f0_EO_ANN = [];
dg0_water_ANN = []; dg0_EO_ANN = [];
dtheta0_water_ANN = []; dtheta0_EO_ANN = [];
%%
var = 4; % var=1 --> m0, var=2 --> n0, var=3 --> phi
M = 2; m0 = -0.5; n0 = -0.3; phi = 0.1;
n = length(alpha2_EO');
params = [M*ones(n, 1) m0*ones(n, 1) n0*ones(n,1) phi*ones(n, 1) alpha2_EO'];
res = ANN_model(params);

% d2f03_water_ANN = [res(:, 6)]; 
d2f02_EO_ANN = [res(:, 7)];
% dg03_water_ANN = [res(:, 8)]; 
dg02_EO_ANN = [res(:, 9)];
% dtheta03_water_ANN = [-res(:, 10)]; 
dtheta02_EO_ANN = [-res(:, 11)];

%% plot
c = lines;

figure(1)
p1 = plot(alpha, d2f0_water(:, 1), alpha, d2f0_water(:, 2), alpha, d2f0_water(:, 3)); hold on
p1(1).LineStyle = '-'; p1(2).LineStyle = '-'; p1(3).LineStyle = "-";
p1(1).Color = c(1,:); p1(2).Color = c(2,:); p1(3).Color = c(4,:);
p1(1).LineWidth = 1; p1(2).LineWidth = 1; p1(3).LineWidth = 1;

p2 = plot(alpha, d2f0_water_ANN(:, 1), alpha, d2f0_water_ANN(:, 2), alpha, d2f0_water_ANN(:, 3));
p2(1).LineStyle = '--'; p2(2).LineStyle = '--'; p2(3).LineStyle = "--";
p2(1).Color = c(1,:); p2(2).Color = c(2,:); p2(3).Color = c(4,:);
p2(1).LineWidth = 1; p2(2).LineWidth = 1; p2(3).LineWidth = 1;


p3 = plot(alpha, d2f0_EO(:, 1), alpha, d2f0_EO(:, 2), alpha, d2f0_EO(:, 3));
p3(1).LineStyle = '-.'; p3(2).LineStyle = '-.'; p3(3).LineStyle = "-.";
p3(1).Color = c(1,:); p3(2).Color = c(2,:); p3(3).Color = c(4,:);
p3(1).LineWidth = 1; p3(2).LineWidth = 1; p3(3).LineWidth = 1;

p4 = plot(alpha, d2f0_EO_ANN(:, 1), alpha, d2f0_EO_ANN(:, 2), alpha, d2f0_EO_ANN(:, 3));
p4(1).LineStyle = ':'; p4(2).LineStyle = ':'; p4(3).LineStyle = ":";
p4(1).Color = c(1,:); p4(2).Color = c(2,:); p4(3).Color = c(4,:);
p4(1).LineWidth = 1.4; p4(2).LineWidth = 1.4; p4(3).LineWidth = 1.4; hold off

% p5 = plot(1, 1, 1, 1, 1, 1);
% p5(1).LineStyle = '-'; p5(2).LineStyle = '-'; p5(3).LineStyle = "-";
% p5(1).Color = c(1,:); p5(2).Color = c(2,:); p5(3).Color = c(4,:);
% p5(1).LineWidth = 1; p5(2).LineWidth = 1; p5(3).LineWidth = 1;
% 
% p6 = plot(1, sin(1)); p6.LineStyle="none";
% p7 = plot(1, sin(1)); p7.LineStyle="none";
% p8 = plot(1, sin(1)); p8.LineStyle="none";
% p9 = plot(1, sin(1)); p9.LineStyle="none"; hold off
% if var == 1 %m0
%     legend([p1(1) p2(1) p3(1) p4(1) p6 p7 p8 p9 p5(1) p5(2) p5(3)],...
%         {'Fe_3O_4- GN+Water(Numerical)','Fe_3O_4- GN+Water(ANN)','Fe_3O_4- GN+EO(Numerical)','Fe_3O_4- GN+EO(ANN)',...
%         '','','','','m_0 = -0.1','m_0 = -0.5','m_0 = -1'}, Location="eastoutside")
% elseif var ==2 %n0
%     legend([p1(1) p2(1) p3(1) p4(1) p6 p7 p8 p9 p5(1) p5(2) p5(3)],...
%         {'Fe_3O_4- GN+Water(Numerical)','Fe_3O_4- GN+Water(ANN)','Fe_3O_4- GN+EO(Numerical)','Fe_3O_4- GN+EO(ANN)',...
%         '','','','','n_0 = -0.1','n_0 = -0.3','n_0 = -0.7'}, Location="eastoutside")
% elseif var == 3 %phi
%     legend([p1(1) p2(1) p3(1) p4(1) p6 p7 p8 p9 p5(1) p5(2) p5(3)],...
%         {'Fe_3O_4- GN+Water(Numerical)','Fe_3O_4- GN+Water(ANN)','Fe_3O_4- GN+EO(Numerical)','Fe_3O_4- GN+EO(ANN)',...
%         '','','','','\phi_1 = \phi_2 = 0.05','\phi_1 = \phi_2 = 0.1','\phi_1 = \phi_2 = 0.2'}, Location="eastoutside")
% end

if var == 1 %m0
    legend([p1(1) p2(1) p3(1) p4(1) p1(2) p2(2) p3(2) p4(2) p1(3) p2(3) p3(3) p4(3)], ...
            {'Fe_3O_4- GN+Water(Numerical), m_0 = -0.1','Fe_3O_4- GN+Water(ANN), m_0 = -0.1','Fe_3O_4- GN+EO(Numerical), m_0 = -0.1','Fe_3O_4- GN+EO(ANN), m_0 = -0.1',...
            'Fe_3O_4- GN+Water(Numerical), m_0 = -0.5','Fe_3O_4- GN+Water(ANN), m_0 = -0.5','Fe_3O_4- GN+EO(Numerical), m_0 = -0.5','Fe_3O_4- GN+EO(ANN), m_0 = -0.5',...
            'Fe_3O_4- GN+Water(Numerical), m_0 = -1','Fe_3O_4- GN+Water(ANN), m_0 = -1','Fe_3O_4- GN+EO(Numerical), m_0 = -1','Fe_3O_4- GN+EO(ANN), m_0 = -1'}, Location="eastoutside", NumColumns=1)
elseif var ==2 %n0
    legend([p1(1) p2(1) p3(1) p4(1) p1(2) p2(2) p3(2) p4(2) p1(3) p2(3) p3(3) p4(3)], ...
            {'Fe_3O_4- GN+Water(Numerical), n_0 = -0.1','Fe_3O_4- GN+Water(ANN), n_0 = -0.1','Fe_3O_4- GN+EO(Numerical), n_0 = -0.1','Fe_3O_4- GN+EO(ANN), n_0 = -0.1',...
            'Fe_3O_4- GN+Water(Numerical), n_0 = -0.3','Fe_3O_4- GN+Water(ANN), n_0 = -0.3','Fe_3O_4- GN+EO(Numerical), n_0 = -0.3','Fe_3O_4- GN+EO(ANN), n_0 = -0.3',...
            'Fe_3O_4- GN+Water(Numerical), n_0 = -0.7','Fe_3O_4- GN+Water(ANN), n_0 = -0.7','Fe_3O_4- GN+EO(Numerical), n_0 = -0.7','Fe_3O_4- GN+EO(ANN), n_0 = -0.7'}, Location="eastoutside", NumColumns=1)
elseif var == 3 %phi
    legend([p1(1) p2(1) p3(1) p4(1) p1(2) p2(2) p3(2) p4(2) p1(3) p2(3) p3(3) p4(3)], ...
            {'Fe_3O_4- GN+Water(Numerical), \phi = 0.05','Fe_3O_4- GN+Water(ANN), \phi = 0.05','Fe_3O_4- GN+EO(Numerical), \phi = 0.05','Fe_3O_4- GN+EO(ANN), \phi = 0.05',...
            'Fe_3O_4- GN+Water(Numerical), \phi = 0.1','Fe_3O_4- GN+Water(ANN), \phi = 0.1','Fe_3O_4- GN+EO(Numerical), \phi = 0.1','Fe_3O_4- GN+EO(ANN), \phi = 0.1',...
            'Fe_3O_4- GN+Water(Numerical), \phi = 0.2','Fe_3O_4- GN+Water(ANN), \phi = 0.2','Fe_3O_4- GN+EO(Numerical), \phi = 0.2','Fe_3O_4- GN+EO(ANN), \phi = 0.2'}, Location="eastoutside", NumColumns=1)
elseif var == 4 %M
    legend([p1(1) p2(1) p3(1) p4(1) p1(2) p2(2) p3(2) p4(2) p1(3) p2(3) p3(3) p4(3)], ...
            {'Fe_3O_4- GN+Water(Numerical), M = 0.5','Fe_3O_4- GN+Water(ANN), M = 0.5','Fe_3O_4- GN+EO(Numerical), M = 0.5','Fe_3O_4- GN+EO(ANN), M = 0.5',...
            'Fe_3O_4- GN+Water(Numerical), M = 1','Fe_3O_4- GN+Water(ANN), M = 1','Fe_3O_4- GN+EO(Numerical), M = 1','Fe_3O_4- GN+EO(ANN), M = 1',...
            'Fe_3O_4- GN+Water(Numerical), M = 2','Fe_3O_4- GN+Water(ANN), M = 2','Fe_3O_4- GN+EO(Numerical), M = 2','Fe_3O_4- GN+EO(ANN), M = 2'}, Location="eastoutside", NumColumns=1)
end

legend(Box="on")
xlabel('$\alpha$', Interpreter='latex', FontSmoothing='on');
ylabel('$f''''(0)$', Interpreter='latex', FontSmoothing='on');
xlim([min(alpha)  max(alpha)])


figure(2)
p10 = plot(alpha, dg0_water(:, 1), alpha, dg0_water(:, 2), alpha, dg0_water(:, 3)); hold on
p10(1).LineStyle = '-'; p10(2).LineStyle = '-'; p10(3).LineStyle = "-";
p10(1).Color = c(1,:); p10(2).Color = c(2,:); p10(3).Color = c(4,:);
p10(1).LineWidth = 1; p10(2).LineWidth = 1; p10(3).LineWidth = 1;

p11 = plot(alpha, dg0_water_ANN(:, 1), alpha, dg0_water_ANN(:, 2), alpha, dg0_water_ANN(:, 3));
p11(1).LineStyle = '--'; p11(2).LineStyle = '--'; p11(3).LineStyle = "--";
p11(1).Color = c(1,:); p11(2).Color = c(2,:); p11(3).Color = c(4,:);
p11(1).LineWidth = 1; p11(2).LineWidth = 1; p11(3).LineWidth = 1;

p12 = plot(alpha, dg0_EO(:, 1), alpha, dg0_EO(:, 2), alpha, dg0_EO(:, 3));
p12(1).LineStyle = '-.'; p12(2).LineStyle = '-.'; p12(3).LineStyle = "-.";
p12(1).Color = c(1,:); p12(2).Color = c(2,:); p12(3).Color = c(4,:);
p12(1).LineWidth = 1; p12(2).LineWidth = 1; p12(3).LineWidth = 1;

p13 = plot(alpha, dg0_EO_ANN(:, 1), alpha, dg0_EO_ANN(:, 2), alpha, dg0_EO_ANN(:, 3));
p13(1).LineStyle = ':'; p13(2).LineStyle = ':'; p13(3).LineStyle = ":";
p13(1).Color = c(1,:); p13(2).Color = c(2,:); p13(3).Color = c(4,:);
p13(1).LineWidth = 1.4; p13(2).LineWidth = 1.4; p13(3).LineWidth = 1.4; hold off

% p14 = plot(1, 1, 1, 1, 1, 1);
% p14(1).LineStyle = '-'; p14(2).LineStyle = '-'; p14(3).LineStyle = "-";
% p14(1).Color = c(1,:); p14(2).Color = c(2,:); p14(3).Color = c(4,:);
% p14(1).LineWidth = 1; p14(2).LineWidth = 1; p14(3).LineWidth = 1;
% 
% p15 = plot(1, sin(1)); p15.LineStyle="none";
% p16 = plot(1, sin(1)); p16.LineStyle="none";
% p17 = plot(1, sin(1)); p17.LineStyle="none";
% p18 = plot(1, sin(1)); p18.LineStyle="none"; hold off
% if var == 1 %m0
%     legend([p10(1) p11(1) p12(1) p13(1) p15 p16 p17 p18 p14(1) p14(2) p14(3)],...
%         {'Fe_3O_4- GN+Water(Numerical)','Fe_3O_4- GN+Water(ANN)','Fe_3O_4- GN+EO(Numerical)','Fe_3O_4- GN+EO(ANN)',...
%         '','','','','m_0 = -0.1','m_0 = -0.5','m_0 = -1'}, Location="eastoutside")
% elseif var == 2
%     legend([p10(1) p11(1) p12(1) p13(1) p15 p16 p17 p18 p14(1) p14(2) p14(3)],...
%         {'Fe_3O_4- GN+Water(Numerical)','Fe_3O_4- GN+Water(ANN)','Fe_3O_4- GN+EO(Numerical)','Fe_3O_4- GN+EO(ANN)',...
%         '','','','','n_0 = -0.1','n_0 = -0.3','n_0 = -0.7'}, Location="eastoutside")
% elseif var == 3 %phi
%     legend([p10(1) p11(1) p12(1) p13(1) p15 p16 p17 p18 p14(1) p14(2) p14(3)],...
%         {'Fe_3O_4- GN+Water(Numerical)','Fe_3O_4- GN+Water(ANN)','Fe_3O_4- GN+EO(Numerical)','Fe_3O_4- GN+EO(ANN)',...
%         '','','','','\phi_1 = \phi_2 = 0.05','\phi_1 = \phi_2 = 0.1','\phi_1 = \phi_2 = 0.2'}, Location="eastoutside")
% end

if var == 1 %m0
    legend([p10(1) p11(1) p12(1) p13(1) p10(2) p11(2) p12(2) p13(2) p10(3) p11(3) p12(3) p13(3)], ...
            {'Fe_3O_4- GN+Water(Numerical), m_0 = -0.1','Fe_3O_4- GN+Water(ANN), m_0 = -0.1','Fe_3O_4- GN+EO(Numerical), m_0 = -0.1','Fe_3O_4- GN+EO(ANN), m_0 = -0.1',...
            'Fe_3O_4- GN+Water(Numerical), m_0 = -0.5','Fe_3O_4- GN+Water(ANN), m_0 = -0.5','Fe_3O_4- GN+EO(Numerical), m_0 = -0.5','Fe_3O_4- GN+EO(ANN), m_0 = -0.5',...
            'Fe_3O_4- GN+Water(Numerical), m_0 = -1','Fe_3O_4- GN+Water(ANN), m_0 = -1','Fe_3O_4- GN+EO(Numerical), m_0 = -1','Fe_3O_4- GN+EO(ANN), m_0 = -1'}, Location="eastoutside", NumColumns=1)
elseif var ==2 %n0
    legend([p10(1) p11(1) p12(1) p13(1) p10(2) p11(2) p12(2) p13(2) p10(3) p11(3) p12(3) p13(3)], ...
            {'Fe_3O_4- GN+Water(Numerical), n_0 = -0.1','Fe_3O_4- GN+Water(ANN), n_0 = -0.1','Fe_3O_4- GN+EO(Numerical), n_0 = -0.1','Fe_3O_4- GN+EO(ANN), n_0 = -0.1',...
            'Fe_3O_4- GN+Water(Numerical), n_0 = -0.3','Fe_3O_4- GN+Water(ANN), n_0 = -0.3','Fe_3O_4- GN+EO(Numerical), n_0 = -0.3','Fe_3O_4- GN+EO(ANN), n_0 = -0.3',...
            'Fe_3O_4- GN+Water(Numerical), n_0 = -0.7','Fe_3O_4- GN+Water(ANN), n_0 = -0.7','Fe_3O_4- GN+EO(Numerical), n_0 = -0.7','Fe_3O_4- GN+EO(ANN), n_0 = -0.7'}, Location="eastoutside", NumColumns=1)
elseif var == 3 %phi
    legend([p10(1) p11(1) p12(1) p13(1) p10(2) p11(2) p12(2) p13(2) p10(3) p11(3) p12(3) p13(3)], ...
            {'Fe_3O_4- GN+Water(Numerical), \phi = 0.05','Fe_3O_4- GN+Water(ANN), \phi = 0.05','Fe_3O_4- GN+EO(Numerical), \phi = 0.05','Fe_3O_4- GN+EO(ANN), \phi = 0.05',...
            'Fe_3O_4- GN+Water(Numerical), \phi = 0.1','Fe_3O_4- GN+Water(ANN), \phi = 0.1','Fe_3O_4- GN+EO(Numerical), \phi = 0.1','Fe_3O_4- GN+EO(ANN), \phi = 0.1',...
            'Fe_3O_4- GN+Water(Numerical), \phi = 0.2','Fe_3O_4- GN+Water(ANN), \phi = 0.2','Fe_3O_4- GN+EO(Numerical), \phi = 0.2','Fe_3O_4- GN+EO(ANN), \phi = 0.2'}, Location="eastoutside", NumColumns=1)
elseif var == 4 %M
    legend([p1(1) p2(1) p3(1) p4(1) p1(2) p2(2) p3(2) p4(2) p1(3) p2(3) p3(3) p4(3)], ...
        {'Fe_3O_4- GN+Water(Numerical), M = 0.5','Fe_3O_4- GN+Water(ANN), M = 0.5','Fe_3O_4- GN+EO(Numerical), M = 0.5','Fe_3O_4- GN+EO(ANN), M = 0.5',...
        'Fe_3O_4- GN+Water(Numerical), M = 1','Fe_3O_4- GN+Water(ANN), M = 1','Fe_3O_4- GN+EO(Numerical), M = 1','Fe_3O_4- GN+EO(ANN), M = 1',...
        'Fe_3O_4- GN+Water(Numerical), M = 2','Fe_3O_4- GN+Water(ANN), M = 2','Fe_3O_4- GN+EO(Numerical), M = 2','Fe_3O_4- GN+EO(ANN), M = 2'}, Location="eastoutside", NumColumns=1)
end

legend(Box="on")
xlabel('$\alpha$', Interpreter='latex', FontSmoothing='on');
ylabel('$g''(0)$', Interpreter='latex', FontSmoothing='on');
xlim([min(alpha)  max(alpha)])

figure(3)
p19 = plot(alpha, -dtheta0_water(:, 1), alpha, -dtheta0_water(:, 2), alpha, -dtheta0_water(:, 3)); hold on
p19(1).LineStyle = '-'; p19(2).LineStyle = '-'; p19(3).LineStyle = "-";
p19(1).Color = c(1,:); p19(2).Color = c(2,:); p19(3).Color = c(4,:);
p19(1).LineWidth = 1; p19(2).LineWidth = 1; p19(3).LineWidth = 1;

p20 = plot(alpha, -dtheta0_water_ANN(:, 1), alpha, -dtheta0_water_ANN(:, 2), alpha, -dtheta0_water_ANN(:, 3)); hold on
p20(1).LineStyle = '--'; p20(2).LineStyle = '--'; p20(3).LineStyle = "--";
p20(1).Color = c(1,:); p20(2).Color = c(2,:); p20(3).Color = c(4,:);
p20(1).LineWidth = 1; p20(2).LineWidth = 1; p20(3).LineWidth = 1;

p21 = plot(alpha, -dtheta0_EO(:, 1), alpha, -dtheta0_EO(:, 2), alpha, -dtheta0_EO(:, 3));
p21(1).LineStyle = '-.'; p21(2).LineStyle = '-.'; p21(3).LineStyle = "-.";
p21(1).Color = c(1,:); p21(2).Color = c(2,:); p21(3).Color = c(4,:);
p21(1).LineWidth = 1; p21(2).LineWidth = 1; p21(3).LineWidth = 1;

p22 = plot(alpha, -dtheta0_EO_ANN(:, 1), alpha, -dtheta0_EO_ANN(:, 2), alpha, -dtheta0_EO_ANN(:, 3)); 
p22(1).LineStyle = ':'; p22(2).LineStyle = ':'; p22(3).LineStyle = ":";
p22(1).Color = c(1,:); p22(2).Color = c(2,:); p22(3).Color = c(4,:);
p22(1).LineWidth = 1.4; p22(2).LineWidth = 1.4; p22(3).LineWidth = 1.4; hold off

% p23 = plot(1, sin(1), 1, sin(1), 1, sin(1)); 
% p23(1).LineStyle = '-'; p23(2).LineStyle = '-'; p23(3).LineStyle = "-";
% p23(1).Color = c(1,:); p23(2).Color = c(2,:); p23(3).Color = c(4,:);
% p23(1).LineWidth = 1; p23(2).LineWidth = 1; p23(3).LineWidth = 1;
% 
% p24 = plot(1, sin(1)); p24.LineStyle="none";
% p25 = plot(1, sin(1)); p25.LineStyle="none";
% p26 = plot(1, sin(1)); p26.LineStyle="none";
% p27 = plot(1, sin(1)); p27.LineStyle="none"; hold off
% if var == 1 %m0
%     legend([p19(1) p20(1) p21(1) p22(1) p24 p25 p26 p27 p23(1) p23(2) p23(3)],...
%        {'Fe_3O_4- GN+Water(Numerical)','Fe_3O_4- GN+Water(ANN)','Fe_3O_4- GN+EO(Numerical)','Fe_3O_4- GN+EO(ANN)',...
%         '','','','','m_0 = -0.1','m_0 = -0.5','m_0 = -1'}, Location="eastoutside")
% elseif var ==2 %n0
%     legend([p19(1) p20(1) p21(1) p22(1) p24 p25 p26 p27 p23(1) p23(2) p23(3)],...
%         {'Fe_3O_4- GN+Water(Numerical)','Fe_3O_4- GN+Water(ANN)','Fe_3O_4- GN+EO(Numerical)','Fe_3O_4- GN+EO(ANN)',...
%         '','','','','n_0 = -0.1','n_0 = -0.3','n_0 = -0.7'}, Location="eastoutside")
% elseif var == 3 %phi
%     legend([p19(1) p20(1) p21(1) p22(1) p24 p25 p26 p27 p23(1) p23(2) p23(3)],...
%         {'Fe_3O_4- GN+Water(Numerical)','Fe_3O_4- GN+Water(ANN)','Fe_3O_4- GN+EO(Numerical)','Fe_3O_4- GN+EO(ANN)',...
%         '','','','','\phi_1 = \phi_2 = 0.05','\phi_1 = \phi_2 = 0.1','\phi_1 = \phi_2 = 0.2'}, Location="eastoutside")
% end

if var == 1 %m0
    legend([p19(1) p20(1) p21(1) p22(1) p19(2) p20(2) p21(2) p22(2) p19(3) p20(3) p21(3) p22(3)], ...
            {'Fe_3O_4- GN+Water(Numerical), m_0 = -0.1','Fe_3O_4- GN+Water(ANN), m_0 = -0.1','Fe_3O_4- GN+EO(Numerical), m_0 = -0.1','Fe_3O_4- GN+EO(ANN), m_0 = -0.1',...
            'Fe_3O_4- GN+Water(Numerical), m_0 = -0.5','Fe_3O_4- GN+Water(ANN), m_0 = -0.5','Fe_3O_4- GN+EO(Numerical), m_0 = -0.5','Fe_3O_4- GN+EO(ANN), m_0 = -0.5',...
            'Fe_3O_4- GN+Water(Numerical), m_0 = -1','Fe_3O_4- GN+Water(ANN), m_0 = -1','Fe_3O_4- GN+EO(Numerical), m_0 = -1','Fe_3O_4- GN+EO(ANN), m_0 = -1'}, Location="eastoutside", NumColumns=1)
elseif var ==2 %n0
    legend([p19(1) p20(1) p21(1) p22(1) p19(2) p20(2) p21(2) p22(2) p19(3) p20(3) p21(3) p22(3)], ...
            {'Fe_3O_4- GN+Water(Numerical), n_0 = -0.1','Fe_3O_4- GN+Water(ANN), n_0 = -0.1','Fe_3O_4- GN+EO(Numerical), n_0 = -0.1','Fe_3O_4- GN+EO(ANN), n_0 = -0.1',...
            'Fe_3O_4- GN+Water(Numerical), n_0 = -0.3','Fe_3O_4- GN+Water(ANN), n_0 = -0.3','Fe_3O_4- GN+EO(Numerical), n_0 = -0.3','Fe_3O_4- GN+EO(ANN), n_0 = -0.3',...
            'Fe_3O_4- GN+Water(Numerical), n_0 = -0.7','Fe_3O_4- GN+Water(ANN), n_0 = -0.7','Fe_3O_4- GN+EO(Numerical), n_0 = -0.7','Fe_3O_4- GN+EO(ANN), n_0 = -0.7'}, Location="eastoutside", NumColumns=1)
elseif var == 3 %phi
    legend([p19(1) p20(1) p21(1) p22(1) p19(2) p20(2) p21(2) p22(2) p19(3) p20(3) p21(3) p22(3)], ...
            {'Fe_3O_4- GN+Water(Numerical), \phi = 0.05','Fe_3O_4- GN+Water(ANN), \phi = 0.05','Fe_3O_4- GN+EO(Numerical), \phi = 0.05','Fe_3O_4- GN+EO(ANN), \phi = 0.05',...
            'Fe_3O_4- GN+Water(Numerical), \phi = 0.1','Fe_3O_4- GN+Water(ANN), \phi = 0.1','Fe_3O_4- GN+EO(Numerical), \phi = 0.1','Fe_3O_4- GN+EO(ANN), \phi = 0.1',...
            'Fe_3O_4- GN+Water(Numerical), \phi = 0.2','Fe_3O_4- GN+Water(ANN), \phi = 0.2','Fe_3O_4- GN+EO(Numerical), \phi = 0.2','Fe_3O_4- GN+EO(ANN), \phi = 0.2'}, Location="eastoutside", NumColumns=1)
elseif var == 4 %M
    legend([p1(1) p2(1) p3(1) p4(1) p1(2) p2(2) p3(2) p4(2) p1(3) p2(3) p3(3) p4(3)], ...
            {'Fe_3O_4- GN+Water(Numerical), M = 0.5','Fe_3O_4- GN+Water(ANN), M = 0.5','Fe_3O_4- GN+EO(Numerical), M = 0.5','Fe_3O_4- GN+EO(ANN), M = 0.5',...
            'Fe_3O_4- GN+Water(Numerical), M = 1','Fe_3O_4- GN+Water(ANN), M = 1','Fe_3O_4- GN+EO(Numerical), M = 1','Fe_3O_4- GN+EO(ANN), M = 1',...
            'Fe_3O_4- GN+Water(Numerical), M = 2','Fe_3O_4- GN+Water(ANN), M = 2','Fe_3O_4- GN+EO(Numerical), M = 2','Fe_3O_4- GN+EO(ANN), M = 2'}, Location="eastoutside", NumColumns=1)
end

legend(Box="on")
xlabel('$\alpha$', Interpreter='latex', FontSmoothing='on');
ylabel('$-\theta''(0)$', Interpreter='latex', FontSmoothing='on');
xlim([min(alpha)  max(alpha)])
ylim([0 12])