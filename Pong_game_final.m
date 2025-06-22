%PONG GAME BY SHRAVAN
%VERSION 2.0

%HELP: USE ARROW UP AND DOWN KEYS TO MOVE THE PADDLE



function Pong_game_final

global paddley speed

figure('color','black','KeyPressFcn',@keyPress)
axis([0 100 0 100])
axis manual
hold on
set(gca,'color','black','xtick',[],'ytick',[])

x = rand();
y = rand();


if x<0.5
    ballvel = [0.6 -0.6];
    ballpos = [50 50];
end
if x>0.5
    ballvel = [0.5 0.5];
    ballpos = [80 50];
end
if y<=0.1
    ballvel = [-0.5 -0.5];
    ballpos = [50 80];
end
if y<=0.2 && y>0.1
    ballvel = [0.6 0.6];
    ballpos = [90 30];
end
if y<=0.4 && y>0.2
    ballvel = [0.6 -0.6];
    ballpos = [60 10];
end
if y<=0.6 && y>0.4
    ballvel = [0.6 0.6];
    ballpos = [70 80];
end
if y<=0.8 && y>0.6
    ballvel = [-0.5 0.5];
    ballpos = [50 50];
end
if y<=0.9 && y>0.8
    ballvel = [0.6 0.6];
    ballpos = [90 90];
end
if y<=1 && y>0.9
    ballvel = [0.5 -0.5];
    ballpos = [90 20];
end


paddley = 45;
paddlewidth = 2;
paddleheight = 20;
speed = 7;
score = 0;
level = 1;
levelcount = 0;


while true
    cla
    rectangle('Position',[ballpos 2 2],'Curvature',[1 1],'FaceColor','white')
    rectangle('Position',[0 paddley paddlewidth paddleheight],'FaceColor','white')
    
    text(80, 90, ['Score: ' num2str(score)], 'color', 'white', 'FontSize',15)
    text(45, 90, ['Level: ' num2str(level)], 'color', 'white', 'FontSize',15)
    
    ballpos = ballpos + ballvel;
    
    if ballpos(1)>=98
        ballvel(1) = -ballvel(1);
    end
    if ballpos(1)<=0
        text(25, 50, 'GAME OVER', 'color', 'red', 'FontSize',30)
        break
    end
    if ballpos(2)<=0 || ballpos(2)>=98
        ballvel(2) = -ballvel(2);
    end
    if ballpos(1)<=2 && ballpos(2)>=paddley &&  ballpos(2)<=paddley+paddleheight
        ballvel(1) = -ballvel(1);
        score = score + 1;
    end
    
    % Levels below (only 6 for now):
    if score==5
        if levelcount==0
            levelcount = 1;
            level = 2;
            paddleheight = 15;
            ballvel = [0.7 0.7];
        end
    end
    
    if score==10
        level = 3;
        levelcount = 0;
        paddleheight = 14;
        speed = 6;
    end
    
    if score==15
        if levelcount==0
            levelcount = 1;
            level = 4;
            paddleheight = 12;
            ballvel = [0.8 0.8];
        end
    end
    
    if score==20
        level = 5;
        levelcount = 0;
        paddleheight = 10;
        speed = 5;
    end
    
    if score==25
        if levelcount==0
            levelcount = 1;
            level = 6;
            speed = 4;
            ballvel = [0.9 0.9];
        end
    end
    
    pause(0.01)
end


function keyPress(~, event)
    switch event.Key
        case 'uparrow'
            paddley = min(paddley+speed,80);
        case 'downarrow'
            paddley = max(paddley-speed,0);
    end
end
end








