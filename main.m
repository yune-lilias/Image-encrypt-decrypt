function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 25-Apr-2021 22:16:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in reselect.
function reselect_Callback(hObject, eventdata, handles)
% hObject    handle to reselect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    global im;
    defaultFileName = fullfile( '*.*');
    file = uigetfile(defaultFileName, 'Select a file');
    im = imread(file);
        set(handles.axes2,'visible','off');
 set(handles.axes3,'visible','off');
     cla(handles.axes1);
 cla(handles.axes2);
 cla(handles.axes3);
     axes(handles.axes1);
     imshow(im);
     set(handles.axes1,'visible','on');
     axis off;
     set(handles.select,'visible','off');
     set(handles.choice,'visible','on');
     set(handles.reselect,'visible','on');
     set(handles.encode,'visible','on');
     set(handles.decode,'visible','on');
       set(handles.save,'visible','off');
catch ee
    f = msgbox('Please select an image');
end

% --- Executes on button press in encode.
function encode_Callback(hObject, eventdata, handles)
% hObject    handle to encode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im imnew;
radio1Value = get(handles.choi1, 'Value');
radio2Value = get(handles.choi2, 'Value');
 if(radio1Value)
    imnew = encode(im);
 else
     set(handles.password,'visible','on');
     imnew = encode(im,handles.password.String);
 end
 set(handles.axes1,'visible','off');
 cla(handles.axes1);
 cla(handles.axes2);
 cla(handles.axes3);

 axes(handles.axes2);
     imshow(im);
  set(handles.axes2,'visible','on');
  axis off;
  axes(handles.axes3);
     imshow(imnew);
      set(handles.axes3,'visible','on');
      axis off;
    set(handles.save,'visible','on');



function password_Callback(hObject, eventdata, handles)
% hObject    handle to password (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of password as text
%        str2double(get(hObject,'String')) returns contents of password as a double


% --- Executes during object creation, after setting all properties.
function password_CreateFcn(hObject, eventdata, handles)
% hObject    handle to password (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in select.
function select_Callback(hObject, eventdata, handles)
% hObject    handle to select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    global im;
    defaultFileName = fullfile('*.*');
    file = uigetfile(defaultFileName, 'Select a file');
    im = imread(file);
     axes(handles.axes1);
     imshow(im);
     set(handles.axes1,'visible','on');
     axis off;
     set(handles.select,'visible','off');
     set(handles.label1,'visible','off');
     set(handles.label2,'visible','off');
     set(handles.label3,'visible','off');
     set(handles.choice,'visible','on');
     set(handles.reselect,'visible','on');
     set(handles.encode,'visible','on');
     set(handles.decode,'visible','on');
      set(handles.axes2,'visible','off');
 set(handles.axes3,'visible','off');
  set(handles.save,'visible','off');
catch ee
    disp(ee);
     f = msgbox('Please select an image');
end

function choi2_Callback(hObject, eventdata, handles)  

function choi1_Callback(hObject, eventdata, handles)

% --- Executes when selected object is changed in choice.
function choice_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in choice 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
radio1Value = get(handles.choi1, 'Value');
radio2Value = get(handles.choi2, 'Value');
 if(radio1Value)
     set(handles.password,'visible','off');
 else
     set(handles.password,'visible','on');
 end


% --- Executes on button press in decode.
function decode_Callback(hObject, eventdata, handles)
% hObject    handle to decode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im imnew;
radio1Value = get(handles.choi1, 'Value');
radio2Value = get(handles.choi2, 'Value');
 if(radio1Value)
    imnew = decode(im);
 else
     set(handles.password,'visible','on');
     imnew = decode(im,handles.password.String);
 end
 set(handles.axes1,'visible','off');
 cla(handles.axes1);
 cla(handles.axes2);
 cla(handles.axes3);
 set(handles.axes2,'visible','on');
 axes(handles.axes2);
     imshow(im);
     axis off;
 set(handles.axes3,'visible','on');
  axes(handles.axes3);
     imshow(imnew);
      axis off;
 set(handles.save,'visible','on');


% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imnew;
imwrite(imnew,'output.png');
 f = msgbox('The image is saved!');
