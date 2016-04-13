%GENETIC ALGORITHM
%OBJECTIVE IS TO MAXIMIZE FANTASY POINTS
%CONSTRAINT IS THE SALARY CAP ($60,000)
%
%
%EACH TEAM IS MADE UP OF 1 QB, 2 RBs, 3 WRs, 1 TE, 1 K, AND 1 DEF
%(NO REPEATS AT ANY POSITION)
%
%
for iiii = 1:1
tic
clear;
clc;
%
%
%===================INITIALIZING THE POPULATION SIZE=======================
N = 1000;                               %POPULATION SIZE    
G = 9;                                  %GENOME SIZE
mut = 0.05;                             %PROBABILITY OF MUTATION, 5%
GEN = 50;                               %NUMBER OF GENERATIONS
s = 5;                                  %TOURNAMENT SIZE
%QB MATRIX
QB = [1	23.04	10000 
2	22.86	10100 
3	22.26	8600 
4	21.13	9000 
5	20.77	7800 
6	18.96	7300 
7	18.69	8000 
8	18.93	8800 
9	18.77	7100 
10	18.49	7900 
11	17.97	6500 
12	17.56	7800 
13	17.41	6200 
14	17.41	7000 
15	16.55	8500 
16	15.99	7600 
17	15.59	5900 
18	14.61	8400 
19	13.82	6200 
20	13.66	6400 
21	13.41	6800 
22	12.69	7200 
23	9.76	8200 
24	9.79	6900 
25	8.25	5000 
26	2.65	5500 
27	1.06	6500 
28	0.84	5000 
29	0.87	5000 
30	0.82	5000 
31	0.76	5000 
32	0.71	5000];

%RB MATRIX
RB = [1	19.99	9600 
2	18.94	8700 
3	17.13	9000 
4	16.45	8200 
5	16.64	9400 
6	16.15	7300 
7	14.99	7700 
8	12.35	7800 
9	12.41	8500 
10	11.85	7200 
11	11.52	6700 
12	12.06	7000 
13	11.26	6800 
14	12.19	6600 
15	11.38	6500 
16	10.73	7200 
17	10.10	6200 
18	10.94	7500 
19	10.55	6300 
20	9.72	6300 
21	8.87	6900 
22	8.39	6700 
23	7.81	5200 
24	8.33	6000 
25	7.10	6400 
26	7.71	5700 
27	7.44	5400 
28	6.85	5900 
29	6.51	5300 
30	5.87	4800 
31	7.58	6100 
32	5.59	6000 
33	5.66	5800 
34	5.79	6300 
35	5.67	5700 
36	5.56	6200 
37	5.16	4800 
38	5.30	4700 
39	5.13	6400 
40	4.72	4800 
41	4.70	4800 
42	5.28	5200 
43	4.47	6900 
44	4.48	4700 
45	4.16	4800 
46	3.94	5100 
47	3.61	4800 
48	2.87	4500 
49	2.28	5300 
50	2.53	5000 
51	1.74	4800 
52	1.49	4800 
53	1.33	5500 
54	1.31	4600 
55	1.23	4900 
56	1.25	4600 
57	1.45	5100 
58	1.16	4600 
59	0.97	4900 
60	1.23	4800 
61	1.04	4500 
62	0.98	4500 
63	0.92	5400 
64	0.88	6500 
65	0.97	4600 
66	0.95	4700];

%WR MATRIX
WR = [1	19.20	9000 
2	16.89	9200 
3	14.66	8400 
4	14.90	8800 
5	13.64	8400 
6	12.82	7200 
7	12.53	8100 
8	12.30	6400 
9	11.97	8200 
10	11.63	6800 
11	11.52	7800 
12	12.06	6400 
13	11.33	6900 
14	11.44	7200 
15	10.61	6600 
16	11.96	6900 
17	11.32	6400 
18	11.75	6800 
19	11.21	6500 
20	11.26	6900 
21	11.20	6700 
22	10.82	6200 
23	10.28	6200 
24	10.51	6700 
25	9.48	6100 
26	10.39	6700 
27	10.62	6900 
28	9.92	7200 
29	9.95	6000 
30	9.20	6800 
31	9.05	5600 
32	9.52	6700 
33	8.97	6300 
34	9.12	6300 
35	9.72	6500 
36	8.43	4800 
37	9.08	6100 
38	8.40	6900 
39	8.15	6000 
40	7.63	6500 
41	7.70	5900 
42	7.33	4700 
43	7.54	5600 
44	6.67	5300 
45	6.94	6300 
46	6.35	5900 
47	6.31	4900 
48	5.98	6400 
49	5.26	5700 
50	5.19	6300 
51	5.00	5000 
52	4.99	6200 
53	5.30	5300 
54	4.47	4700 
55	4.10	5300 
56	4.46	6200 
57	4.59	5200 
58	4.42	4900 
59	3.68	5900 
60	3.29	4900 
61	3.42	5900 
62	3.29	4600 
63	3.16	4800 
64	3.14	5400 
65	2.79	4700 
66	3.18	4900 
67	2.77	4500 
68	2.67	4900 
69	2.35	4500 
70	2.42	4900 
71	2.09	4500 
72	2.07	4900 
73	1.89	4800 
74	2.00	4800 
75	1.80	4500 
76	1.83	4500 
77	1.69	4500 
78	1.44	4500 
79	1.50	4500 
80	1.36	4700 
81	1.01	4500 
82	1.05	4500 
83	0.94	5100 
84	0.92	4500 
85	0.94	4800 
86	0.90	4500 
87	0.90	4500];
    
%TE MATRIX
TE = [1	14.03	7900 
2	12.08	7800 
3	9.73	5700 
4	9.33	7100 
5	8.67	6200 
6	8.72	5400 
7	7.68	5400 
8	7.87	5500 
9	7.30	5700 
10	7.27	5400 
11	6.79	4900 
12	6.33	5100 
13	6.62	5400 
14	5.73	5100 
15	5.59	5100 
16	5.01	4900 
17	4.99	5100 
18	4.98	5000 
19	4.61	5000 
20	3.39	4500 
21	3.32	4800 
22	3.25	5300 
23	3.22	5100 
24	3.82	4600 
25	3.15	4500 
26	3.10	4900 
27	3.69	5200 
28	3.62	5000 
29	2.69	4800 
30	2.81	5800 
31	3.17	4800 
32	2.76	4700 
33	2.32	4800 
34	2.51	4800 
35	2.12	4500 
36	2.12	4600 
37	1.90	4900 
38	2.08	4500 
39	1.66	4600 
40	1.58	4500 
41	1.43	4600 
42	0.89	4900 
43	0.90	4500];

%K MATRIX
K = [1	9.07	5400 
2	8.96	5400 
3	8.96	5100 
4	8.66	5300 
5	8.67	4600 
6	8.62	4900 
7	8.58	4800 
8	8.55	4600 
9	8.41	5000 
10	8.11	4700 
11	7.88	4500 
12	7.90	5000 
13	7.81	5000 
14	7.74	5100 
15	7.75	4800 
16	7.67	4900 
17	7.64	4900 
18	7.56	4900 
19	7.50	4600 
20	7.36	4900 
21	7.06	5000 
22	6.66	5100 
23	6.57	4700 
24	5.34	4600]; 

%DEF MATRIX
D  = [1	10.95	5600 
2	10.72	5500 
3	10.18	4800 
4	9.86	4800 
5	9.40	4800 
6	9.37	5300 
7	9.21	5200 
8	9.30	4900 
9	8.88	5200 
10	7.24	4900 
11	7.56	4900 
12	7.64	5000 
13	7.74	4700 
14	7.13	4600 
15	7.18	4800 
16	7.04	4700 
17	7.35	5100 
18	6.68	4500 
19	4.67	4800 
20	3.85	5100 
21	4.02	5100 
22	3.63	4500 
23	3.40	4600 
24	3.12	4500]; 

length_P_new = 0;

while N ~= length_P_new

%GENERATING THE INITIAL POPULATION
for i = 1:N               
    P(i,1) = randi(length(QB),1);           %ONE QB GENE
    P(i,(2:3)) = randperm(length(RB),2);    %TWO RB GENES
    P(i,(4:6)) = randperm(length(WR),3);    %THREE WR GENES
    P(i,7) = randi(length(TE),1);           %ONE TE GENE
    P(i,8) = randi(length(K),1);            %ONE K GENE
    P(i,9) = randi(length(D),1);            %ONE D GENE
end

%LOOKING UP THE FANTASY POINTS AND COST OF THE QB
for i=1:N;
    for j=1:length(QB);
        if P(i,1)==QB(j,1);
           FantasyPoints(i,1)=QB(j,2);      %BUILDING THE FANTASY POINTS MATRIX
           cost(i,1)=QB(j,3);               %BUILDING THE COST MATRIX
        end
    end
end

%LOOKING UP THE FANTASY POINTS AND COST OF THE FIRST RB
for i=1:N;
    for j=1:length(RB);
        if P(i,2)==RB(j,1);
           FantasyPoints(i,2)=RB(j,2);      %BUILDING THE FANTASY POINTS MATRIX
           cost(i,2)=RB(j,3);               %BUILDING THE COST MATRIX
        end
    end
end

%LOOKING UP THE FANTASY POINTS AND COST OF THE SECOND RB
for i=1:N;
    for j=1:length(RB);
        if P(i,3)==RB(j,1);
           FantasyPoints(i,3)=RB(j,2);      %BUILDING THE FANTASY POINTS MATRIX
           cost(i,3)=RB(j,3);               %BUILDING THE COST MATRIX
        end
    end
end

%LOOKING UP THE FANTASY POINTS AND COST OF THE FIRST WR
for i=1:N;
    for j=1:length(WR);
        if P(i,4)==WR(j,1);
           FantasyPoints(i,4)=WR(j,2);      %BUILDING THE FANTASY POINTS MATRIX
           cost(i,4)=WR(j,3);               %BUILDING THE COST MATRIX
        end
    end
end

%LOOKING UP THE FANTASY POINTS AND COST OF THE SECOND WR
for i=1:N;
    for j=1:length(WR);
        if P(i,5)==WR(j,1);
           FantasyPoints(i,5)=WR(j,2);      %BUILDING THE FANTASY POINTS MATRIX
           cost(i,5)=WR(j,3);               %BUILDING THE COST MATRIX
        end
    end
end

%LOOKING UP THE FANTASY POINTS AND COST OF THE THIRD WR
for i=1:N;
    for j=1:length(WR);
        if P(i,6)==WR(j,1);
           FantasyPoints(i,6)=WR(j,2);      %BUILDING THE FANTASY POINTS MATRIX
           cost(i,6)=WR(j,3);               %BUILDING THE COST MATRIX
        end
    end
end

%LOOKING UP THE FANTASY POINTS AND COST OF THE TE
for i=1:N;
    for j=1:length(TE);
        if P(i,7)==TE(j,1);
           FantasyPoints(i,7)=TE(j,2);      %BUILDING THE FANTASY POINTS MATRIX
           cost(i,7)=TE(j,3);               %BUILDING THE COST MATRIX
        end
    end
end

%LOOKING UP THE FANTASY POINTS AND COST OF THE K
for i=1:N;
    for j=1:length(K);
        if P(i,8)==K(j,1);
           FantasyPoints(i,8)=K(j,2);      %BUILDING THE FANTASY POINTS MATRIX
           cost(i,8)=K(j,3);               %BUILDING THE COST MATRIX
        end
    end
end

%LOOKING UP THE FANTASY POINTS AND COST OF THE D
for i=1:N;
    for j=1:length(D);
        if P(i,9)==D(j,1);
           FantasyPoints(i,9)=D(j,2);      %BUILDING THE FANTASY POINTS MATRIX
           cost(i,9)=D(j,3);               %BUILDING THE COST MATRIX
        end
    end
end

for i=1:N
    FP(i)=sum(FantasyPoints(i,:));          %CALCULATING THE TOTAL FANTASY POINTS FOR A TEAM
    c(i)=sum(cost(i,:));                    %CALCULATING THE TOTAL COST OF A TEAM
end

for i=1:N
    P(i,10)=FP(i);                          %PUTTING THE FANTASY POINTS NEXT TO THE TEAM (position 10)
    P(i,11)=c(i);                           %PUTTING THE COST OF THE TEAM IN THE LAST COLUMN (position 11)
end

format short g



%==================ELIMINATING TEAMS OVER THE SALARY CAP===================
for i=1:N;
    if P(i,11)<=60000;
        P_new(i,:)=P(i,:);
    end
end
P_new;


P_new = P_new(any(P_new,2),:);                %ELIMINATING ROWS OF ZEROS
length_P_new = length(P_new);
end
%==========================================================================
%==========================================================================
FP = 0;
c = 70000;

counter = 0;

k = 0;
for i = 1:GEN
% =======================TOURNAMENT SELECTION==============================
% 
% TOURNAMENTS INVOLVE SELECTING 6 GENES AT RANDOM AND THEN PERFORMING
% TOURNAMENTS TO SELECT A WINNER
% THE WINNERS WILL BE USED DURING THE RECOMBINATION TO PRODUCE TWO OFFSPRING

%s  = 5;                                         %TOURNAMENT LENGTH
w = 0;

pop_size = 0;

    while pop_size < N
        c = 70000;
        while c > 60000
            for i=1:2;
                T = randperm(N,s);                          %ARRAY OF RANDOM PERM TO SELECT TEAM
                Mx = 0;                                     %MAX FITNESS IN TOURNAMENT
                for j=1:s;
                    if P_new(T(j),10) > Mx;                 %FITNESS EVALUATION (FANTASY POINTS)
                        Mx = P_new(T(j),10);                %CREATE THE MOST FIT TEAM
                        w(i,1) = T(j);                      %WINNER COLUMN VECTOR
                    end
                end
            end

% ====================END OF TOURNAMENT SELECTION==========================


%BUILDING THE PARENT MATRIX OF WINNERS FOR RECOMBINATION
Parent1 = P_new(w(1),:);
Parent2 = P_new(w(2),:);

%=========================RECOMBINATION====================================
%THE FOR LOOP BELOW BUILDS THE PARENT POPULATION MATRIX USING THE WINNERS
%(ROWS) FROM THE POPULATION


CrossoverPoints = [2 4 7 8];

Child = zeros(1,9);
r = randi([1,4],1);
cp = CrossoverPoints(r);
    for j = 1:(cp-1)
        Child(1,j) = Parent1(1,j);
    end
    for j = cp:G
        Child(1,j) = Parent2(1,j);
    end
% cp
% Parent1
% Parent2
% Child

%=========================END OF RECOMBINATION============================


%============================== MUTATION =================================

%MUTATION FOR CHILD 1 QB

    rr = rand;
    if rr < 0.05
        QB_dummy = QB(:,1);
        QB_dummy(Child(1,1),1) = 0;
        QB_dummy = QB_dummy(any(QB_dummy,2),:);            %ELIMINATING ROWS OF ZEROS
        newQB = datasample(QB_dummy,1);
        Child(1,1) = newQB;
    end


%MUTATION FOR CHILD RB1

    rr = rand;
    if rr < 0.05
        RB_dummy = RB(:,1);
        RB_dummy(Child(1,2),1) = 0;
        RB_dummy = RB_dummy(any(RB_dummy,2),:);            %ELIMINATING ROWS OF ZEROS
        newRB = datasample(RB_dummy,1);
        Child(1,2) = newRB;
    end


%MUTATION FOR CHILD RB2

    rr = rand;
    if rr < 0.05
        RB_dummy = RB(:,1);
        RB_dummy(Child(1,3),1) = 0;
        RB_dummy = RB_dummy(any(RB_dummy,2),:);            %ELIMINATING ROWS OF ZEROS
        newRB = datasample(RB_dummy,1);
        Child(1,3) = newRB;
    end

   
%MUTATION FOR CHILD WR1

    rr = rand;
    if rr < 0.05
        WR_dummy = WR(:,1);
        WR_dummy(Child(1,4),1) = 0;
        WR_dummy = WR_dummy(any(WR_dummy,2),:);            %ELIMINATING ROWS OF ZEROS
        newWR = datasample(WR_dummy,1);
        Child(1,4) = newWR;
    end

%MUTATION FOR CHILD WR2

    rr = rand;
    if rr < 0.05
        WR_dummy = WR(:,1);
        WR_dummy(Child(1,5),1) = 0;
        WR_dummy = WR_dummy(any(WR_dummy,2),:);            %ELIMINATING ROWS OF ZEROS
        newWR = datasample(WR_dummy,1);
        Child(1,5) = newWR;
    end

%MUTATION FOR CHILD WR3

    rr = rand;
    if rr < 0.05
        WR_dummy = WR(:,1);
        WR_dummy(Child(1,6),1) = 0;
        WR_dummy = WR_dummy(any(WR_dummy,2),:);            %ELIMINATING ROWS OF ZEROS
        newWR = datasample(WR_dummy,1);
        Child(1,6) = newWR;
    end


%MUTATION FOR CHILD TE

    rr = rand;
    if rr < 0.05
        TE_dummy = TE(:,1);
        TE_dummy(Child(1,7),1) = 0;
        TE_dummy = TE_dummy(any(TE_dummy,2),:);            %ELIMINATING ROWS OF ZEROS
        newTE = datasample(TE_dummy,1);
        Child(1,7) = newTE;
    end


%MUTATION FOR CHILD K

    rr = rand;
    if rr < 0.05
        K_dummy = K(:,1);
        K_dummy(Child(1,8),1) = 0;
        K_dummy = K_dummy(any(K_dummy,2),:);            %ELIMINATING ROWS OF ZEROS
        newK = datasample(K_dummy,1);
        Child(1,8) = newK;
    end


%MUTATION FOR CHILD DEF

    rr = rand;
    if rr < 0.05
        D_dummy = D(:,1);
        D_dummy(Child(1,9),1) = 0;
        D_dummy = D_dummy(any(D_dummy,2),:);            %ELIMINATING ROWS OF ZEROS
        newD = datasample(D_dummy,1);
        Child(1,9) = newD;
    end

% Child
FantasyPoints = zeros(1,9);
cost = zeros(1,9);
%==========================END OF MUTATION=================================
%LOOKING UP THE FANTASY POINTS AND COST OF THE QB

    for j=1:length(QB);
        if Child(1,1)==QB(j,1);
           FantasyPoints(1,1)=QB(j,2);      %BUILDING THE FANTASY POINTS MATRIX
           cost(1,1)=QB(j,3);               %BUILDING THE COST MATRIX
        end
    end
    
%LOOKING UP THE FANTASY POINTS AND COST OF THE FIRST RB

    for j=1:length(RB);
        if Child(1,2)==RB(j,1);
           FantasyPoints(1,2)=RB(j,2);      %BUILDING THE FANTASY POINTS MATRIX
           cost(1,2)=RB(j,3);               %BUILDING THE COST MATRIX
        end
    end    
    
%LOOKING UP THE FANTASY POINTS AND COST OF THE SECOND RB

    for j=1:length(RB);
        if Child(1,3)==RB(j,1);
           FantasyPoints(1,3)=RB(j,2);      %BUILDING THE FANTASY POINTS MATRIX
           cost(1,3)=RB(j,3);               %BUILDING THE COST MATRIX
        end
    end
    
%LOOKING UP THE FANTASY POINTS AND COST OF THE FIRST WR

    for j=1:length(WR);
        if Child(1,4)==WR(j,1);
           FantasyPoints(1,4) = WR(j,2);      %BUILDING THE FANTASY POINTS MATRIX
           cost(1,4) = WR(j,3);               %BUILDING THE COST MATRIX
        end
    end    

%LOOKING UP THE FANTASY POINTS AND COST OF THE SECOND WR

    for j=1:length(WR);
        if Child(1,5)==WR(j,1);
           FantasyPoints(1,5) = WR(j,2);      %BUILDING THE FANTASY POINTS MATRIX
           cost(1,5) = WR(j,3);               %BUILDING THE COST MATRIX
        end
    end
    
%LOOKING UP THE FANTASY POINTS AND COST OF THE THIRD WR

    for j=1:length(WR);
        if Child(1,6)==WR(j,1);
           FantasyPoints(1,6) = WR(j,2);      %BUILDING THE FANTASY POINTS MATRIX
           cost(1,6) = WR(j,3);               %BUILDING THE COST MATRIX
        end
    end    
    
    
%LOOKING UP THE FANTASY POINTS AND COST OF THE TE

    for j=1:length(TE);
        if Child(1,7) == TE(j,1);
           FantasyPoints(1,7) = TE(j,2);      %BUILDING THE FANTASY POINTS MATRIX
           cost(1,7) = TE(j,3);               %BUILDING THE COST MATRIX
        end
    end    
    
    
%LOOKING UP THE FANTASY POINTS AND COST OF THE K

    for j=1:length(K);
        if Child(1,8) == K(j,1);
           FantasyPoints(1,8) = K(j,2);      %BUILDING THE FANTASY POINTS MATRIX
           cost(1,8) = K(j,3);               %BUILDING THE COST MATRIX
        end
    end    
    
    
%LOOKING UP THE FANTASY POINTS AND COST OF THE D

    for j=1:length(D);
        if Child(1,9) == D(j,1);
           FantasyPoints(1,9) = D(j,2);      %BUILDING THE FANTASY POINTS MATRIX
           cost(1,9) = D(j,3);               %BUILDING THE COST MATRIX
        end
    end    

    FP = sum(FantasyPoints(1,:));          %CALCULATING THE TOTAL FANTASY POINTS FOR A TEAM
    c = sum(cost(1,:));                    %CALCULATING THE TOTAL COST OF A TEAM
    
end
pop_size = pop_size + 1;
P_temp(pop_size,(1:9)) = Child(1,:);
P_temp(pop_size,10) = FP;
P_temp(pop_size,11) = c;

end
GEN;
P_new = 0;
P_new = P_temp;
k = k + 1;
Best_team(k) = max(P_new(:,10));


end
Best_team(k)
Team = zeros(1,11);
for i = 1:length(P_new(:,1))
    if P_new(i,10) == Best_team(k);
        Team = P_new(i,:);
    end
end
Team
x = [1:GEN];
plot(x,Best_team);
xlabel('Generation')
ylabel('Score')
toc
%filename = 'new_write.xlsx'
%xlsappend(filename,Team)
format short g

end

'Code has finished'









