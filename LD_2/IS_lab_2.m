x = linspace(0,1,20);
d = ((1 + 0.6 * sin (2 * pi * x / 0.7)) + 0.3 * sin (2 * pi * x)) / 2;
xtest = linspace(0,1,50);
n = .15;

w1_1 = randn(1);
w1_2 = randn(1);
w1_3 = randn(1);
w1_4 = randn(1);
w1_5 = randn(1);

w2_1 = randn(1);
w2_2 = randn(1);
w2_3 = randn(1);
w2_4 = randn(1);
w2_5 = randn(1); 

b1_1 = randn(1);
b1_2 = randn(1);
b1_3 = randn(1);
b1_4 = randn(1);
b1_5 = randn(1);
b1_6 = randn(1);

for j = 1:2000000
    for i = 1:20
        v1_1 = w1_1*x(i)+b1_1;
        v1_2 = w1_2*x(i)+b1_2;
        v1_3 = w1_3*x(i)+b1_3;
        v1_4 = w1_4*x(i)+b1_4;
        v1_5 = w1_5*x(i)+b1_5;

        y1_1 = 1/(1+exp(-v1_1));
        y1_2 = 1/(1+exp(-v1_2));
        y1_3 = 1/(1+exp(-v1_3));
        y1_4 = 1/(1+exp(-v1_4));
        y1_5 = 1/(1+exp(-v1_5));

        v_2 = y1_1*w2_1 + y1_2*w2_2 + y1_3*w2_3 + y1_3*w2_3 + y1_4*w2_4 + y1_4*w2_4 + y1_5*w2_5 + b1_6;
        y = v_2;

        e = d(i) - y;

        w2_1 = w2_1 + n * e * y1_1;
        w2_2 = w2_2 + n * e * y1_2;
        w2_3 = w2_3 + n * e * y1_3;
        w2_4 = w2_4 + n * e * y1_4;
        w2_5 = w2_5 + n * e * y1_5;

        b1_6 = b1_6 + n * e;

        delta1 = y1_1*(1-y1_1)*e*w2_1;
        delta2 = y1_2*(1-y1_2)*e*w2_2;
        delta3 = y1_3*(1-y1_3)*e*w2_3;
        delta4 = y1_4*(1-y1_4)*e*w2_4;
        delta5 = y1_5*(1-y1_5)*e*w2_5;

        w1_1 = w1_1+n*delta1*x(i);
        w1_2 = w1_2+n*delta2*x(i);
        w1_3 = w1_3+n*delta3*x(i);
        w1_4 = w1_4+n*delta4*x(i);
        w1_5 = w1_5+n*delta5*x(i);

        b1_1 = b1_1 + n * delta1;
        b1_2 = b1_2 + n * delta2;
        b1_3 = b1_3 + n * delta3;
        b1_4 = b1_4 + n * delta4;
        b1_5 = b1_5 + n * delta5;
    end
end



for i = 1:20
    v1_1 = w1_1*x(i)+b1_1;
    v1_2 = w1_2*x(i)+b1_2;
    v1_3 = w1_3*x(i)+b1_3;
    v1_4 = w1_4*x(i)+b1_4;
    v1_5 = w1_5*x(i)+b1_5;
    
    y1_1 = 1/(1+exp(-v1_1));
    y1_2 = 1/(1+exp(-v1_2));
    y1_3 = 1/(1+exp(-v1_3));
    y1_4 = 1/(1+exp(-v1_4));
    y1_5 = 1/(1+exp(-v1_5));
    
    v_2 = y1_1*w2_1 + y1_2*w2_2 + y1_3*w2_3 + y1_3*w2_3 + y1_4*w2_4 + y1_4*w2_4 + y1_5*w2_5 + b1_6;
    Y(i) = v_2;
end

plot(x, d, x, Y)
    





