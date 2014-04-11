function calculator

f=figure('Visible','on','Color','white','Position',[400, 300, 400,500],'MenuBar','None');
set(f,'Name','Calculator');
%htext=uicontrol('Style','text','Position',[200,200, 100,50], 'String','My First GUI string');   
%movegui(f,'center');


global currentVal;
currentVal='0';

global val1;
val1=0;

global val2;
val2=0;

global operator;
operator='';

global answer;
answer = 0;

display=uicontrol('Style','text','Position',[0,400, 400, 100], 'String',currentVal);

%Buttons for digits
cero = uicontrol('Style','pushbutton','String','0','Position',[100,0,100,100],...
    'Callback',@cat);
uno = uicontrol('Style','pushbutton','String','1','Position',[0,100,100,100],...
    'Callback',@cat);
dos = uicontrol('Style','pushbutton','String','2','Position',[100,100,100,100],...
    'Callback',@cat);
tres = uicontrol('Style','pushbutton','String','3','Position',[200,100,100,100],...
    'Callback',@cat);
cuatro = uicontrol('Style','pushbutton','String','4','Position',[0,200,100,100],...
    'Callback',@cat);
cinco = uicontrol('Style','pushbutton','String','5','Position',[100,200,100,100],...
    'Callback',@cat);
seis = uicontrol('Style','pushbutton','String','6','Position',[200,200,100,100],...
    'Callback',@cat);
siete = uicontrol('Style','pushbutton','String','7','Position',[0,300,100,100],...
    'Callback',@cat);
ocho = uicontrol('Style','pushbutton','String','8','Position',[100,300,100,100],...
    'Callback',@cat);
nueve = uicontrol('Style','pushbutton','String','9','Position',[200,300,100,100],...
    'Callback',@cat);

%Buttons for operators
add = uicontrol('Style','pushbutton','String','+','Position',[300,300,100,100],...
    'Callback',@getOperator);
subtract = uicontrol('Style','pushbutton','String','-','Position',[300,200,100,100],...
    'Callback',@getOperator);
multiply = uicontrol('Style','pushbutton','String','*','Position',[300,100,100,100],...
    'Callback',@getOperator);
divide = uicontrol('Style','pushbutton','String','/','Position',[300,0,100,100],...
    'Callback',@getOperator);
equal = uicontrol('Style','pushbutton','String','=','Position',[200,0,100,100],...
    'Callback',@operate);
C = uicontrol('Style','pushbutton','String','C','Position',[0,0,100,100],...
    'Callback',@clear);

set([display,cero,uno,dos,tres,cuatro,cinco,seis,siete,ocho,nueve,add,subtract,multiply,divide,equal,C],...
    'Units','normalized','FontSize',24);


    function cat(s,~)%concatenates numbers when buttons pressed
        if str2num(get(display,'String'))==0 && str2num(get(s,'String'))==0
        elseif str2num(get(display,'String'))==0 && str2num(get(s,'String'))~=0
           set(display,'String', get(s,'String'));  
           currentVal = get(s,'String');
        else
        dig = get(s,'String');
        currentVal = [get(display,'String') dig];
        set(display,'String', currentVal);
        end
        
        
    end 

    function getOperator(s,~) %stores the operator and first number to use later and resets display value
        if isempty(operator)
        operator = get(s,'String');
        val1 = str2num(currentVal);
        currentVal = '0';
        set(display,'String', currentVal);
        else
        end

    end

    function operate(s,~) %computes
        if ~isempty(operator)
            val2 = str2num(currentVal);
            switch operator
                case '+'
                    answer = val1 + val2;
                    currentVal = num2str(answer);
                    set(display,'String', currentVal);
                    
                case '-'
                    answer = val1 - val2;
                    currentVal = num2str(answer);
                    set(display,'String', currentVal);
                case '*'
                    answer = val1*val2;
                    currentVal = num2str(answer);
                    set(display,'String', currentVal);
                case '/'
                    if val2==0
                        set(display,'String', {'Cannot Divide by Zero!','Please clear and try again.'});

                    else
                        answer = val1/val2;
                        currentVal = num2str(answer);
                        set(display,'String', currentVal);
                    end
                otherwise
                    val1;
            end
            operator=[];
        end
    end
    
    function clear(s,~)
        currentVal ='0';
        val1 = 0;
        val2 = 0;
        operator = '';
        answer = 0;
        set(display,'String', currentVal);
    end

%{    
   function cat0(~,~)
        if currentVal=='0'; else newVal=[currentVal '0']; end 
        set(display,'String',newVal)
    end

    function cat1(~,~) currentVal=strcat(f.currentVal,'1');
        end

    function cat2(~,~)
        currentVal=strcat(currentVal,'2');
    end

    function cat3(~,~)
        currentVal=strcat(currentVal,'3');
    end

    function cat4(~,~)
        currentVal=strcat(currentVal,'4'); end

    function cat5(~,~)
        currentVal=strcat(currentVal,'5');

    end

    function cat6(~,~)
        currentVal=strcat(currentVal,'6');

    end

    function cat7(~,~)
        currentVal=strcat(currentVal,'7');

    end

    function cat8(~,~)
        currentVal=strcat(currentVal,'8');
    end

    function cat9(~,~)
        currentVal=strcat(currentVal,'9');
    end
   
while true
    display currentVal; switch button
        case uno
            
    end
end
%}

end