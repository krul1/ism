function varargout = ISM_ver0(varargin)
% ISM_VER0 MATLAB code for ISM_ver0.fig
%      ISM_VER0, by itself, creates a new ISM_VER0 or raises the existing
%      singleton*.
%
%      H = ISM_VER0 returns the handle to a new ISM_VER0 or the handle to
%      the existing singleton*.
%
%      ISM_VER0('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ISM_VER0.M with the given input arguments.
%
%      ISM_VER0('Property','Value',...) creates a new ISM_VER0 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ISM_ver0_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ISM_ver0_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ISM_ver0

% Last Modified by GUIDE v2.5 06-Feb-2017 11:10:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ISM_ver0_OpeningFcn, ...
                   'gui_OutputFcn',  @ISM_ver0_OutputFcn, ...
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


% --- Executes just before ISM_ver0 is made visible.
function ISM_ver0_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ISM_ver0 (see VARARGIN)

% Choose default command line output for ISM_ver0
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ISM_ver0 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ISM_ver0_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in inputbtn.
function inputbtn_Callback(hObject, eventdata, handles)
% hObject    handle to inputbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fileName;
global M;
[fileName,pathName] = uigetfile({'*.xlsx';'*.xls'},'Excel Files');
file = fullfile(pathName,fileName);
m = xlsread(file);
M = binary(m);
f = figure;
uitable('Parent',f,'Data',M);




function filetxt_Callback(hObject, eventdata, handles)
% hObject    handle to filetxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of filetxt as text
%        str2double(get(hObject,'String')) returns contents of filetxt as a double


% --- Executes during object creation, after setting all properties.
function filetxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filetxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in reachbtn.
function reachbtn_Callback(hObject, eventdata, handles)
% hObject    handle to reachbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global M;
f = figure;
m = reach(M);
uitable('Parent',f,'Data',m);