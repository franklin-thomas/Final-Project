function [] = graphPlot()
global gui
gui.fig = figure('NumberTitle','off','name','Final Project');
subplot(2,1,1);
plot(0,0);
%Crates figure and blank plot

gui.displayMessage = uicontrol('style','text','units', 'normalized', 'position', ...
    [.034 .28 .13 .095], 'string', 'Coordinate Selectors', 'horizontalalignment', 'right');
gui.displayMessage = uicontrol('style','text','units', 'normalized', 'position', ...
    [.15 .38 .15 .095], 'string', 'x Coordinate(s)', 'horizontalalignment', 'left');
gui.displayMessage = uicontrol('style','text','units', 'normalized', 'position', ...
    [.3 .38 .15 .095], 'string', 'y Coordinate(s)', 'horizontalalignment', 'left');
%Creats labels for edit boxes

gui.xCoordinates = uicontrol('Style','edit','units','normalized','Position',...
    [.18 .28 .1 .06],'String','');
gui.yCoordinates = uicontrol('Style','edit','units','normalized','Position',...
    [.3 .28 .1 .06],'String','');
%Creates edit boxes

gui.plotButton = uicontrol('style','pushbutton','units','normalized','String',...
    'Plot','Position',[.034 .08 .13 .08],'callback',{@plotPoints});
gui.resetButton = uicontrol('Style','pushbutton','Units','normalized','String',...
    'Reset','Position',[.2 .08 .13 .08],'callback',{@resetGraph});
%Creates the reset and plot buttons

%Creates color button group
gui.colors = uibuttongroup('Position',[.5 .08 .13 .4],'Title','Colors');
r1 = uicontrol(gui.colors,'Style',...
                  'radiobutton',...
                  'String','Red',...
                  'units','normalized','Position',[.2 .8 3 .1],...
                  'HandleVisibility','off');
              
r2 = uicontrol(gui.colors,'Style','radiobutton',...
                  'String','Green',...
                  'units','normalized','Position',[.2 .6 3 .1],...
                  'HandleVisibility','off');

r3 = uicontrol(gui.colors,'Style','radiobutton',...
                  'String','Blue',...
                  'units','normalized','Position',[.2 .4 3 .1],...
                  'HandleVisibility','off');
              
% Make the uibuttongroup visible after creating child objects. 
gui.colors.Visible = 'on';

%Makes it so only one selection at a time is possible
    function bselection(source,event)
       disp(['Previous: ' event.OldValue.String]);
       disp(['Current: ' event.NewValue.String]);
       disp('------------------');
    end

%Basically copy/paste gui.colors except change the title and options 
gui.lines = uibuttongroup('Position',[.7 .08 .13 .4],'Title','Line Style');
r1 = uicontrol(gui.lines,'Style',...
                  'radiobutton',...
                  'String','Solid',...
                  'units','normalized','Position',[.2 .8 3 .1],...
                  'HandleVisibility','off');
              
r2 = uicontrol(gui.lines,'Style','radiobutton',...
                  'String','Dashed',...
                  'units','normalized','Position',[.2 .6 3 .1],...
                  'HandleVisibility','off');

r3 = uicontrol(gui.lines,'Style','radiobutton',...
                  'String','Circles',...
                  'units','normalized','Position',[.2 .4 3 .1],...
                  'HandleVisibility','off');
               
gui.lines.Visible = 'on';
   
end

function [] = plotPoints()
global gui
color = gui.colors
style = gui.lines
xArray = gui.xCoordinates.string;
yArray = gui.yCoordinates.string;
if numel(xArray) == numel(yArray)
plot(xArray,yArray,style,color)
end
end

%Resets the graph
function [] = resetGraph()
subplot(2,1,1)
plot(0,0)
end

