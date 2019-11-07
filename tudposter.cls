% !TeX program = xelatex
%==============================================================================
% tudposter.cls 
% A LaTeX class for creating posters
% Implements the TU Delft style
% Written by Vincent Verdult (v.verdult@dcsc.tudelft.nl)
%
% $Id: tudposter.cls,v 1.2 2003/11/23 09:50:47 vverdult Exp $
%
% 2004/05/13: Added InstitutionURL field (Rudy Negenborn)
%             usage: \institutionurl{http://www.dcsc.tudelft.nl/}
%
% 2005/05/27: Added DCSC-logo (Redouane Hallouzi)
%
% 2019/10/25: Complete redesign of template, add wind turbines,
%             Update DCSC logo, add email, add banners for each
% 			  section.
%
%==============================================================================
\ProvidesClass{tudposter}[2003/10/26, v. 1.0] 
\RequirePackage{ifthen}

\newif\if@windtemplate
\@windtemplatefalse % Default option to generic
\DeclareOption{wind}{\@windtemplatetrue}
\DeclareOption{generic}{\@windtemplatefalse}

%\ExecuteOptions{}
\ProcessOptions

\LoadClass[portrait]{a0poster}
\RequirePackage{pstricks}
\RequirePackage{pst-grad}
\RequirePackage{pstricks-add}
\RequirePackage{graphicx}
\usepackage{array}

\newrgbcolor{dark}{0 0 .4}
\newrgbcolor{tudblue}{0 .6 .8}
\definecolor{tudblue}{cmyk}{1 0 0 0}
\newrgbcolor{tudyellow}{1 0.77 0}
\definecolor{tudyellow}{rgb}{1 .77 0}

% Set text margins
\usepackage{geometry}
\geometry{
	bindingoffset=0mm,
	left=25mm,
	right=-10mm,
	top=20mm,
	bottom=100mm,
%	showframe
}


\renewcommand{\maketitle}[5]{
	\setmainfont[Ligatures=TeX,Path=./fonts/]{GeosansLight.ttf}
	\begin{minipage}{.74\textwidth}
		\centering \textcolor{white}{\textbf{\fontsize{150}{150}\selectfont {#1}}}
	\end{minipage} \hfill
	\begin{minipage}{.25\textwidth}
		%\vspace{-10mm}
		\hfill~\fbox{\includegraphics[width=105mm,clip,trim=0 1cm 0 0]{#2}}\\
		\textcolor{white}{\hfill \textbf{\underline{#3}}} \vspace{5mm}
		\begin{flushright}\begin{tabular}{r r}
				\Large \textcolor{white}{\textbf{#4}} & \includegraphics[height=8mm]{images/mail.png} \\
				%	\Large \textcolor{white}{\textbf{github.com/bartdoekemeijer}} & \includegraphics[height=8mm]{images/github.png} \\ % GITHUB
				\Large \textcolor{white}{\textbf{#5}} & \includegraphics[height=8mm]{images/linkedin.png}  % LINKEDIN		
			\end{tabular}
		\end{flushright}
	\end{minipage} 
	\vspace*{25mm}
}

%% Define new style/command for the section
\renewcommand\section[1]{% Section header
	\begin{minipage}[t]{\linewidth}
		\includegraphics[width=\columnwidth,height=3cm,clip,trim=50cm 43cm 50cm 0]{images/wigglylines.pdf}
		\vspace{-5.5cm}
		\begin{center} 
			\vspace{.8cm} % Position section title on top of blue bar
			{\Huge\textbf{\textcolor{white}{\textsc{#1}}}}\\ % Title name
		\end{center}
		\if@windtemplate
		\vspace{-3.2cm}
		\hfill \includegraphics[width=9cm]{images/turbines_white.png} % Plot images behind title
		\fi
\end{minipage}}




%% Format top blue space, bottom blue space, and logos
\AtBeginDocument{%
 \if@windtemplate
	\vspace{-2cm}
\fi  
 \rput[tl](-3cm,7cm){\includegraphics[width=100cm]{images/wigglylines.pdf}} % Image with pattern and gradient	
% \rput[lb](-10,-20){\includegraphics[width=100cm]{images/wigglylines.pdf}} % Image with pattern and gradient
% \psframe[linestyle=none,fillstyle=solid,fillcolor=tudblue](-5,15)(82,-19) % Uniform colorbox at top
% \psframe[linestyle=none,fillstyle=solid,fillcolor=tudblue](-3.1,-107)(82,-116) % Uniform colorbox at bottom
 \if@windtemplate
 \rput[lb](65,-114){\includegraphics[height=220mm]{images/smallturbines.pdf}} % Image with blue wind turbines on the bottom
 \fi  
 \rput[tl](-3cm,-110cm){\includegraphics[width=100cm]{images/wigglylines.pdf}} % Image with pattern and gradient
 \if@windtemplate
 \rput[bl](68,-118.6){\includegraphics[height=85mm]{images/tudwindlogo_white.eps}} % TUDelft-wind logo
 \else
 \rput[bl](71,-118.6){\includegraphics[height=85mm]{images/tudlogo_white.eps}} % TUDelft logo
 \fi
 \rput[bl](-0.5,-116.4){\includegraphics[height=50mm]{images/ddclogo.png}} % DDC logo
 %\rput[bl](-1,-117.4){\includegraphics[height=75mm]{images/DCSC_logoWhite.png}} % DCSC logo
 \rput[bl](7.5,-117.5){\includegraphics[height=75mm]{images/DCSC_logoWhite.png}} % DCSC logo
}