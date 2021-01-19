\documentclass{article}
\usepackage{booktabs}
\usepackage[landscape]{geometry}
\geometry{a4paper,left=10mm,right=10mm, top=1cm, bottom=1cm}
\usepackage{ltablex}
\begin{document}

\begin{tabularx}{\linewidth}{Xrrrrrrrr}
        \toprule
        \textbf{total inputs: \VAR{total}}
{% for s in solvers %} & \texttt{\VAR{solvernames[s]}}{% endfor %}
        \\
        \midrule
{% for d in data %}
        \textbf{\VAR{datanames[d]}}
        {% for s in solvers %} & \VAR{data[d][s]}{% endfor %} \\
{% endfor %}
        \bottomrule
\end{tabularx}

\end{document}
