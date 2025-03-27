%Pong Game by Shravan



global paddley speed

figure('color','black','KeyPressFcn',@keyPress)
axis([1 100 0 100])
axis manual
hold on
set(gca,'color','black','xtick',[],'ytick',[])

ballpos = [50 50];
ballvel = [0.5 0.5];
paddley = 45;
paddlewidth = 2;
paddleheight = 10;
speed = 2;


while true
    cla
    rectangle('Position',[ballpos 2 2],'Curvature',[1 1],'FaceColor','white')
    rectangle('Position',[5 paddley paddlewidth paddleheight],'FaceColor','white')
    
    ballpos = ballpos+ballvel;
    
    if ballpos(1)<=0 || ballpos(1)>=98
        ballvel(1) = -ballvel(1);
    end
    if ballpos(2)<=0 || ballpos(2)>=98
        ballvel(2) = -ballvel(2);
    end
    if ballpos(1)<=7 && ballpos(2)>=paddley &&  ballpos(2)<=paddley+paddleheight
        ballvel(1) = -ballvel(1);
    end
    
    pause(0.01)
end


function keyPress(~,event)
    global paddley speed
    switch event.Key
        case 'uparrow'
            paddley = min(paddley+speed,90);
        case 'downarrow'
            paddley = max(paddley-speed,0);
    end
end








